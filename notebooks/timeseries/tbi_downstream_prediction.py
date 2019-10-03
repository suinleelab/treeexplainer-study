import sklearn.metrics as metrics
import xgboost as xgb
import numpy as np
import sys, os

DEBUG = False
TBI_FEATS = ["ECGRATE", "ETCO2", "ETSEV", "ETSEVO", "FIO2", "NIBPD", "NIBPM", 
             "NIBPS","PEAK", "PEEP", "PIP", "RESPRATE", "SAO2", "TEMP1", "TV"]

def split_data(DPATH,X_tbi,y_tbi,IDPATH=None,flatten=True):
    if IDPATH is None: IDPATH = DPATH

    sample_tbi_ids = np.load(DPATH+"tbiid.npy",mmap_mode="r")
    unique_tbi_ids = np.unique(sample_tbi_ids)

    # Test and trval splits
    test_tbi_ids  = np.load(IDPATH+"test_tbi_ids.npy")
    trval_tbi_ids = np.load(IDPATH+"trval_tbi_ids.npy")
    sample_trval_tbi_ids = sample_tbi_ids[np.isin(sample_tbi_ids, test_tbi_ids, invert=True)]
    X_test  = X_tbi[np.isin(sample_tbi_ids, test_tbi_ids)]
    X_trval = X_tbi[np.isin(sample_tbi_ids, test_tbi_ids, invert=True)]
    y_test  = y_tbi[np.isin(sample_tbi_ids, test_tbi_ids)]
    y_trval = y_tbi[np.isin(sample_tbi_ids, test_tbi_ids, invert=True)]

    # Train and val split
    valid_tbi_ids = np.load(IDPATH+"valid_tbi_ids.npy")
    X_valid = X_trval[np.isin(sample_trval_tbi_ids, valid_tbi_ids)]
    X_train = X_trval[np.isin(sample_trval_tbi_ids, valid_tbi_ids, invert=True)]
    y_valid = y_trval[np.isin(sample_trval_tbi_ids, valid_tbi_ids)]
    y_train = y_trval[np.isin(sample_trval_tbi_ids, valid_tbi_ids, invert=True)]

    # Reshape
    if flatten:
        X_test  = X_test.reshape(X_test.shape[0],X_test.shape[1]*X_test.shape[2])
        X_valid = X_valid.reshape(X_valid.shape[0],X_valid.shape[1]*X_valid.shape[2])
        X_train = X_train.reshape(X_train.shape[0],X_train.shape[1]*X_train.shape[2])
    else: # Reshape for LSTM (nsamples, time steps, nfeats)
        X_test  = np.swapaxes(X_test,1,2)
        X_valid = np.swapaxes(X_valid,1,2)
        X_train = np.swapaxes(X_train,1,2)
        
    return(X_test, y_test, X_valid, y_valid, X_train, y_train)


####################################
############ XGB CODE ##############
####################################

def train_save_xgb_model(X_train,y_train,X_valid,y_valid,
                         RESDIR,param,hosp_data,data_type):
    # Convert to xgb format
    dtrain = xgb.DMatrix(X_train, label=y_train)
    dvalid = xgb.DMatrix(X_valid, label=y_valid)

    # Train Model and save it
    save_path = RESDIR+"hosp{}_data/{}/".format(hosp_data,data_type)
    if not os.path.exists(save_path): os.makedirs(save_path)
    evallist = [(dvalid,"eval")]
    
    old_stdout = sys.stdout
    sys.stdout = open(save_path+'history.txt', 'w')
    bst = xgb.train(param, dtrain, 2000, evallist, early_stopping_rounds=5)
    sys.stdout = old_stdout
    bst.save_model(save_path+'mod_eta{}.model'.format(param['eta']))
    
def test_xgb_model(X_test,y_test,RESDIR,param,hosp_data,data_type):
    save_path = RESDIR+"hosp{}_data/{}/".format(hosp_data,data_type)
    if DEBUG: print("[DEBUG] Loading model from {}".format(save_path))
    bst = xgb.Booster()
    bst.load_model(save_path+'mod_eta{}.model'.format(param['eta']))
    dtest = xgb.DMatrix(X_test)
    ypred = bst.predict(dtest)
    np.save(save_path+"ypred.npy",ypred)
    np.save(save_path+"y_test.npy",y_test)
    auc = metrics.average_precision_score(y_test, ypred)
    np.random.seed(231)
    auc_lst = []
    roc_auc_lst = []
    for i in range(0,100):
        inds = np.random.choice(X_test.shape[0], X_test.shape[0], replace=True)
        auc = metrics.average_precision_score(y_test[inds], ypred[inds])
        auc_lst.append(auc)
        roc_auc = metrics.roc_auc_score(y_test[inds], ypred[inds])
        roc_auc_lst.append(roc_auc)
    auc_lst = np.array(auc_lst)
    roc_auc_lst = np.array(roc_auc_lst)
    if DEBUG: print("[DEBUG] auc_lst.mean(): {}".format(auc_lst.mean()))
    if DEBUG: print("[DEBUG] roc_auc_lst.mean(): {}".format(roc_auc_lst.mean()))

    SP = RESDIR+"hosp{}_data/".format(hosp_data)
    f = open('{}conf_int_hospdata{}_prauc.txt'.format(SP,hosp_data),'a')
    f.write("{}, {}+-{}\n".format(data_type,auc_lst.mean().round(4),2*np.std(auc_lst).round(4)))
    f.close()
    f = open('{}conf_int_hospdata{}_rocauc.txt'.format(SP,hosp_data),'a')
    f.write("{}, {}+-{}\n".format(data_type,roc_auc_lst.mean().round(4),2*np.std(roc_auc_lst).round(4)))
    f.close()
    np.save("{}auc_lst".format(save_path,data_type), auc_lst)
    np.save("{}roc_auc_lst".format(save_path,data_type), roc_auc_lst)
    
    
####################################
############ LSTM CODE #############
####################################

def load_min_model_helper(MPATH):
    print("[PROGRESS] Starting load_min_model_helper()")
    print("[DEBUG] MPATH {}".format(MPATH))
    mfiles = os.listdir(MPATH)
    full_mod_name = MPATH.split("/")[-1]
    mfiles = [f for f in mfiles if "val_loss" in f]
    loss_lst = [float(f.split("val_loss:")[1].split("_")[0]) for f in mfiles]
    min_ind = loss_lst.index(min(loss_lst))
    min_mod_name = "{}/{}".format(MPATH,mfiles[min_ind])
    print("[DEBUG] min_mod_name {}".format(mfiles[min_ind]))
    return(load_model(min_mod_name))

def create_train_model(opt_name="rmsprop",lr=0.001,drop=0.5,
                       b_size=1000,epoch_num=50,is_tune=False,
                       nodesize=200):
    # Fixed hyperpara
    print("[PROGRESS] Starting create_train_model()")
    h1 = nodesize
    h2 = nodesize
    lookback = 60
    loss_func = "binary_crossentropy"

    # Set opt based on opt_name
    if opt_name is "rmsprop":
        opt = keras.optimizers.RMSprop(lr)
    elif opt_name is "sgd":
        opt = keras.optimizers.SGD(lr)
    elif opt_name is "adam":
        opt = keras.optimizers.Adam(lr)

    # Form the model name (for saving the model)
    mod_name  = "multivariate_biglstmdropoutv3_{}n_{}n_{}ep".format(h1,h2,epoch_num)
    mod_name += "_{}opt_{}lr".format(opt_name,lr)
    mod_name += "_{}drop_{}bs".format(drop,b_size)
    if ISTUNE:
        MODDIR = PATH+"models/tune_biglstm/"+mod_name+"/"
    else:
        MODDIR = PATH+"models/"+mod_name+"/"
    if is_tune: MODDIR = PATH+"models/tune_biglstm/"+mod_name+"/"
    if not os.path.exists(MODDIR): 
        os.makedirs(MODDIR)
        with open(MODDIR+"loss.txt", "w") as f:
            f.write("%s\t%s\t%s\t%s\n" % ("i", "train_loss", "val_loss", "epoch_time"))

        ########## Form Model/Data #########
        X_train_lst = []; X_valid_lst = []; X_test_lst  = []
        sig_lst     = []; encoded_lst = []

        for i in range(0,len(feat_lst2)):
            X_train_lst.append(X_train[:,:,i:(i+1)])
            X_valid_lst.append(X_valid[:,:,i:(i+1)])
            X_test_lst.append(X_test[:,:,i:(i+1)])

            sig = Input(shape=(lookback,1))
            lstm1 = LSTM(h1, recurrent_dropout=drop, return_sequences=True)
            lstm2 = LSTM(h2, recurrent_dropout=drop, dropout=drop)

            encoded = lstm2(lstm1(sig))
            sig_lst.append(sig); encoded_lst.append(encoded)

        merged_vector = keras.layers.concatenate(encoded_lst, axis=-1)
        predictions = Dense(1, activation='sigmoid')(merged_vector)

        model = Model(inputs=sig_lst, outputs=predictions)
        model = multi_gpu_model(model,gpus=GPUNUM)
        model.compile(optimizer=opt, loss=loss_func)

        ########## Training #########
        print("[PROGRESS] Starting train_model()")

        # Train and Save
        start_time = time.time()
        for i in range(0,epoch_num):
            history = model.fit(X_train_lst, y_train, epochs=1, batch_size=b_size, 
                                validation_data=(X_valid_lst,y_valid))

            # Save details about training
            train_loss = history.history['loss'][0]
            val_loss = history.history['val_loss'][0]
            epoch_time = time.time() - start_time
            with open(MODDIR+"loss.txt", "a") as f:
                f.write("%d\t%f\t%f\t%f\n" % (i, train_loss, val_loss, epoch_time))

            # Save model each iteration
            model.save("{}val_loss:{}_epoch:{}_{}.h5".format(MODDIR,val_loss,i,mod_name))
        
    # Return the best validation performance (if hyperpara tuning)
    min_mod_name = [f for f in sorted(os.listdir(MODDIR)) if "val_loss" in f][0]
    best_val = float(min_mod_name.split("val_loss:")[1].split("_")[0])
    return(best_val)

def eval_test_model(opt_name="rmsprop",lr=0.001,drop=0.5,
                    b_size=1000,epoch_num=50,nodesize=200):    
    
    # Fixed hyperpara
    print("[PROGRESS] Starting create_train_model()")
    lookback = 60; h1 = 200; h2 = 200
    loss_func = "binary_crossentropy"

    # Form the model name (for saving the model)
    mod_name  = "multivariate_biglstmdropoutv3_{}n_{}n_{}ep".format(h1,h2,epoch_num)
    mod_name += "_{}opt_{}lr".format(opt_name,lr)
    mod_name += "_{}drop_{}bs".format(drop,b_size)
    MODDIR = PATH+"models/"+mod_name+"/"
    
    ########## Form Data #########
    X_test_lst  = []

    for i in range(0,len(feat_lst2)):
        X_test_lst.append(X_test[:,:,i:(i+1)])
    
    ########## Testing (optional) #########
    model = load_min_model_helper(MODDIR)
    model = multi_gpu_model(model,gpus=GPUNUM)
    hosp_data = "tbi"
    save_path = RESDIR+"hosp{}_data/{}/".format(hosp_data,data_type)
    if not os.path.exists(save_path): os.makedirs(save_path)
    ypred = model.predict(X_test_lst)
    np.save(save_path+"ypred.npy",ypred)
    np.save(save_path+"y_test.npy",y_test)
    auc = metrics.average_precision_score(y_test, ypred)
    np.random.seed(231)
    auc_lst = []
    roc_auc_lst = []
    
    # Randomly sample the test set
    for i in range(0,100):
        inds = np.random.choice(X_test.shape[0], X_test.shape[0], replace=True)
        auc = metrics.average_precision_score(y_test[inds], ypred[inds])
        auc_lst.append(auc)
        roc_auc = metrics.roc_auc_score(y_test[inds], ypred[inds])
        roc_auc_lst.append(roc_auc)
    auc_lst = np.array(auc_lst)
    roc_auc_lst = np.array(roc_auc_lst)
    print("[DEBUG] auc_lst.mean(): {}".format(auc_lst.mean()))
    print("[DEBUG] roc_auc_lst.mean(): {}".format(roc_auc_lst.mean()))

    SP = RESDIR+"hosp{}_data/".format(hosp_data)
    f = open('{}conf_int_hospdata{}_prauc.txt'.format(SP,hosp_data),'a')
    f.write("{}, {}+-{}\n".format(data_type,auc_lst.mean().round(4),2*np.std(auc_lst).round(4)))
    f.close()
    f = open('{}conf_int_hospdata{}_rocauc.txt'.format(SP,hosp_data),'a')
    f.write("{}, {}+-{}\n".format(data_type,roc_auc_lst.mean().round(4),2*np.std(roc_auc_lst).round(4)))
    f.close()
    np.save("{}auc_lst".format(save_path,data_type), auc_lst)
    np.save("{}roc_auc_lst".format(save_path,data_type), roc_auc_lst)