#!/usr/bin/env python
import pandas
import numpy
import sklearn.model_selection

def _load(biochemtapepath="data/DU4800.txt", medexamtapepath='data/DU4233.txt', 
         anthropometrypath="data/DU4111.txt", vitlpath="data/N92vitl.txt"):
    '''
    Load NHANES I biochemistry tape and mortality data.

    ----------
    Parameters
    ----------
    biochemtapepath: (str) Path to the NHANES I biochemistry tape ("DU4800.txt")
    medexamtapepath: (str) Path to the NHANES I general medical exam tape 
      ("DU4233.txt")
    anthropometrypath: (str) Path to the NAHENS I anthropometry, goniometry,
      skeletal age, bone density, and cortical thickness tape ("DU4111.txt")
    vitlpath: (str) Path to the NHEFS 1992 public mortality data tape 
      ("N92vitl.txt")

    -------
    Returns
    -------
    X: (pandas.DataFrame) Dataframe containing select information from the 
      biochemistry data tape, generally confined to data collected from common
      laboratory blood tests (comprehensive metabolic panel, complete blood 
      count with differential, cholesterol test, sedimentation rate, and urine
      dipsticks) as well as age and sex.  The index is the NHANES sequence 
      number (a unique identifier for each participant).
      Note that categorical covariates are one-hot encoded in dummy columns.
      Continuous covariates are encoded as floating point values, and any
      corresponding "special" codes are encoded in a dummy column (e.g., 
      "serum_albumin_isMissingAge1to3" is True if the serum albumin field is 
      "9999" and False otherwise). Blank fields are coded as 'NaN', and a 
      corresponding dummy column "<fieldname>_isBlank" is set to True for that 
      sample.
    y: (numpy.ndarray) Array indicating whether the participant survived for 15 
      years past the date of the NHANES I examination. y[i] is True if the
      participant described by X.iloc[i] survived for at least 15 years past
      the date of the NHANES I examination and False otherwise. Examination
      and death are tracked on a monthly basis. Month of death is additionally
      follows the NHEFS imputation rules (i.e., month is assumed to be July if
      year is known but month is unknown).
    '''
    d = {}
    with open(biochemtapepath, 'r') as handle:
        for line in handle:
            seqn = int(line[0:5])
            d[seqn] = {}

            # Date of examination
            d[seqn]['exam_month'] = int(line[137:139])
            d[seqn]['exam_year'] = int(line[141:143])

            # 1 if male, 2 if female
            sex = int(line[103])
            #d[seqn]['sex_isMale'] = (sex == 1)
            d[seqn]['sex_isFemale'] = (sex == 2)

            # Age at examination
            d[seqn]['age'] = int(line[143:145])

            # Physical activity in past 24 hours?
            d[seqn]['physical_activity'] = int(line[225])
            # Is the field 8? (blank)
            d[seqn]['physical_activity_isBlank'] = (d[seqn]['physical_activity'] == 8)

            # Serum albumin
            try:
                d[seqn]['serum_albumin'] = float(line[231:235])
            except ValueError:
                d[seqn]['serum_albumin'] = numpy.nan
            d[seqn]['serum_albumin_isBlank'] = numpy.isnan(d[seqn]['serum_albumin'])
            d[seqn]['serum_albumin_isMissingAge1to3'] = (d[seqn]['serum_albumin'] == 9999)
            if d[seqn]['serum_albumin'] == 9999:
                d[seqn]['serum_albumin'] = numpy.nan
            d[seqn]['serum_albumin'] /= 10
            try:
                isImputed = (int(line[235]) == 1)
            except ValueError:
                isImputed = False
            if isImputed:
                d[seqn]['serum_albumin'] = numpy.nan
                # I assume that the study having imputed the value is the same 
                # as the study having left the field blank
                d[seqn]['serum_albumin_isBlank'] = True


            # Alkaline phosphatase
            try:
                d[seqn]['alkaline_phosphatase'] = float(line[458:462])
            except ValueError:
                d[seqn]['alkaline_phosphatase'] = numpy.nan
            d[seqn]['alkaline_phosphatase_isUnacceptable'] = (d[seqn]['alkaline_phosphatase'] == 7777)
            d[seqn]['alkaline_phosphatase_isBlankbutapplicable'] = (d[seqn]['alkaline_phosphatase'] == 8888)
            d[seqn]['alkaline_phosphatase_isTestnotdone'] = (d[seqn]['alkaline_phosphatase'] == 9999)
            d[seqn]['alkaline_phosphatase_isBlank'] = numpy.isnan(d[seqn]['alkaline_phosphatase'])
            if d[seqn]['alkaline_phosphatase'] in [7777, 8888, 9999]:
                d[seqn]['alkaline_phosphatase'] = numpy.nan
            d[seqn]['alkaline_phosphatase'] /= 10

            # SGOT/aspartate aminotransferase
            try: 
                d[seqn]['SGOT'] = float(line[454:458])
            except ValueError:
                d[seqn]['SGOT'] = numpy.nan
            d[seqn]['SGOT_isUnacceptable'] = (d[seqn]['SGOT'] == 7777)
            d[seqn]['SGOT_isBlankbutapplicable'] = (d[seqn]['SGOT'] == 8888)
            d[seqn]['SGOT_isTestnotdone'] = (d[seqn]['SGOT'] == 9999)
            d[seqn]['SGOT_isBlank'] = numpy.isnan(d[seqn]['SGOT'])
            if d[seqn]['SGOT'] in [7777, 8888, 9999]:
                d[seqn]['SGOT'] = numpy.nan
            d[seqn]['SGOT'] /= 100

            # BUN (blood urea nitrogen)
            try:
                d[seqn]['BUN'] = float(line[471:474])
            except ValueError:
                d[seqn]['BUN'] = numpy.nan
            d[seqn]['BUN_isUnacceptable'] = (d[seqn]['BUN'] == 777)
            d[seqn]['BUN_isTestnotdone'] = (d[seqn]['BUN'] == 999)
            d[seqn]['BUN_isBlank'] = numpy.isnan(d[seqn]['BUN'])
            if d[seqn]['BUN'] in [777, 999]:
                d[seqn]['BUN'] = numpy.nan
            d[seqn]['BUN'] /= 10

            # Calcium
            try: 
                d[seqn]['calcium'] = float(line[465:468])
            except ValueError:
                d[seqn]['calcium'] = numpy.nan
            d[seqn]['calcium_isUnacceptable'] = (d[seqn]['calcium'] == 777)
            d[seqn]['calcium_isBlankbutapplicable'] = (d[seqn]['calcium'] == 888)
            d[seqn]['calcium_isTestnotdone'] = (d[seqn]['calcium'] == 999)
            d[seqn]['calcium_isBlank'] = numpy.isnan(d[seqn]['calcium'])
            if d[seqn]['calcium'] in [777, 888, 999]:
                d[seqn]['calcium'] = numpy.nan
            d[seqn]['calcium'] /= 10

            # Creatinine:
            try:
                d[seqn]['creatinine'] = float(line[474:477])
            except ValueError:
                d[seqn]['creatinine'] = numpy.nan
            d[seqn]['creatinine_isUnacceptable'] = (d[seqn]['creatinine'] == 777)
            d[seqn]['creatinine_isTestnotdone'] = (d[seqn]['creatinine'] == 999)
            d[seqn]['creatinine_isBlank'] = numpy.isnan(d[seqn]['creatinine'])
            if d[seqn]['creatinine'] in [777, 999]:
                d[seqn]['creatinine'] = numpy.nan
            d[seqn]['creatinine'] /= 10

            # Serum potassium:
            try:
                d[seqn]['potassium'] = float(line[273:276])
            except ValueError:
                d[seqn]['potassium'] = numpy.nan
            d[seqn]['potassium_isUnacceptable'] = (d[seqn]['potassium'] == 888)
            d[seqn]['potassium_isBlank'] = numpy.isnan(d[seqn]['potassium'])
            if d[seqn]['potassium'] in [888]:
                d[seqn]['potassium'] = numpy.nan
            d[seqn]['potassium'] /= 10

            # Serum sodium:
            try:
                d[seqn]['sodium'] = float(line[270:273])
            except ValueError:
                d[seqn]['sodium'] = numpy.nan
            d[seqn]['sodium_isUnacceptable'] = (d[seqn]['sodium'] == 888)
            d[seqn]['sodium_isBlank'] = numpy.isnan(d[seqn]['sodium'])
            if d[seqn]['sodium'] in [888]:
                d[seqn]['sodium'] = numpy.nan

            # Total bilirubin:
            try: 
                d[seqn]['total_bilirubin'] = float(line[450:454])
            except ValueError:
                d[seqn]['total_bilirubin'] = numpy.nan
            d[seqn]['total_bilirubin_isUnacceptable'] = (d[seqn]['total_bilirubin'] == 7777)
            d[seqn]['total_bilirubin_isBlankbutapplicable'] = (d[seqn]['total_bilirubin'] == 8888)
            d[seqn]['total_bilirubin_isTestnotdone'] = (d[seqn]['total_bilirubin'] == 9999)
            d[seqn]['total_bilirubin_isBlank'] = numpy.isnan(d[seqn]['total_bilirubin'])
            if d[seqn]['total_bilirubin'] in [7777, 8888, 9999]:
                d[seqn]['total_bilirubin'] = numpy.nan
            d[seqn]['total_bilirubin'] /= 100

            # Serum protein
            try: 
                d[seqn]['serum_protein'] = float(line[226:230])
            except ValueError:
                d[seqn]['serum_protein'] = numpy.nan
            d[seqn]['serum_protein_isMissingAge1to3'] = (d[seqn]['serum_protein'] == 9999)
            d[seqn]['serum_protein_isBlank'] = numpy.isnan(d[seqn]['serum_protein'])
            if d[seqn]['serum_protein'] in [7777, 8888, 9999]:
                d[seqn]['serum_protein'] = numpy.nan
            d[seqn]['serum_protein'] /= 10
            try:
                isImputed = (int(line[230]) == 1)
            except ValueError:
                isImputed = False
            if isImputed:
                d[seqn]['serum_protein'] = numpy.nan
                # I assume that the study having imputed the value is the same 
                # as the study having left the field blank
                d[seqn]['serum_protein_isBlank'] = True

            # Red blood cell count
            try:
                d[seqn]['red_blood_cells'] = float(line[525:528])
            except ValueError:
                d[seqn]['red_blood_cells'] = numpy.nan
            d[seqn]['red_blood_cells_isUnacceptable'] = (d[seqn]['red_blood_cells'] == 777)
            d[seqn]['red_blood_cells_isBlankbutapplicable'] = (d[seqn]['red_blood_cells'] == 888)
            if d[seqn]['red_blood_cells'] in [777, 888]:
                d[seqn]['red_blood_cells'] = numpy.nan
            d[seqn]['red_blood_cells'] /= 100

            # White blood cell count
            try:
                d[seqn]['white_blood_cells'] = float(line[528:531])
            except ValueError:
                d[seqn]['white_blood_cells'] = numpy.nan
            d[seqn]['white_blood_cells_isUnacceptable'] = (d[seqn]['white_blood_cells'] == 777)
            d[seqn]['white_blood_cells_isBlankbutapplicable'] = (d[seqn]['white_blood_cells'] == 888)
            if d[seqn]['white_blood_cells'] in [777, 888]:
                d[seqn]['white_blood_cells'] = numpy.nan
            d[seqn]['white_blood_cells'] /= 10

            # Hemoglobin
            try: 
                d[seqn]['hemoglobin'] = float(line[246:250])
            except ValueError:
                d[seqn]['hemoglobin'] = numpy.nan
            d[seqn]['hemoglobin_isMissing'] = (d[seqn]['hemoglobin'] == 8888)
            d[seqn]['hemoglobin_isUnacceptable'] = (d[seqn]['hemoglobin'] == 7777)
            d[seqn]['hemoglobin_isBlank'] = numpy.isnan(d[seqn]['hemoglobin'])
            if d[seqn]['hemoglobin'] in [7777, 8888]:
                d[seqn]['hemoglobin'] = numpy.nan
            d[seqn]['hemoglobin'] /= 10
            try:
                isImputed = (int(line[250]) == 1)
            except ValueError:
                isImputed = False
            if isImputed:
                d[seqn]['hemoglobin'] = numpy.nan
                # I assume that the study having imputed the value is the same 
                # as the study having left the field blank
                d[seqn]['hemoglobin_isBlank'] = True

            # Hematocrit
            try: 
                d[seqn]['hematocrit'] = float(line[251:254])
            except ValueError:
                d[seqn]['hematocrit'] = numpy.nan
            d[seqn]['hematocrit_isUnacceptable'] = (d[seqn]['hematocrit'] == 777)
            d[seqn]['hematocrit_isMissing'] = (d[seqn]['hematocrit'] == 888)
            d[seqn]['hematocrit_isBlank'] = numpy.isnan(d[seqn]['hematocrit'])
            if d[seqn]['hematocrit'] in [777, 888]:
                d[seqn]['hematocrit'] = numpy.nan
            try:
                isImputed = (int(line[254]) == 1)
            except ValueError:
                isImputed = False
            if isImputed:
                d[seqn]['hematocrit'] = numpy.nan
                # I assume that the study having imputed the value is the same 
                # as the study having left the field blank
                d[seqn]['hematocrit_isBlank'] = True

            # Platelet estimate
            try:
                platelets = int(line[337]) 
            except:
                platelets = numpy.nan
            d[seqn]['platelets_isNormal'] = (platelets == 0)
            d[seqn]['platelets_isIncreased'] = (platelets == 2)
            d[seqn]['platelets_isDecreased'] = (platelets == 3)
            d[seqn]['platelets_isNoestimate'] = (platelets == 9) 
            d[seqn]['platelets_isBlank'] = numpy.isnan(platelets) 

            # Segmented neutrophils (mature)
            try:
                d[seqn]['segmented_neutrophils'] = float(line[320:322])
            except ValueError:
                d[seqn]['segmented_neutrophils'] = numpy.nan
            d[seqn]['segmented_neutrophils_isBlank'] = numpy.isnan(d[seqn]['segmented_neutrophils'])

            # Lymphocytes 
            try:
                d[seqn]['lymphocytes'] = float(line[326:328])
            except ValueError:
                d[seqn]['lymphocytes'] = numpy.nan
            d[seqn]['lymphocytes_isBlank'] = numpy.isnan(d[seqn]['lymphocytes'])

            # monocytes 
            try:
                d[seqn]['monocytes'] = float(line[328:330])
            except ValueError:
                d[seqn]['monocytes'] = numpy.nan
            d[seqn]['monocytes_isBlank'] = numpy.isnan(d[seqn]['monocytes'])

            # eosinophils 
            try:
                d[seqn]['eosinophils'] = float(line[322:324])
            except ValueError:
                d[seqn]['eosinophils'] = numpy.nan
            d[seqn]['eosinophils_isBlank'] = numpy.isnan(d[seqn]['eosinophils'])

            # basophils 
            try:
                d[seqn]['basophils'] = float(line[324:326])
            except ValueError:
                d[seqn]['basophils'] = numpy.nan
            d[seqn]['basophils_isBlank'] = numpy.isnan(d[seqn]['basophils'])

            # band_neutrophils 
            try:
                d[seqn]['band_neutrophils'] = float(line[318:320])
            except ValueError:
                d[seqn]['band_neutrophils'] = numpy.nan
            d[seqn]['band_neutrophils_isBlank'] = numpy.isnan(d[seqn]['band_neutrophils'])

            # Serum cholesterol
            try: 
                d[seqn]['cholesterol'] = float(line[236:240])
            except ValueError:
                d[seqn]['cholesterol'] = numpy.nan
            d[seqn]['cholesterol_isMissing'] = (d[seqn]['cholesterol'] == 8888)
            d[seqn]['cholesterol_isMissingAge1to3'] = (d[seqn]['cholesterol'] == 9999)
            d[seqn]['cholesterol_isBlank'] = numpy.isnan(d[seqn]['cholesterol'])
            if d[seqn]['cholesterol'] in [8888, 9999]:
                d[seqn]['cholesterol'] = numpy.nan
            try:
                isImputed = (int(line[240]) == 1)
            except ValueError:
                isImputed = False
            if isImputed:
                d[seqn]['cholesterol'] = numpy.nan
                # I assume that the study having imputed the value is the same 
                # as the study having left the field blank
                d[seqn]['cholesterol_isBlank'] = True

            # Urine albumin
            try: 
                urine_albumin = int(line[500])
            except ValueError:
                urine_albumin = numpy.nan
            d[seqn]['urine_albumin_isNegative'] = (urine_albumin == 0)
            d[seqn]['urine_albumin_is>=30'] = (urine_albumin == 1) 
            d[seqn]['urine_albumin_is>=100'] = (urine_albumin == 2)
            d[seqn]['urine_albumin_is>=300'] = (urine_albumin == 3) 
            d[seqn]['urine_albumin_is>=1000'] = (urine_albumin == 4) 
            d[seqn]['urine_albumin_isTrace'] = (urine_albumin == 5)
            d[seqn]['urine_albumin_isBlankbutapplicable'] = (urine_albumin == 8)
            d[seqn]['urine_albumin_isBlank'] = numpy.isnan(urine_albumin) 

            # Urine glucose
            try:
                urine_glucose = int(line[501])
            except ValueError:
                urine_glucose = numpy.nan
            d[seqn]['urine_glucose_isNegative'] = (urine_glucose == 0)
            d[seqn]['urine_glucose_isLight'] = (urine_glucose == 1)
            d[seqn]['urine_glucose_isMedium'] = (urine_glucose == 2)
            d[seqn]['urine_glucose_isDark'] = (urine_glucose == 3)
            d[seqn]['urine_glucose_isVerydark'] = (urine_glucose == 4)
            d[seqn]['urine_glucose_isTrace'] = (urine_glucose == 5)
            d[seqn]['urine_glucose_isBlankbutapplicable'] = (urine_glucose == 8)
            d[seqn]['urine_glucose_isBlank'] = numpy.isnan(urine_glucose)

            # Urine pH
            try:
                d[seqn]['urine_pH'] = int(line[502])
            except ValueError:
                d[seqn]['urine_pH'] = numpy.nan
            d[seqn]['urine_pH_isBlank'] = numpy.isnan(d[seqn]['urine_pH'])
            if d[seqn]['urine_pH'] == 4:
                d[seqn]['urine_pH_isBlankbutapplicable'] = True
                d[seqn]['urine_pH'] = numpy.nan
            else:
                d[seqn]['urine_pH_isBlankbutapplicable'] = False

            # Hematest
            try:
                urine_hematest = int(line[503])
            except ValueError:
                urine_hematest = numpy.nan
            d[seqn]['urine_hematest_isNegative'] = (urine_hematest == 0)
            d[seqn]['urine_hematest_isSmall'] = (urine_hematest == 1)
            d[seqn]['urine_hematest_isModerate'] = (urine_hematest == 2)
            d[seqn]['urine_hematest_isLarge'] = (urine_hematest == 3)
            d[seqn]['urine_hematest_isVerylarge'] = (urine_hematest == 4)
            d[seqn]['urine_hematest_isTrace'] = (urine_hematest == 5)
            d[seqn]['urine_hematest_isBlankbutapplicable'] = (urine_hematest == 8)
            d[seqn]['urine_hematest_isBlank'] = numpy.isnan(urine_hematest)

            # Sedimentation rate
            try:
                d[seqn]['sedimentation_rate'] = float(line[279:282])
            except ValueError:
                d[seqn]['sedimentation_rate'] = numpy.nan
            d[seqn]['sedimentation_rate_isBlank'] = numpy.isnan(d[seqn]['sedimentation_rate'])
            if d[seqn]['sedimentation_rate'] == 888:
                d[seqn]['sedimentation_rate_isBlankbutapplicable'] = True
                d[seqn]['sedimentation_rate'] = numpy.nan
            else:
                d[seqn]['sedimentation_rate_isBlankbutapplicable'] = False

            # Uric acid
            try: 
                d[seqn]['uric_acid'] = float(line[462:465])
            except ValueError:
                d[seqn]['uric_acid'] = numpy.nan
            d[seqn]['uric_acid_isUnacceptable'] = (d[seqn]['uric_acid'] == 777)
            d[seqn]['uric_acid_isBlankbutapplicable'] = (d[seqn]['uric_acid'] == 888)
            d[seqn]['uric_acid_isTestnotdone'] = (d[seqn]['uric_acid'] == 999)
            d[seqn]['uric_acid_isBlank'] = numpy.isnan(d[seqn]['uric_acid'])
            if d[seqn]['uric_acid'] in [777, 888, 999]:
                d[seqn]['uric_acid'] = numpy.nan
            d[seqn]['uric_acid'] /= 10

    with open(medexamtapepath, 'r') as handle:
        for line in handle:
            seqn = int(line[:5])

            # Systolic blood pressure
            try:
                d[seqn]['systolic_blood_pressure'] = int(line[227:230])
            except ValueError:
                d[seqn]['systolic_blood_pressure'] = numpy.nan

            d[seqn]['systolic_blood_pressure_isBlank'] = (d[seqn]['systolic_blood_pressure'] == 888)
            d[seqn]['systolic_blood_pressure_isAgeUnder6'] = (d[seqn]['systolic_blood_pressure'] == 999)
            if d[seqn]['systolic_blood_pressure'] in [888, 999]:
                d[seqn]['systolic_blood_pressure'] = numpy.nan

            # Pulse pressure
            try:
                diastolic = int(line[230:233])
            except ValueError:
                diastolic = numpy.nan
            # For this case, we have to treat "blank but applicable" and 
            # "age under 6" the same as blank
            if diastolic in [888, 999]:
                diastolic = numpy.nan
            if numpy.isnan(d[seqn]['systolic_blood_pressure']) or numpy.isnan(diastolic):
                d[seqn]['pulse_pressure'] = numpy.nan
            else:
                d[seqn]['pulse_pressure'] = d[seqn]['systolic_blood_pressure'] - diastolic
            
            ## Obesity
            #try:
            #    obesity = int(line[360])
            #except ValueError:
            #    obesity = numpy.nan

            #if obesity == 1:
            #    d[seqn]['obesity'] = 1.0
            #elif obesity == 2:
            #    d[seqn]['obesity'] = 0.0
            #else:
            #    d[seqn]['obesity'] = numpy.nan

            #d[seqn]['obesity_isBlankButApplicable'] = (obesity == 8)
            #d[seqn]['obesity_isBlank'] = numpy.isnan(obesity)

    with open(anthropometrypath, 'r') as handle:
        for line in handle:
            seqn = int(line[0:5])

            # weight
            try:
                d[seqn]['weight'] = int(line[259:264])
            except ValueError:
                d[seqn]['weight'] = numpy.nan 
            if d[seqn]['weight'] == 88888:
                d[seqn]['weight'] = numpy.nan
            # Here we group together the 98 participants with imputed weights
            # and the 4 participants for whom the field is "blank but 
            # applicable"
            weightIsImputed = (int(line[264]) == 1)
            if weightIsImputed:
                d[seqn]['weight'] = numpy.nan
            d[seqn]['weight_isBlank'] = numpy.isnan(d[seqn]['weight'])
            d[seqn]['weight'] /= 100

            # height
            try:
                d[seqn]['height'] = int(line[265:269])
            except ValueError:
                d[seqn]['height'] = numpy.nan
            if d[seqn]['height'] == 8888:
                d[seqn]['height'] = numpy.nan

            # Here we group together the 60 participants with imputed heights
            # and the 4 participants for whom the field is "blank but 
            # applicable"
            heightIsImputed = (int(line[272]) == 1)
            if heightIsImputed:
                d[seqn]['height'] = numpy.nan
            d[seqn]['height_isBlank'] = numpy.isnan(d[seqn]['height'])
            d[seqn]['height'] /= 10

    d2 = {}
    with open(vitlpath, 'r') as handle:
        for line in handle:
            seqn = int(line[11:16])
            try: 
                d[seqn]
            except KeyError:
                continue
            d2[seqn] = {}
            d2[seqn]['month_last_known_alive'] = int(line[17:19])
            d2[seqn]['month_last_known_alive_isDontknow'] = (d2[seqn]['month_last_known_alive'] == 98)
            d2[seqn]['month_last_known_alive_isNotascertained'] = (d2[seqn]['month_last_known_alive'] == 99)
            if d2[seqn]['month_last_known_alive'] in [98,99]:
                d2[seqn]['month_last_known_alive'] = numpy.nan

            d2[seqn]['year_last_known_alive'] = int(line[21:23])

            try:
                d2[seqn]['month_deceased'] = int(line[60:62])
            except ValueError:
                d2[seqn]['month_deceased'] = numpy.nan
            try:
                d2[seqn]['year_deceased'] = int(line[64:66])
            except ValueError:
                d2[seqn]['year_deceased'] = numpy.nan 
            d2[seqn]['month_deceased_isDontknow'] = (d2[seqn]['month_deceased'] == 98)
            d2[seqn]['month_deceased_isNotascertained'] = (d2[seqn]['month_deceased'] == 99)
            d2[seqn]['month_deceased_isBlank'] = numpy.isnan(d2[seqn]['month_deceased'])
            if d2[seqn]['month_deceased'] in [98, 99]:
                d2[seqn]['month_deceased'] = numpy.nan
            d2[seqn]['year_deceased_isBlank'] = numpy.isnan(d2[seqn]['year_deceased'])

    for seqn in list(d.keys()):
        try:
            d2[seqn]
        except KeyError:
            d[seqn]['survived_15_years'] = numpy.nan
            del d[seqn]['exam_year']
            del d[seqn]['exam_month']
            continue

        alive_time = d2[seqn]['year_last_known_alive']+d2[seqn]['month_last_known_alive']/12.0
        dead_time = d2[seqn]['year_deceased']+d2[seqn]['month_deceased']/12.0
        exam_time = d[seqn]['exam_year']+d[seqn]['exam_month']/12.0
        
        if numpy.isnan(dead_time):
            if alive_time > exam_time:
                years = -(alive_time - exam_time)
        else:
            if dead_time >= alive_time and dead_time > exam_time:
                years = dead_time - exam_time

        d[seqn]['survived_15_years'] = years
        # maxalive = max(
        #     d2[seqn]['year_last_known_alive']+d2[seqn]['month_last_known_alive']/12.0,
        #     d2[seqn]['year_deceased']+d2[seqn]['month_deceased']/12.0
        # )
        # years = maxalive- d[seqn]['exam_year']+d[seqn]['exam_month']/12.0
        #print (d[seqn]['exam_month'], d2[seqn]['month_last_known_alive'], d2[seqn]['month_deceased'])
        

        # if d2[seqn]['year_last_known_alive'] - d[seqn]['exam_year'] > 15:
        #     d[seqn]['survived_15_years'] = True

        # elif d2[seqn]['year_last_known_alive'] - d[seqn]['exam_year'] == 15\
        #         and d2[seqn]['month_last_known_alive'] >= d[seqn]['exam_month']:
        #     d[seqn]['survived_15_years'] = True

        # elif d2[seqn]['year_deceased'] - d[seqn]['exam_year'] < 15:
        #     d[seqn]['survived_15_years'] = False

        # elif d2[seqn]['year_deceased'] - d[seqn]['exam_year'] == 15\
        #         and d2[seqn]['month_deceased'] < d[seqn]['exam_month']:
        #     d[seqn]['survived_15_years'] = False
        # else:
        #     d[seqn]['survived_15_years'] = numpy.nan
                
        del d[seqn]['exam_year']
        del d[seqn]['exam_month']

    for subd in d.values():
        if type(subd) != dict:
            print(subd)
    dataframe = pandas.DataFrame.from_dict(d, orient='index')
    y = numpy.array(dataframe['survived_15_years'], dtype=float)
    del dataframe['survived_15_years']

    # Remove participants with 'NaN' labels
    bad_idxs = list(numpy.where(numpy.isnan(y))[0])
    dataframe.drop(dataframe.index[bad_idxs], inplace=True)
    y = y[~numpy.isnan(y)]
    print("number of people surviving ", (y < 0).sum())
    print("number of people not surviving ", (y > 0).sum())
    for colname in list(dataframe.columns):
        if numpy.all(dataframe[colname] == dataframe[colname].iloc[0]):
            dataframe.drop(colname, inplace=True, axis=1)
    for colname in list(dataframe.columns):
        assert not numpy.all(dataframe[colname] == dataframe[colname].iloc[0])
    return dataframe, y

def load(**kwargs):
    '''
    Load NHANES I data. See _load() docstring for more information.
    This function returns data for model training, hyperparameter tuning, and
    assessment of the model's accuracy. The data used when building a model
    (for training and hyperparameter tuning) makes up 80% of the data, while
    the model's performance should be assessed on the remaining 20%. Of the
    80% used for training, 80% of that subset (64% of total) is provided for 
    training, and the remaining 20% of that subset (16% of total) is provided
    for validating the choice of hyperparameters.

    ----------
    Returns
    ----------
    (X, y): (pandas.Dataframe, numpy.ndarray) The full dataset and 
      corresponding class labels
    (Xtrain, ytrain): (pandas.Dataframe, numpy.ndarray) 80% of the full data 
      set.
    (Xtraintrain, ytraintrain): (pandas.Dataframe, numpy.ndarray) 64% of full 
      data set.
    (Xtrainvalid, ytrainvalid): (pandas.Dataframe, numpy.ndarray) 16% of full 
      data set.
    (Xtest, ytest): (pandas.Dataframe, numpy.ndarray) 20% of full data set.
    '''
    Xfname = 'X.csv'
    yfname = 'y'
    try:
        X = pandas.read_pickle(Xfname)
        y = numpy.load(yfname+'.npy')
        print("Warning! Loading NHANES I data from cache (X.pkl and y.npy)")
    except FileNotFoundError:
        X, y = _load(**kwargs)
        X.to_csv(Xfname)
        numpy.save(yfname, y)
    #X.drop('age', inplace=True)
    #X.drop('sex_isFemale', inplace=True)
    Xtrain, Xtest, ytrain, ytest = sklearn.model_selection.train_test_split(
            X, y, test_size=0.2, random_state=12)
    Xtraintrain, Xtrainvalid, ytraintrain, ytrainvalid = sklearn.model_selection.train_test_split(
            Xtrain, ytrain, test_size=0.2, random_state=27)
    return (X, y),\
           (Xtrain, ytrain), \
           (Xtraintrain, ytraintrain), \
           (Xtrainvalid, ytrainvalid), \
           (Xtest, ytest)

def load_standardized(**kwargs):
    '''
    Load NHANES I data. See load() and _load() docstrings for more information.
    This function returns the same data as load(), except the data is
    mean-centered and scaled to unit variance. In particular, centering and 
    normalization is performed based on the mean and standard deviation of the
    training data (Xtraintrain and Xtrainvalid).
    
    Missing values are mean imputed.
    '''
    (X, y), (Xtrain, ytrain), (Xtraintrain, ytraintrain), \
            (Xtrainvalid, ytrainvalid), (Xtest, ytest) = load(**kwargs)

    # Scale data
    mu = Xtrain.mean()
    sigma = Xtrain.var()**0.5

    X -= mu
    Xtrain -= mu
    Xtraintrain -= mu
    Xtrainvalid -= mu
    Xtest -= mu
    for col in sigma.index:
        if sigma[col] != 0:
            X[col] /= sigma[col]
            Xtrain[col] /= sigma[col]
            Xtraintrain[col] /= sigma[col]
            Xtrainvalid[col] /= sigma[col]
            Xtest[col] /= sigma[col]

    # Impute mean
    X.fillna(0, inplace=True)
    Xtrain.fillna(0, inplace=True)
    Xtraintrain.fillna(0, inplace=True)
    Xtrainvalid.fillna(0, inplace=True)
    Xtest.fillna(0, inplace=True)

    return (X, y),\
           (Xtrain, ytrain), \
           (Xtraintrain, ytraintrain), \
           (Xtrainvalid, ytrainvalid), \
           (Xtest, ytest)

    

def test():
    load()

if __name__ == "__main__":
    test()
