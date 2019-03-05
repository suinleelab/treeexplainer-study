/*
 *  Survey:           NHANES I
 *  Years:            1971-1975
 *  Questionnaire:    Medical Examination
 *  Tape Number:      4233
 *
 *  Code Created By:  CDC/IMB
 *
 *  DESCRIPTION:  This file is provided as a starting point to perform advanced 
 *  statistical queries on the survey data.  They are to be used in conjunction 
 *  with legacy codebooks or data tape documentation to analyze the data.  In order 
 *  to use this program: either copy the tape file to your C:\temp directory, or change 
 *  the infile to point to the location that your tape file is located.
*/

PROC FORMAT;

VALUE ME0010F
     1='3,000,000 or more'
     2='1,000,000 to 2,999,999'
     3='250,000 to 999,999'
     4='under 250,000'
     5='Urban place 25,000 or more outside urbanized area'
     6='Urban place 10,000 to 24,999 outside urbanized area'
     7='Urban place 2,500 to 9,999 outside urbanized area'
     8='Rural'
     ;

VALUE ME0011F
     1='In SMSA, in central city'
     2='In SMSA, not in central city'
     3='Not in SMSA'
     ;

VALUE ME0012F
     1='Housing Unit'
     2='Other unit'
     ;

VALUE ME0013F
     1='All other'
     2='Rural  7136'
     ;

VALUE ME0014F
     1='10 or more acres'
     2='Less than 10 acres'
     9='Not applicable'
     ;

VALUE ME0015F
     2='Yes'
     4='No'
     9='Not applicable'
     ;

VALUE ME0016F
     3='Yes'
     5='No'
     9='Not applicable'
     ;

VALUE ME0017F
     00='Blank, but applicable'
     ;

VALUE ME0019F
     1='Male'
     2='Female'
     ;

VALUE ME0020F
     10='None'
     21='1st grade'
     22='2nd grade'
     23='3rd grade'
     24='4th grade'
     25='5th grade'
     26='6th grade'
     27='7th grade'
     28='8th grade'
     31='9th grade'
     32='10th grade'
     33='11th grade'
     34='12th grade'
     41='First year of college'
     42='Second year of college'
     43='Third year of college'
     44='Fourth year of college'
     45='Graduate'
     88='Blank, but applicable'
     ;

VALUE ME0022F
     1='White'
     2='Negro'
     3='Other'
     ;

VALUE ME0027F
     9='9 or more'
     ;

VALUE ME0028F
     1='Yes'
     2='No'
     ;

VALUE ME0029F
     1='Yes'
     2='No'
     9='Not applicable'
     ;

VALUE ME0030F
     1='Yes'
     2='No'
     9='Not applicable'
     ;

VALUE ME0031F
     1='Yes'
     2='No'
     ;

VALUE ME0032F
     1='Yes'
     2='No'
     ;

VALUE ME0033F
     1='Yes'
     2='No'
     9='Not applicable'
     ;

VALUE ME0034F
     11='Under $1,000(including loss)'
     12='$1,000-1,999'
     13='$2,000-2,999'
     14='$3,000-3,999'
     15='$4,000-4,999'
     16='$5,000-5,999'
     17='$6,000-6,999'
     18='$7,000-9,999'
     19='$10,000-14,999'
     20='$15,000-19,999'
     21='$20,000-24,999'
     22='$25,000 and over'
     88='Blank, but applicable'
     ;

VALUE ME0036F
     1='Yes'
     2='No'
     3='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0037F
     8888='Blank, but applicable'
     9999='Not applicable'
     ;

VALUE ME0041F
     1='Yes'
     2='No'
     3='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0042F
     8888='Blank, but applicable'
     9999='Not applicable'
     ;

VALUE ME0046F
     1='Yes'
     2='No'
     3='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0047F
     8888='Blank, but applicable'
     9999='Not applicable'
     ;

VALUE ME0051F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0052F
     8888='Blank, but applicable'
     9999='Not applicable'
     ;

VALUE ME0056F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0057F
     8888='Blank, but applicable'
     9999='Not applicable'
     ;

VALUE ME0061F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0062F
     8888='Blank, but applicable'
     9999='Not applicable'
     ;

VALUE ME0066F
     1='Yes'
     2='No'
     3='Loss'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0067F
     8888='Blank, but applicable'
     9999='Not applicable'
     ;

VALUE ME0071F
     1='Yes'
     2='No'
     3='Loss'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0072F
     8888='Blank, but applicable'
     9999='Not applicable'
     ;

VALUE ME0076F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0077F
     8888='Blank, but applicable'
     9999='Not applicable'
     ;

VALUE ME0081F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0082F
     8888='Blank, but applicable'
     9999='Not applicable'
     ;

VALUE ME0086F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0087F
     8888='Blank, but applicable'
     9999='Not applicable'
     ;

VALUE ME0091F
     8888='Blank, but applicable'
     9999='Not applicable'
     ;

VALUE ME0100F
     1='Head (1 person living along or with non-relatives)'
     2='Head (2 or more related persons in family)'
     3='Wife'
     4='Child'
     5='Other relative'
     ;

VALUE ME0103F
     1='White'
     2='Negro'
     3='Other'
     ;

VALUE ME0104F
     1='Male'
     2='Female'
     ;

VALUE ME0105F
     1='Under 17'
     2='Married'
     3='Widowed'
     4='Never Married'
     5='Divorced'
     6='Separated'
     8='Blank, but applicable'
     ;

VALUE ME0110F
     88='Blank, but applicable'
     ;

VALUE ME0112F
     10='None'
     21='1st grade'
     22='2nd grade'
     23='3rd grade'
     24='4th grade'
     25='5th grade'
     26='6th grade'
     27='7th grade'
     28='8th grade'
     31='9th grade'
     32='10th grade'
     33='11th grade'
     34='12th grade'
     41='First year of college'
     42='Second year of college'
     43='Third year of college'
     44='Fourth year of college'
     45='Graduate'
     77='Special school'
     88='Blank, but applicable'
     99='Not applicable'
     ;

VALUE ME0114F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0115F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0116F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0117F
     1='Nursery'
     2='Kindergarten'
     3='Other'
     4='Headstart'
     5='Daycare'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0118F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     ;

VALUE ME0119F
     0='German'
     1='Italian'
     2='French'
     3='Polish'
     4='Russian'
     5='Spanish'
     6='Chinese'
     7='Other language'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0120F
     00='German'
     01='Irish'
     02='Italian'
     03='French'
     04='Polish'
     05='Russian'
     06='English'
     07='Spanish'
     08='Mexican'
     09='Chinese'
     10='Japanese'
     11='American Indian'
     12='Negro'
     13='Jewish'
     14='American'
     15='Other'
     88='Blank, but applicable'
     99='Dont know'
     ;

VALUE ME0122F
     1='Working'
     2='Keeping house'
     3='Something else'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0123F
     0='Laid off'
     1='Retired'
     2='Student'
     3='Other'
     4='Ill'
     5='Staying home'
     6='Looking for work'
     7='Unable to work'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0124F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0125F
     1='Full-time'
     2='Part-time'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0126F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0127F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0128F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0129F
     1='Looking'
     2='Lay-off'
     3='Both'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0130F
     1='Private paid'
     2='Government-Federal'
     3='Government-Other'
     4='Own'
     5='Non-paid'
     6='Never worked'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0131F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     9='Not applicable'
     ;

VALUE ME0146F
     1='Farm'
     2='Nonfarm'
     ;

VALUE ME0147F
     998='Index computed 998 or greater'
     999='Unknown'
     ;

VALUE ME0150F
     1='Northeast'
     2='Midwest'
     3='South'
     4='West'
     ;

VALUE ME0151F
     1='Not applicable'
     2='No program available'
     3='Food stamps available'
     4='Commodities available'
     8='Blank, but applicable'
     ;

VALUE ME0152F
     1='Yes'
     2='No'
     9='Dont know'
     ;

VALUE ME0153F
     1='Yes, regularly'
     2='Yes, occasionally'
     3='No'
     8='Blank, but applicable'
     ;

VALUE ME0154F
     1='No need'
     2='Not enough money at the time'
     3='No transportation'
     4='Pride'
     5='Other'
     8='Blank, but applicable'
     ;

VALUE ME0155F
     1='Yes'
     2='No'
     9='Dont know'
     ;

VALUE ME0156F
     1='Yes, regularly'
     2='Yes, occasionally'
     3='No'
     8='Blank, but applicable'
     ;

VALUE ME0157F
     1='No need'
     2='No transportation'
     3='Pride'
     4='Other'
     8='Blank, but applicable'
     ;

VALUE ME0225F
     888='Blank, but applicable'
     ;

VALUE ME0228F
     888='Blank, but applicable'
     999='Age under 6'
     ;

VALUE ME0231F
     888='Blank, but applicable'
     999='Age under 6'
     ;

VALUE ME0234F
     1='Findings'
     2='No findings'
     ;

VALUE ME0235F
     1='Yes'
     ;

VALUE ME0236F
     1='Yes'
     ;

VALUE ME0237F
     1='Yes'
     ;

VALUE ME0238F
     1='Yes'
     ;

VALUE ME0239F
     1='Yes'
     ;

VALUE ME0240F
     1='Yes'
     ;

VALUE ME0241F
     1='Yes'
     ;

VALUE ME0242F
     1='Yes'
     ;

VALUE ME0243F
     1='Yes'
     ;

VALUE ME0244F
     1='Yes'
     ;

VALUE ME0245F
     1='Yes'
     ;

VALUE ME0246F
     1='Yes'
     ;

VALUE ME0247F
     1='Yes'
     ;

VALUE ME0248F
     1='Yes'
     ;

VALUE ME0249F
     1='Yes'
     ;

VALUE ME0250F
     1='Yes'
     ;

VALUE ME0251F
     1='Yes'
     ;

VALUE ME0252F
     1='Yes'
     ;

VALUE ME0253F
     1='Yes'
     ;

VALUE ME0254F
     1='Yes'
     ;

VALUE ME0255F
     1='Yes'
     ;

VALUE ME0256F
     1='Yes'
     ;

VALUE ME0257F
     1='Yes'
     ;

VALUE ME0258F
     1='Yes'
     ;

VALUE ME0259F
     1='Yes'
     ;

VALUE ME0260F
     1='Group 0'
     2='Group 1'
     3='Group 2'
     4='Group 3'
     8='Blank, but applicable'
     ;

VALUE ME0261F
     1='Findings'
     2='No findings'
     ;

VALUE ME0262F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0263F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0264F
     1='Findings'
     ;

VALUE ME0265F
     1='Findings'
     ;

VALUE ME0266F
     1='Findings'
     2='No findings'
     ;

VALUE ME0267F
     1='Yes'
     ;

VALUE ME0268F
     1='Yes'
     ;

VALUE ME0269F
     1='Yes'
     ;

VALUE ME0270F
     1='Yes'
     ;

VALUE ME0271F
     1='Yes'
     ;

VALUE ME0272F
     1='Yes'
     ;

VALUE ME0273F
     1='Findings'
     2='No findings'
     ;

VALUE ME0274F
     1='Yes'
     ;

VALUE ME0275F
     1='Yes'
     ;

VALUE ME0276F
     1='Yes'
     ;

VALUE ME0277F
     1='Yes'
     ;

VALUE ME0278F
     1='Findings'
     2='No findings'
     ;

VALUE ME0279F
     1='Yes'
     ;

VALUE ME0280F
     1='Yes'
     ;

VALUE ME0281F
     1='Yes'
     ;

VALUE ME0282F
     1='Yes'
     ;

VALUE ME0283F
     1='Yes'
     ;

VALUE ME0284F
     1='Yes'
     ;

VALUE ME0285F
     88888='Blank, but applicable'
     ;

VALUE ME0290F
     1='Yes'
     ;

VALUE ME0291F
     1='Yes'
     ;

VALUE ME0292F
     88888='Blank, but applicable'
     ;

VALUE ME0297F
     1='Yes'
     ;

VALUE ME0306F
     1='Findings'
     2='No findings'
     ;

VALUE ME0307F
     1='Yes'
     ;

VALUE ME0308F
     1='Yes'
     ;

VALUE ME0309F
     1='Yes'
     ;

VALUE ME0310F
     1='Yes'
     ;

VALUE ME0311F
     1='Findings'
     2='No findings'
     ;

VALUE ME0312F
     1='Yes'
     ;

VALUE ME0313F
     1='Yes'
     ;

VALUE ME0314F
     1='Yes'
     ;

VALUE ME0315F
     1='Yes'
     ;

VALUE ME0316F
     1='Yes'
     ;

VALUE ME0317F
     1='Yes'
     ;

VALUE ME0318F
     1='Findings'
     2='No findings'
     ;

VALUE ME0319F
     1='Yes'
     ;

VALUE ME0320F
     1='Yes'
     ;

VALUE ME0321F
     1='Yes'
     ;

VALUE ME0322F
     1='Yes'
     ;

VALUE ME0323F
     1='Yes'
     ;

VALUE ME0324F
     1='Yes'
     ;

VALUE ME0325F
     1='Yes'
     ;

VALUE ME0326F
     1='Yes'
     ;

VALUE ME0327F
     1='Yes'
     ;

VALUE ME0328F
     1='Findings'
     2='No findings'
     8='Blank, but applicable'
     ;

VALUE ME0360F
     1='Normal nutrition'
     2='Abnormal nutrition'
     8='Blank, but applicable'
     ;

VALUE ME0361F
     1='Obesity'
     2='No obesity'
     8='Blank, but applicable'
     ;

VALUE ME0362F
     8888='Blank, but applicable'
     ;

VALUE ME0425F
     1='No findings'
     2='Findings'
     ;

VALUE ME0426F
     1='No findings'
     2='Findings'
     ;

VALUE ME0427F
     1='Findings'
     ;

VALUE ME0428F
     1='Findings'
     ;

VALUE ME0429F
     1='Findings'
     ;

VALUE ME0430F
     1='Findings'
     ;

VALUE ME0431F
     1='Yes'
     2='No'
     ;

VALUE ME0432F
     1='No findings'
     2='Findings'
     ;

VALUE ME0433F
     1='No findings'
     2='Findings'
     ;

VALUE ME0434F
     1='Partially'
     2='Completely'
     ;

VALUE ME0435F
     1='Partially'
     2='Completely'
     ;

VALUE ME0436F
     1='Cerumen'
     2='Other'
     ;

VALUE ME0437F
     1='Cerumen'
     2='Other'
     ;

VALUE ME0438F
     1='No findings'
     2='Findings'
     3='Not visible'
     8='Blank, but applicable'
     ;

VALUE ME0439F
     1='No findings'
     2='Findings'
     3='Not visible'
     8='Blank, but applicable'
     ;

VALUE ME0440F
     1='Dull (opaque)'
     2='Transparent'
     ;

VALUE ME0441F
     1='Dull (opaque)'
     2='Transparent'
     ;

VALUE ME0442F
     1='Bulging'
     2='Retracted'
     ;

VALUE ME0443F
     1='Bulging'
     2='Retracted'
     ;

VALUE ME0444F
     1='Findings'
     ;

VALUE ME0445F
     1='Findings'
     ;

VALUE ME0446F
     1='Findings'
     ;

VALUE ME0447F
     1='Findings'
     ;

VALUE ME0448F
     1='Red'
     2='Other discoloration'
     ;

VALUE ME0449F
     1='Red'
     2='Other discoloration'
     ;

VALUE ME0450F
     1='Yes'
     ;

VALUE ME0451F
     1='Yes'
     ;

VALUE ME0452F
     1='Yes'
     ;

VALUE ME0453F
     1='Yes'
     ;

VALUE ME0454F
     1='With discharge'
     2='Without discharge'
     ;

VALUE ME0455F
     1='With discharge'
     2='Without discharge'
     ;

VALUE ME0456F
     1='No findings'
     2='Findings'
     ;

VALUE ME0457F
     1='No findings'
     2='Findings'
     ;

VALUE ME0458F
     1='Acute'
     2='Chronic'
     ;

VALUE ME0459F
     1='Acute'
     2='Chronic'
     ;

VALUE ME0460F
     1='Yes'
     ;

VALUE ME0461F
     1='Yes'
     ;

VALUE ME0462F
     1='Yes'
     ;

VALUE ME0463F
     1='Yes'
     ;

VALUE ME0464F
     1='Yes'
     ;

VALUE ME0465F
     1='Yes'
     ;

VALUE ME0466F
     1='Yes'
     ;

VALUE ME0467F
     1='Yes'
     ;

VALUE ME0468F
     1='No findings'
     2='Findings'
     ;

VALUE ME0469F
     1='No findings'
     ;

VALUE ME0470F
     1='No findings'
     ;

VALUE ME0471F
     1='No findings'
     ;

VALUE ME0472F
     1='No findings'
     2='Findings'
     ;

VALUE ME0473F
     1='Diminished breath sounds'
     2='Absent breath sounds'
     ;

VALUE ME0474F
     1='Yes'
     ;

VALUE ME0475F
     1='Yes'
     ;

VALUE ME0476F
     1='Yes'
     ;

VALUE ME0477F
     1='Yes'
     ;

VALUE ME0478F
     1='Diminished breath sounds'
     2='Absent breath sounds'
     ;

VALUE ME0479F
     1='Yes'
     ;

VALUE ME0480F
     1='Yes'
     ;

VALUE ME0481F
     1='Yes'
     ;

VALUE ME0482F
     1='Yes'
     ;

VALUE ME0483F
     1='Diminished breath sounds'
     2='Absent breath sounds'
     ;

VALUE ME0484F
     1='Yes'
     ;

VALUE ME0485F
     1='Yes'
     ;

VALUE ME0486F
     1='Yes'
     ;

VALUE ME0487F
     1='Yes'
     ;

VALUE ME0488F
     1='Diminished breath sounds'
     2='Absent breath sounds'
     ;

VALUE ME0489F
     1='Yes'
     ;

VALUE ME0490F
     1='Yes'
     ;

VALUE ME0491F
     1='Yes'
     ;

VALUE ME0492F
     1='Yes'
     ;

VALUE ME0493F
     1='Diminished breath sounds'
     2='Absent breath sounds'
     ;

VALUE ME0494F
     1='Yes'
     ;

VALUE ME0495F
     1='Yes'
     ;

VALUE ME0496F
     1='Yes'
     ;

VALUE ME0497F
     1='Yes'
     ;

VALUE ME0498F
     1='None'
     2='Findings'
     8='Blank, but applicable'
     ;

VALUE ME0499F
     1='Felt'
     2='Not felt'
     ;

VALUE ME0500F
     8='Blank, but applicable'
     ;

VALUE ME0501F
     1='At'
     2='Inside'
     3='Outside'
     ;

VALUE ME0502F
     1='Absent'
     2='Present'
     ;

VALUE ME0503F
     1='Base'
     2='Apex'
     ;

VALUE ME0504F
     1='Base'
     2='Apex'
     ;

VALUE ME0505F
     1='Normal'
     2='Accentuated'
     3='Diminished'
     8='Blank, but applicable'
     ;

VALUE ME0506F
     1='Normal'
     2='Accentuated'
     3='Diminished'
     8='Blank, but applicable'
     ;

VALUE ME0507F
     1='None'
     ;

VALUE ME0508F
     1='Functional'
     2='Organic'
     9='Dont know'
     ;

VALUE ME0509F
     1='Functional'
     2='Organic'
     9='Dont know'
     ;

VALUE ME0518F
     1='Systolic'
     2='Diastolic'
     3='Both'
     ;

VALUE ME0519F
     1='Systolic'
     2='Diastolic'
     3='Both'
     ;

VALUE ME0520F
     1='Systolic'
     2='Diastolic'
     3='Both'
     ;

VALUE ME0521F
     1='Systolic'
     2='Diastolic'
     3='Both'
     ;

VALUE ME0522F
     1='Systolic'
     2='Diastolic'
     3='Both'
     ;

VALUE ME0523F
     1='Systolic'
     2='Diastolic'
     3='Both'
     ;

VALUE ME0524F
     1='Systolic'
     2='Diastolic'
     3='Both'
     ;

VALUE ME0525F
     9='Systolic'
     ;

VALUE ME0526F
     1='No'
     2='Yes'
     ;

VALUE ME0527F
     1='Yes'
     ;

VALUE ME0528F
     1='Yes'
     ;

VALUE ME0529F
     1='Yes'
     ;

VALUE ME0530F
     1='Normal'
     2='Sclerotic'
     3='Tortuous'
     4='Sclerotic and Tortuous'
     8='Blank, but applicable'
     ;

VALUE ME0531F
     1='Normal'
     2='Sclerotic'
     3='Tortuous'
     4='Sclerotic and Tortuous'
     8='Blank, but applicable'
     ;

VALUE ME0532F
     1='Normal'
     2='Sclerotic'
     3='Tortuous'
     4='Sclerotic and Tortuous'
     8='Blank, but applicable'
     ;

VALUE ME0533F
     1='Normal'
     2='Sclerotic'
     3='Tortuous'
     4='Sclerotic and Tortuous'
     8='Blank, but applicable'
     ;

VALUE ME0534F
     1='Normal'
     2='Sclerotic'
     3='Tortuous'
     4='Sclerotic and Tortuous'
     8='Blank, but applicable'
     ;

VALUE ME0535F
     1='Normal'
     2='Sclerotic'
     3='Tortuous'
     4='Sclerotic and Tortuous'
     8='Blank, but applicable'
     ;

VALUE ME0536F
     1='Normal'
     2='Diminished'
     3='Bounding'
     4='Absent'
     8='Blank, but applicable'
     ;

VALUE ME0537F
     1='Normal'
     2='Diminished'
     3='Bounding'
     4='Absent'
     8='Blank, but applicable'
     ;

VALUE ME0538F
     1='Normal'
     2='Diminished'
     3='Bounding'
     4='Absent'
     8='Blank, but applicable'
     ;

VALUE ME0539F
     1='Normal'
     2='Diminished'
     3='Bounding'
     4='Absent'
     ;

VALUE ME0540F
     1='Normal'
     2='Diminished'
     3='Bounding'
     4='Absent'
     8='Blank, but applicable'
     ;

VALUE ME0541F
     1='Normal'
     2='Diminished'
     3='Bounding'
     4='Absent'
     8='Blank, but applicable'
     ;

VALUE ME0542F
     1='Normal'
     2='Diminished'
     3='Bounding'
     4='Absent'
     8='Blank, but applicable'
     ;

VALUE ME0543F
     1='Normal'
     2='Diminished'
     3='Bounding'
     4='Absent'
     ;

VALUE ME0544F
     1='Findings'
     2='No findings'
     ;

VALUE ME0545F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0546F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0547F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0548F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0549F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0550F
     1='Active'
     2='Passive'
     3='Both'
     ;

VALUE ME0551F
     1='Tenderness'
     ;

VALUE ME0552F
     1='Active'
     2='Passive'
     3='Both'
     ;

VALUE ME0553F
     1='Tenderness'
     ;

VALUE ME0554F
     1='Active'
     2='Passive'
     3='Both'
     ;

VALUE ME0555F
     1='Tenderness'
     ;

VALUE ME0556F
     1='Active'
     2='Passive'
     3='Both'
     ;

VALUE ME0557F
     1='Tenderness'
     ;

VALUE ME0558F
     1='Active'
     2='Passive'
     3='Both'
     ;

VALUE ME0559F
     1='Tenderness'
     ;

VALUE ME0560F
     1='Active'
     2='Passive'
     3='Both'
     ;

VALUE ME0561F
     1='Tenderness'
     ;

VALUE ME0562F
     1='Tenderness'
     ;

VALUE ME0563F
     1='Tenderness'
     ;

VALUE ME0564F
     1='Tenderness'
     ;

VALUE ME0565F
     1='Tenderness'
     ;

VALUE ME0566F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0567F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0568F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0569F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0570F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0571F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0572F
     1='Findings'
     2='No findings'
     ;

VALUE ME0573F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0574F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0575F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0576F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0577F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0578F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0579F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0580F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0581F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0582F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0583F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0584F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0585F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0586F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0587F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0588F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0589F
     1='No findings'
     2='Findings'
     ;

VALUE ME0590F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0591F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0592F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0593F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0594F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0595F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0596F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0597F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0598F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0599F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0600F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0601F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0602F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0603F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0604F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0605F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0606F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0607F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0646F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0647F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0648F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0649F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0650F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0651F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0652F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0653F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0654F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0655F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0656F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0657F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0658F
     1='No findings'
     2='Findings'
     ;

VALUE ME0659F
     1='Yes'
     ;

VALUE ME0660F
     1='Yes'
     ;

VALUE ME0661F
     1='Yes'
     ;

VALUE ME0662F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0663F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0664F
     1='Yes'
     ;

VALUE ME0665F
     1='Yes'
     ;

VALUE ME0666F
     1='Yes'
     ;

VALUE ME0667F
     1='Yes'
     ;

VALUE ME0668F
     1='Yes'
     ;

VALUE ME0669F
     1='Yes'
     ;

VALUE ME0670F
     1='Yes'
     ;

VALUE ME0671F
     1='Negative'
     2='Positive'
     ;

VALUE ME0672F
     1='Yes'
     ;

VALUE ME0673F
     1='Yes'
     ;

VALUE ME0674F
     1='Yes'
     ;

VALUE ME0675F
     1='Yes'
     ;

VALUE ME0676F
     1='Yes'
     ;

VALUE ME0677F
     1='Yes'
     ;

VALUE ME0678F
     1='Yes'
     ;

VALUE ME0679F
     1='Yes'
     ;

VALUE ME0680F
     1='Yes'
     ;

VALUE ME0681F
     1='Yes'
     ;

VALUE ME0682F
     1='Yes'
     ;

VALUE ME0683F
     1='Yes'
     ;

VALUE ME0684F
     1='Yes'
     ;

VALUE ME0685F
     1='Yes'
     ;

VALUE ME0686F
     1='Yes'
     ;

VALUE ME0687F
     1='Yes'
     ;

VALUE ME0688F
     1='Yes'
     ;

VALUE ME0689F
     1='Yes'
     ;

VALUE ME0690F
     1='Yes'
     ;

VALUE ME0691F
     1='Yes'
     ;

VALUE ME0692F
     1='Yes'
     ;

VALUE ME0693F
     1='Yes'
     ;

VALUE ME0694F
     1='Yes'
     ;

VALUE ME0695F
     1='Yes'
     ;

VALUE ME0696F
     1='Yes'
     ;

VALUE ME0697F
     1='Yes'
     ;

VALUE ME0698F
     1='Yes'
     ;

VALUE ME0699F
     1='Yes'
     ;

VALUE ME0700F
     1='Yes'
     ;

VALUE ME0701F
     1='Yes'
     ;

VALUE ME0702F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     ;

VALUE ME0703F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     ;

VALUE ME0704F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     ;

VALUE ME0705F
     1='Yes'
     2='No'
     8='Blank, but applicable'
     ;

VALUE ME0706F
     1='Findings'
     2='No findings'
     8='Blank, but applicable'
     ;

VALUE ME0707F
     8888='Blank, but applicable'
     ;

VALUE ME0711F
     1='A.M.'
     2='P.M.'
     8='Blank, but applicable'
     ;

VALUE ME0712F
     888='Blank, but applicable'
     ;

VALUE ME0715F
     888='Blank, but applicable'
     ;

VALUE ME0718F
     888='Blank, but applicable'
     ;

VALUE ME0721F
     888='Blank, but applicable'
     ;

VALUE ME0724F
     1='Normal'
     2='Abnormal'
     ;

VALUE ME0725F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0730F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0735F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0740F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0745F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0750F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0755F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0760F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0765F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0770F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0775F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0780F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0785F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0790F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0795F
     1='Minimum'
     2='Moderate'
     3='Severe'
     8='Blank, but applicable'
     ;

VALUE ME0797F
     888='Blank, but applicable'
     ;

VALUE ME0825F
     1='Right'
     2='Left'
     3='Both'
     8='Blank, but applicable'
     ;

VALUE ME0826F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0827F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0828F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0829F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0830F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0831F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0832F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0833F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0834F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0835F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0836F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0837F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0838F
     1='Right'
     2='Left'
     3='Both'
     ;

VALUE ME0839F
     1='Right'
     2='Left'
     3='Both'
     ;
RUN;


DATA D_4233;
   INFILE 'c:\temp\DU4233.txt' LRECL = 2000 MISSOVER;
      LENGTH
         SEQN 8
         N1ME0006 8
         N1ME0010 4
         N1ME0011 4
         N1ME0012 4
         N1ME0013 4
         N1ME0014 4
         N1ME0015 4
         N1ME0016 4
         N1ME0017 4
         N1ME0019 4
         N1ME0020 4
         N1ME0022 4
         N1ME0023 4
         N1ME0025 4
         N1ME0027 4
         N1ME0028 4
         N1ME0029 4
         N1ME0030 4
         N1ME0031 4
         N1ME0032 4
         N1ME0033 4
         N1ME0034 4
         N1ME0036 4
         N1ME0037 8
         N1ME0041 4
         N1ME0042 8
         N1ME0046 4
         N1ME0047 8
         N1ME0051 4
         N1ME0052 8
         N1ME0056 4
         N1ME0057 8
         N1ME0061 4
         N1ME0062 8
         N1ME0066 4
         N1ME0067 8
         N1ME0071 4
         N1ME0072 8
         N1ME0076 4
         N1ME0077 8
         N1ME0081 4
         N1ME0082 8
         N1ME0086 4
         N1ME0087 8
         N1ME0091 8
         N1ME0095 8
         N1ME0100 4
         N1ME0101 4
         N1ME0103 4
         N1ME0104 4
         N1ME0105 4
         N1ME0106 8
         N1ME0110 4
         N1ME0112 4
         N1ME0114 4
         N1ME0115 4
         N1ME0116 4
         N1ME0117 4
         N1ME0118 4
         N1ME0119 4
         N1ME0120 4
         N1ME0122 4
         N1ME0123 4
         N1ME0124 4
         N1ME0125 4
         N1ME0126 4
         N1ME0127 4
         N1ME0128 4
         N1ME0129 4
         N1ME0130 4
         N1ME0131 4
         N1ME0132 4
         N1ME0135 4
         N1ME0138 8
         N1ME0144 4
         N1ME0146 4
         N1ME0147 4
         N1ME0150 4
         N1ME0151 4
         N1ME0152 4
         N1ME0153 4
         N1ME0154 4
         N1ME0155 4
         N1ME0156 4
         N1ME0157 4
         N1ME0158 8
         N1ME0164 8
         N1ME0170 8
         N1ME0176 8
         N1ME0182 8
         N1ME0188 8
         N1ME0194 4
         N1ME0196 4
         N1ME0199 $2
         N1ME0201 8
         N1ME0205 $20
         N1ME0225 4
         N1ME0228 4
         N1ME0231 4
         N1ME0234 4
         N1ME0235 4
         N1ME0236 4
         N1ME0237 4
         N1ME0238 4
         N1ME0239 4
         N1ME0240 4
         N1ME0241 4
         N1ME0242 4
         N1ME0243 4
         N1ME0244 4
         N1ME0245 4
         N1ME0246 4
         N1ME0247 4
         N1ME0248 4
         N1ME0249 4
         N1ME0250 4
         N1ME0251 4
         N1ME0252 4
         N1ME0253 4
         N1ME0254 4
         N1ME0255 4
         N1ME0256 4
         N1ME0257 4
         N1ME0258 4
         N1ME0259 4
         N1ME0260 4
         N1ME0261 4
         N1ME0262 4
         N1ME0263 4
         N1ME0264 4
         N1ME0265 4
         N1ME0266 4
         N1ME0267 4
         N1ME0268 4
         N1ME0269 4
         N1ME0270 4
         N1ME0271 4
         N1ME0272 4
         N1ME0273 4
         N1ME0274 4
         N1ME0275 4
         N1ME0276 4
         N1ME0277 4
         N1ME0278 4
         N1ME0279 4
         N1ME0280 4
         N1ME0281 4
         N1ME0282 4
         N1ME0283 4
         N1ME0284 4
         N1ME0285 8
         N1ME0290 4
         N1ME0291 4
         N1ME0292 8
         N1ME0297 4
         N1ME0298 8
         N1ME0306 4
         N1ME0307 4
         N1ME0308 4
         N1ME0309 4
         N1ME0310 4
         N1ME0311 4
         N1ME0312 4
         N1ME0313 4
         N1ME0314 4
         N1ME0315 4
         N1ME0316 4
         N1ME0317 4
         N1ME0318 4
         N1ME0319 4
         N1ME0320 4
         N1ME0321 4
         N1ME0322 4
         N1ME0323 4
         N1ME0324 4
         N1ME0325 4
         N1ME0326 4
         N1ME0327 4
         N1ME0328 4
         N1ME0329 8
         N1ME0333 $3
         N1ME0336 $3
         N1ME0339 $3
         N1ME0342 $3
         N1ME0345 $3
         N1ME0348 $3
         N1ME0351 $3
         N1ME0354 4
         N1ME0357 4
         N1ME0360 4
         N1ME0361 4
         N1ME0362 8
         N1ME0366 $59
         N1ME0425 4
         N1ME0426 4
         N1ME0427 4
         N1ME0428 4
         N1ME0429 4
         N1ME0430 4
         N1ME0431 4
         N1ME0432 4
         N1ME0433 4
         N1ME0434 4
         N1ME0435 4
         N1ME0436 4
         N1ME0437 4
         N1ME0438 4
         N1ME0439 4
         N1ME0440 4
         N1ME0441 4
         N1ME0442 4
         N1ME0443 4
         N1ME0444 4
         N1ME0445 4
         N1ME0446 4
         N1ME0447 4
         N1ME0448 4
         N1ME0449 4
         N1ME0450 4
         N1ME0451 4
         N1ME0452 4
         N1ME0453 4
         N1ME0454 4
         N1ME0455 4
         N1ME0456 4
         N1ME0457 4
         N1ME0458 4
         N1ME0459 4
         N1ME0460 4
         N1ME0461 4
         N1ME0462 4
         N1ME0463 4
         N1ME0464 4
         N1ME0465 4
         N1ME0466 4
         N1ME0467 4
         N1ME0468 4
         N1ME0469 4
         N1ME0470 4
         N1ME0471 4
         N1ME0472 4
         N1ME0473 4
         N1ME0474 4
         N1ME0475 4
         N1ME0476 4
         N1ME0477 4
         N1ME0478 4
         N1ME0479 4
         N1ME0480 4
         N1ME0481 4
         N1ME0482 4
         N1ME0483 4
         N1ME0484 4
         N1ME0485 4
         N1ME0486 4
         N1ME0487 4
         N1ME0488 4
         N1ME0489 4
         N1ME0490 4
         N1ME0491 4
         N1ME0492 4
         N1ME0493 4
         N1ME0494 4
         N1ME0495 4
         N1ME0496 4
         N1ME0497 4
         N1ME0498 4
         N1ME0499 4
         N1ME0500 4
         N1ME0501 4
         N1ME0502 4
         N1ME0503 4
         N1ME0504 4
         N1ME0505 4
         N1ME0506 4
         N1ME0507 4
         N1ME0508 4
         N1ME0509 4
         N1ME0510 4
         N1ME0511 4
         N1ME0512 4
         N1ME0513 4
         N1ME0514 4
         N1ME0515 4
         N1ME0516 4
         N1ME0517 4
         N1ME0518 4
         N1ME0519 4
         N1ME0520 4
         N1ME0521 4
         N1ME0522 4
         N1ME0523 4
         N1ME0524 4
         N1ME0525 4
         N1ME0526 4
         N1ME0527 4
         N1ME0528 4
         N1ME0529 4
         N1ME0530 4
         N1ME0531 4
         N1ME0532 4
         N1ME0533 4
         N1ME0534 4
         N1ME0535 4
         N1ME0536 4
         N1ME0537 4
         N1ME0538 4
         N1ME0539 4
         N1ME0540 4
         N1ME0541 4
         N1ME0542 4
         N1ME0543 4
         N1ME0544 4
         N1ME0545 4
         N1ME0546 4
         N1ME0547 4
         N1ME0548 4
         N1ME0549 4
         N1ME0550 4
         N1ME0551 4
         N1ME0552 4
         N1ME0553 4
         N1ME0554 4
         N1ME0555 4
         N1ME0556 4
         N1ME0557 4
         N1ME0558 4
         N1ME0559 4
         N1ME0560 4
         N1ME0561 4
         N1ME0562 4
         N1ME0563 4
         N1ME0564 4
         N1ME0565 4
         N1ME0566 4
         N1ME0567 4
         N1ME0568 4
         N1ME0569 4
         N1ME0570 4
         N1ME0571 4
         N1ME0572 4
         N1ME0573 4
         N1ME0574 4
         N1ME0575 4
         N1ME0576 4
         N1ME0577 4
         N1ME0578 4
         N1ME0579 4
         N1ME0580 4
         N1ME0581 4
         N1ME0582 4
         N1ME0583 4
         N1ME0584 4
         N1ME0585 4
         N1ME0586 4
         N1ME0587 4
         N1ME0588 4
         N1ME0589 4
         N1ME0590 4
         N1ME0591 4
         N1ME0592 4
         N1ME0593 4
         N1ME0594 4
         N1ME0595 4
         N1ME0596 4
         N1ME0597 4
         N1ME0598 4
         N1ME0599 4
         N1ME0600 4
         N1ME0601 4
         N1ME0602 4
         N1ME0603 4
         N1ME0604 4
         N1ME0605 4
         N1ME0606 4
         N1ME0607 4
         N1ME0608 4
         N1ME0609 4
         N1ME0610 4
         N1ME0611 4
         N1ME0612 4
         N1ME0613 4
         N1ME0614 4
         N1ME0615 4
         N1ME0616 4
         N1ME0617 4
         N1ME0618 4
         N1ME0619 4
         N1ME0620 4
         N1ME0621 4
         N1ME0622 4
         N1ME0623 4
         N1ME0624 4
         N1ME0625 4
         N1ME0626 4
         N1ME0627 4
         N1ME0628 4
         N1ME0629 4
         N1ME0630 4
         N1ME0631 4
         N1ME0632 4
         N1ME0633 4
         N1ME0634 4
         N1ME0635 4
         N1ME0636 4
         N1ME0637 4
         N1ME0638 4
         N1ME0639 4
         N1ME0640 4
         N1ME0641 4
         N1ME0642 4
         N1ME0643 4
         N1ME0644 4
         N1ME0645 4
         N1ME0646 4
         N1ME0647 4
         N1ME0648 4
         N1ME0649 4
         N1ME0650 4
         N1ME0651 4
         N1ME0652 4
         N1ME0653 4
         N1ME0654 4
         N1ME0655 4
         N1ME0656 4
         N1ME0657 4
         N1ME0658 4
         N1ME0659 4
         N1ME0660 4
         N1ME0661 4
         N1ME0662 4
         N1ME0663 4
         N1ME0664 4
         N1ME0665 4
         N1ME0666 4
         N1ME0667 4
         N1ME0668 4
         N1ME0669 4
         N1ME0670 4
         N1ME0671 4
         N1ME0672 4
         N1ME0673 4
         N1ME0674 4
         N1ME0675 4
         N1ME0676 4
         N1ME0677 4
         N1ME0678 4
         N1ME0679 4
         N1ME0680 4
         N1ME0681 4
         N1ME0682 4
         N1ME0683 4
         N1ME0684 4
         N1ME0685 4
         N1ME0686 4
         N1ME0687 4
         N1ME0688 4
         N1ME0689 4
         N1ME0690 4
         N1ME0691 4
         N1ME0692 4
         N1ME0693 4
         N1ME0694 4
         N1ME0695 4
         N1ME0696 4
         N1ME0697 4
         N1ME0698 4
         N1ME0699 4
         N1ME0700 4
         N1ME0701 4
         N1ME0702 4
         N1ME0703 4
         N1ME0704 4
         N1ME0705 4
         N1ME0706 4
         N1ME0707 8
         N1ME0711 4
         N1ME0712 4
         N1ME0715 4
         N1ME0718 4
         N1ME0721 4
         N1ME0724 4
         N1ME0725 4
         N1ME0726 $1
         N1ME0727 4
         N1ME0730 4
         N1ME0731 $1
         N1ME0732 $3
         N1ME0735 4
         N1ME0736 $1
         N1ME0737 4
         N1ME0740 4
         N1ME0741 $1
         N1ME0742 $3
         N1ME0745 4
         N1ME0746 $1
         N1ME0747 $3
         N1ME0750 4
         N1ME0751 $1
         N1ME0752 $3
         N1ME0755 4
         N1ME0756 $1
         N1ME0757 $3
         N1ME0760 4
         N1ME0761 $1
         N1ME0762 $3
         N1ME0765 4
         N1ME0766 $1
         N1ME0767 4
         N1ME0770 4
         N1ME0771 $1
         N1ME0772 $3
         N1ME0775 4
         N1ME0776 $1
         N1ME0777 $3
         N1ME0780 4
         N1ME0781 $1
         N1ME0782 $3
         N1ME0785 4
         N1ME0786 $1
         N1ME0787 $3
         N1ME0790 4
         N1ME0791 $1
         N1ME0792 $3
         N1ME0795 4
         N1ME0796 $1
         N1ME0797 4
         N1ME0800 $25
         N1ME0825 4
         N1ME0826 4
         N1ME0827 4
         N1ME0828 4
         N1ME0829 4
         N1ME0830 4
         N1ME0831 4
         N1ME0832 4
         N1ME0833 4
         N1ME0834 4
         N1ME0835 4
         N1ME0836 4
         N1ME0837 4
         N1ME0838 4
         N1ME0839 4
         N1ME0840 $11
      ;



FORMAT
     N1ME0010 ME0010F.
     N1ME0011 ME0011F.
     N1ME0012 ME0012F.
     N1ME0013 ME0013F.
     N1ME0014 ME0014F.
     N1ME0015 ME0015F.
     N1ME0016 ME0016F.
     N1ME0017 ME0017F.
     N1ME0019 ME0019F.
     N1ME0020 ME0020F.
     N1ME0022 ME0022F.
     N1ME0027 ME0027F.
     N1ME0028 ME0028F.
     N1ME0029 ME0029F.
     N1ME0030 ME0030F.
     N1ME0031 ME0031F.
     N1ME0032 ME0032F.
     N1ME0033 ME0033F.
     N1ME0034 ME0034F.
     N1ME0036 ME0036F.
     N1ME0037 ME0037F.
     N1ME0041 ME0041F.
     N1ME0042 ME0042F.
     N1ME0046 ME0046F.
     N1ME0047 ME0047F.
     N1ME0051 ME0051F.
     N1ME0052 ME0052F.
     N1ME0056 ME0056F.
     N1ME0057 ME0057F.
     N1ME0061 ME0061F.
     N1ME0062 ME0062F.
     N1ME0066 ME0066F.
     N1ME0067 ME0067F.
     N1ME0071 ME0071F.
     N1ME0072 ME0072F.
     N1ME0076 ME0076F.
     N1ME0077 ME0077F.
     N1ME0081 ME0081F.
     N1ME0082 ME0082F.
     N1ME0086 ME0086F.
     N1ME0087 ME0087F.
     N1ME0091 ME0091F.
     N1ME0100 ME0100F.
     N1ME0103 ME0103F.
     N1ME0104 ME0104F.
     N1ME0105 ME0105F.
     N1ME0110 ME0110F.
     N1ME0112 ME0112F.
     N1ME0114 ME0114F.
     N1ME0115 ME0115F.
     N1ME0116 ME0116F.
     N1ME0117 ME0117F.
     N1ME0118 ME0118F.
     N1ME0119 ME0119F.
     N1ME0120 ME0120F.
     N1ME0122 ME0122F.
     N1ME0123 ME0123F.
     N1ME0124 ME0124F.
     N1ME0125 ME0125F.
     N1ME0126 ME0126F.
     N1ME0127 ME0127F.
     N1ME0128 ME0128F.
     N1ME0129 ME0129F.
     N1ME0130 ME0130F.
     N1ME0131 ME0131F.
     N1ME0146 ME0146F.
     N1ME0147 ME0147F.
     N1ME0150 ME0150F.
     N1ME0151 ME0151F.
     N1ME0152 ME0152F.
     N1ME0153 ME0153F.
     N1ME0154 ME0154F.
     N1ME0155 ME0155F.
     N1ME0156 ME0156F.
     N1ME0157 ME0157F.
     N1ME0225 ME0225F.
     N1ME0228 ME0228F.
     N1ME0231 ME0231F.
     N1ME0234 ME0234F.
     N1ME0235 ME0235F.
     N1ME0236 ME0236F.
     N1ME0237 ME0237F.
     N1ME0238 ME0238F.
     N1ME0239 ME0239F.
     N1ME0240 ME0240F.
     N1ME0241 ME0241F.
     N1ME0242 ME0242F.
     N1ME0243 ME0243F.
     N1ME0244 ME0244F.
     N1ME0245 ME0245F.
     N1ME0246 ME0246F.
     N1ME0247 ME0247F.
     N1ME0248 ME0248F.
     N1ME0249 ME0249F.
     N1ME0250 ME0250F.
     N1ME0251 ME0251F.
     N1ME0252 ME0252F.
     N1ME0253 ME0253F.
     N1ME0254 ME0254F.
     N1ME0255 ME0255F.
     N1ME0256 ME0256F.
     N1ME0257 ME0257F.
     N1ME0258 ME0258F.
     N1ME0259 ME0259F.
     N1ME0260 ME0260F.
     N1ME0261 ME0261F.
     N1ME0262 ME0262F.
     N1ME0263 ME0263F.
     N1ME0264 ME0264F.
     N1ME0265 ME0265F.
     N1ME0266 ME0266F.
     N1ME0267 ME0267F.
     N1ME0268 ME0268F.
     N1ME0269 ME0269F.
     N1ME0270 ME0270F.
     N1ME0271 ME0271F.
     N1ME0272 ME0272F.
     N1ME0273 ME0273F.
     N1ME0274 ME0274F.
     N1ME0275 ME0275F.
     N1ME0276 ME0276F.
     N1ME0277 ME0277F.
     N1ME0278 ME0278F.
     N1ME0279 ME0279F.
     N1ME0280 ME0280F.
     N1ME0281 ME0281F.
     N1ME0282 ME0282F.
     N1ME0283 ME0283F.
     N1ME0284 ME0284F.
     N1ME0285 ME0285F.
     N1ME0290 ME0290F.
     N1ME0291 ME0291F.
     N1ME0292 ME0292F.
     N1ME0297 ME0297F.
     N1ME0306 ME0306F.
     N1ME0307 ME0307F.
     N1ME0308 ME0308F.
     N1ME0309 ME0309F.
     N1ME0310 ME0310F.
     N1ME0311 ME0311F.
     N1ME0312 ME0312F.
     N1ME0313 ME0313F.
     N1ME0314 ME0314F.
     N1ME0315 ME0315F.
     N1ME0316 ME0316F.
     N1ME0317 ME0317F.
     N1ME0318 ME0318F.
     N1ME0319 ME0319F.
     N1ME0320 ME0320F.
     N1ME0321 ME0321F.
     N1ME0322 ME0322F.
     N1ME0323 ME0323F.
     N1ME0324 ME0324F.
     N1ME0325 ME0325F.
     N1ME0326 ME0326F.
     N1ME0327 ME0327F.
     N1ME0328 ME0328F.
     N1ME0360 ME0360F.
     N1ME0361 ME0361F.
     N1ME0362 ME0362F.
     N1ME0425 ME0425F.
     N1ME0426 ME0426F.
     N1ME0427 ME0427F.
     N1ME0428 ME0428F.
     N1ME0429 ME0429F.
     N1ME0430 ME0430F.
     N1ME0431 ME0431F.
     N1ME0432 ME0432F.
     N1ME0433 ME0433F.
     N1ME0434 ME0434F.
     N1ME0435 ME0435F.
     N1ME0436 ME0436F.
     N1ME0437 ME0437F.
     N1ME0438 ME0438F.
     N1ME0439 ME0439F.
     N1ME0440 ME0440F.
     N1ME0441 ME0441F.
     N1ME0442 ME0442F.
     N1ME0443 ME0443F.
     N1ME0444 ME0444F.
     N1ME0445 ME0445F.
     N1ME0446 ME0446F.
     N1ME0447 ME0447F.
     N1ME0448 ME0448F.
     N1ME0449 ME0449F.
     N1ME0450 ME0450F.
     N1ME0451 ME0451F.
     N1ME0452 ME0452F.
     N1ME0453 ME0453F.
     N1ME0454 ME0454F.
     N1ME0455 ME0455F.
     N1ME0456 ME0456F.
     N1ME0457 ME0457F.
     N1ME0458 ME0458F.
     N1ME0459 ME0459F.
     N1ME0460 ME0460F.
     N1ME0461 ME0461F.
     N1ME0462 ME0462F.
     N1ME0463 ME0463F.
     N1ME0464 ME0464F.
     N1ME0465 ME0465F.
     N1ME0466 ME0466F.
     N1ME0467 ME0467F.
     N1ME0468 ME0468F.
     N1ME0469 ME0469F.
     N1ME0470 ME0470F.
     N1ME0471 ME0471F.
     N1ME0472 ME0472F.
     N1ME0473 ME0473F.
     N1ME0474 ME0474F.
     N1ME0475 ME0475F.
     N1ME0476 ME0476F.
     N1ME0477 ME0477F.
     N1ME0478 ME0478F.
     N1ME0479 ME0479F.
     N1ME0480 ME0480F.
     N1ME0481 ME0481F.
     N1ME0482 ME0482F.
     N1ME0483 ME0483F.
     N1ME0484 ME0484F.
     N1ME0485 ME0485F.
     N1ME0486 ME0486F.
     N1ME0487 ME0487F.
     N1ME0488 ME0488F.
     N1ME0489 ME0489F.
     N1ME0490 ME0490F.
     N1ME0491 ME0491F.
     N1ME0492 ME0492F.
     N1ME0493 ME0493F.
     N1ME0494 ME0494F.
     N1ME0495 ME0495F.
     N1ME0496 ME0496F.
     N1ME0497 ME0497F.
     N1ME0498 ME0498F.
     N1ME0499 ME0499F.
     N1ME0500 ME0500F.
     N1ME0501 ME0501F.
     N1ME0502 ME0502F.
     N1ME0503 ME0503F.
     N1ME0504 ME0504F.
     N1ME0505 ME0505F.
     N1ME0506 ME0506F.
     N1ME0507 ME0507F.
     N1ME0508 ME0508F.
     N1ME0509 ME0509F.
     N1ME0518 ME0518F.
     N1ME0519 ME0519F.
     N1ME0520 ME0520F.
     N1ME0521 ME0521F.
     N1ME0522 ME0522F.
     N1ME0523 ME0523F.
     N1ME0524 ME0524F.
     N1ME0525 ME0525F.
     N1ME0526 ME0526F.
     N1ME0527 ME0527F.
     N1ME0528 ME0528F.
     N1ME0529 ME0529F.
     N1ME0530 ME0530F.
     N1ME0531 ME0531F.
     N1ME0532 ME0532F.
     N1ME0533 ME0533F.
     N1ME0534 ME0534F.
     N1ME0535 ME0535F.
     N1ME0536 ME0536F.
     N1ME0537 ME0537F.
     N1ME0538 ME0538F.
     N1ME0539 ME0539F.
     N1ME0540 ME0540F.
     N1ME0541 ME0541F.
     N1ME0542 ME0542F.
     N1ME0543 ME0543F.
     N1ME0544 ME0544F.
     N1ME0545 ME0545F.
     N1ME0546 ME0546F.
     N1ME0547 ME0547F.
     N1ME0548 ME0548F.
     N1ME0549 ME0549F.
     N1ME0550 ME0550F.
     N1ME0551 ME0551F.
     N1ME0552 ME0552F.
     N1ME0553 ME0553F.
     N1ME0554 ME0554F.
     N1ME0555 ME0555F.
     N1ME0556 ME0556F.
     N1ME0557 ME0557F.
     N1ME0558 ME0558F.
     N1ME0559 ME0559F.
     N1ME0560 ME0560F.
     N1ME0561 ME0561F.
     N1ME0562 ME0562F.
     N1ME0563 ME0563F.
     N1ME0564 ME0564F.
     N1ME0565 ME0565F.
     N1ME0566 ME0566F.
     N1ME0567 ME0567F.
     N1ME0568 ME0568F.
     N1ME0569 ME0569F.
     N1ME0570 ME0570F.
     N1ME0571 ME0571F.
     N1ME0572 ME0572F.
     N1ME0573 ME0573F.
     N1ME0574 ME0574F.
     N1ME0575 ME0575F.
     N1ME0576 ME0576F.
     N1ME0577 ME0577F.
     N1ME0578 ME0578F.
     N1ME0579 ME0579F.
     N1ME0580 ME0580F.
     N1ME0581 ME0581F.
     N1ME0582 ME0582F.
     N1ME0583 ME0583F.
     N1ME0584 ME0584F.
     N1ME0585 ME0585F.
     N1ME0586 ME0586F.
     N1ME0587 ME0587F.
     N1ME0588 ME0588F.
     N1ME0589 ME0589F.
     N1ME0590 ME0590F.
     N1ME0591 ME0591F.
     N1ME0592 ME0592F.
     N1ME0593 ME0593F.
     N1ME0594 ME0594F.
     N1ME0595 ME0595F.
     N1ME0596 ME0596F.
     N1ME0597 ME0597F.
     N1ME0598 ME0598F.
     N1ME0599 ME0599F.
     N1ME0600 ME0600F.
     N1ME0601 ME0601F.
     N1ME0602 ME0602F.
     N1ME0603 ME0603F.
     N1ME0604 ME0604F.
     N1ME0605 ME0605F.
     N1ME0606 ME0606F.
     N1ME0607 ME0607F.
     N1ME0646 ME0646F.
     N1ME0647 ME0647F.
     N1ME0648 ME0648F.
     N1ME0649 ME0649F.
     N1ME0650 ME0650F.
     N1ME0651 ME0651F.
     N1ME0652 ME0652F.
     N1ME0653 ME0653F.
     N1ME0654 ME0654F.
     N1ME0655 ME0655F.
     N1ME0656 ME0656F.
     N1ME0657 ME0657F.
     N1ME0658 ME0658F.
     N1ME0659 ME0659F.
     N1ME0660 ME0660F.
     N1ME0661 ME0661F.
     N1ME0662 ME0662F.
     N1ME0663 ME0663F.
     N1ME0664 ME0664F.
     N1ME0665 ME0665F.
     N1ME0666 ME0666F.
     N1ME0667 ME0667F.
     N1ME0668 ME0668F.
     N1ME0669 ME0669F.
     N1ME0670 ME0670F.
     N1ME0671 ME0671F.
     N1ME0672 ME0672F.
     N1ME0673 ME0673F.
     N1ME0674 ME0674F.
     N1ME0675 ME0675F.
     N1ME0676 ME0676F.
     N1ME0677 ME0677F.
     N1ME0678 ME0678F.
     N1ME0679 ME0679F.
     N1ME0680 ME0680F.
     N1ME0681 ME0681F.
     N1ME0682 ME0682F.
     N1ME0683 ME0683F.
     N1ME0684 ME0684F.
     N1ME0685 ME0685F.
     N1ME0686 ME0686F.
     N1ME0687 ME0687F.
     N1ME0688 ME0688F.
     N1ME0689 ME0689F.
     N1ME0690 ME0690F.
     N1ME0691 ME0691F.
     N1ME0692 ME0692F.
     N1ME0693 ME0693F.
     N1ME0694 ME0694F.
     N1ME0695 ME0695F.
     N1ME0696 ME0696F.
     N1ME0697 ME0697F.
     N1ME0698 ME0698F.
     N1ME0699 ME0699F.
     N1ME0700 ME0700F.
     N1ME0701 ME0701F.
     N1ME0702 ME0702F.
     N1ME0703 ME0703F.
     N1ME0704 ME0704F.
     N1ME0705 ME0705F.
     N1ME0706 ME0706F.
     N1ME0707 ME0707F.
     N1ME0711 ME0711F.
     N1ME0712 ME0712F.
     N1ME0715 ME0715F.
     N1ME0718 ME0718F.
     N1ME0721 ME0721F.
     N1ME0724 ME0724F.
     N1ME0725 ME0725F.
     N1ME0730 ME0730F.
     N1ME0735 ME0735F.
     N1ME0740 ME0740F.
     N1ME0745 ME0745F.
     N1ME0750 ME0750F.
     N1ME0755 ME0755F.
     N1ME0760 ME0760F.
     N1ME0765 ME0765F.
     N1ME0770 ME0770F.
     N1ME0775 ME0775F.
     N1ME0780 ME0780F.
     N1ME0785 ME0785F.
     N1ME0790 ME0790F.
     N1ME0795 ME0795F.
     N1ME0797 ME0797F.
     N1ME0825 ME0825F.
     N1ME0826 ME0826F.
     N1ME0827 ME0827F.
     N1ME0828 ME0828F.
     N1ME0829 ME0829F.
     N1ME0830 ME0830F.
     N1ME0831 ME0831F.
     N1ME0832 ME0832F.
     N1ME0833 ME0833F.
     N1ME0834 ME0834F.
     N1ME0835 ME0835F.
     N1ME0836 ME0836F.
     N1ME0837 ME0837F.
     N1ME0838 ME0838F.
     N1ME0839 ME0839F.
     ;

	INPUT
         SEQN 1-5
         N1ME0006 6-9
         N1ME0010 10
         N1ME0011 11
         N1ME0012 12
         N1ME0013 13
         N1ME0014 14
         N1ME0015 15
         N1ME0016 16
         N1ME0017 17-18
         N1ME0019 19
         N1ME0020 20-21
         N1ME0022 22
         N1ME0023 23-24
         N1ME0025 25-26
         N1ME0027 27
         N1ME0028 28
         N1ME0029 29
         N1ME0030 30
         N1ME0031 31
         N1ME0032 32
         N1ME0033 33
         N1ME0034 34-35
         N1ME0036 36
         N1ME0037 37-40
         N1ME0041 41
         N1ME0042 42-45
         N1ME0046 46
         N1ME0047 47-50
         N1ME0051 51
         N1ME0052 52-55
         N1ME0056 56
         N1ME0057 57-60
         N1ME0061 61
         N1ME0062 62-65
         N1ME0066 66
         N1ME0067 67-70
         N1ME0071 71
         N1ME0072 72-75
         N1ME0076 76
         N1ME0077 77-80
         N1ME0081 81
         N1ME0082 82-85
         N1ME0086 86
         N1ME0087 87-90
         N1ME0091 91-94
         N1ME0095 95-99
         N1ME0100 100
         N1ME0101 101-102
         N1ME0103 103
         N1ME0104 104
         N1ME0105 105
         N1ME0106 106-109
         N1ME0110 110-111
         N1ME0112 112-113
         N1ME0114 114
         N1ME0115 115
         N1ME0116 116
         N1ME0117 117
         N1ME0118 118
         N1ME0119 119
         N1ME0120 120-121
         N1ME0122 122
         N1ME0123 123
         N1ME0124 124
         N1ME0125 125
         N1ME0126 126
         N1ME0127 127
         N1ME0128 128
         N1ME0129 129
         N1ME0130 130
         N1ME0131 131
         N1ME0132 132-134
         N1ME0135 135-137
         N1ME0138 138-143
         N1ME0144 144-145
         N1ME0146 146
         N1ME0147 147-149
         N1ME0150 150
         N1ME0151 151
         N1ME0152 152
         N1ME0153 153
         N1ME0154 154
         N1ME0155 155
         N1ME0156 156
         N1ME0157 157
         N1ME0158 158-163
         N1ME0164 164-169
         N1ME0170 170-175
         N1ME0176 176-181
         N1ME0182 182-187
         N1ME0188 188-193
         N1ME0194 194-195
         N1ME0196 196-198
         N1ME0199 199-200
         N1ME0201 201-204
         N1ME0205 205-224
         N1ME0225 225-227
         N1ME0228 228-230
         N1ME0231 231-233
         N1ME0234 234
         N1ME0235 235
         N1ME0236 236
         N1ME0237 237
         N1ME0238 238
         N1ME0239 239
         N1ME0240 240
         N1ME0241 241
         N1ME0242 242
         N1ME0243 243
         N1ME0244 244
         N1ME0245 245
         N1ME0246 246
         N1ME0247 247
         N1ME0248 248
         N1ME0249 249
         N1ME0250 250
         N1ME0251 251
         N1ME0252 252
         N1ME0253 253
         N1ME0254 254
         N1ME0255 255
         N1ME0256 256
         N1ME0257 257
         N1ME0258 258
         N1ME0259 259
         N1ME0260 260
         N1ME0261 261
         N1ME0262 262
         N1ME0263 263
         N1ME0264 264
         N1ME0265 265
         N1ME0266 266
         N1ME0267 267
         N1ME0268 268
         N1ME0269 269
         N1ME0270 270
         N1ME0271 271
         N1ME0272 272
         N1ME0273 273
         N1ME0274 274
         N1ME0275 275
         N1ME0276 276
         N1ME0277 277
         N1ME0278 278
         N1ME0279 279
         N1ME0280 280
         N1ME0281 281
         N1ME0282 282
         N1ME0283 283
         N1ME0284 284
         N1ME0285 285-289
         N1ME0290 290
         N1ME0291 291
         N1ME0292 292-296
         N1ME0297 297
         N1ME0298 298-305
         N1ME0306 306
         N1ME0307 307
         N1ME0308 308
         N1ME0309 309
         N1ME0310 310
         N1ME0311 311
         N1ME0312 312
         N1ME0313 313
         N1ME0314 314
         N1ME0315 315
         N1ME0316 316
         N1ME0317 317
         N1ME0318 318
         N1ME0319 319
         N1ME0320 320
         N1ME0321 321
         N1ME0322 322
         N1ME0323 323
         N1ME0324 324
         N1ME0325 325
         N1ME0326 326
         N1ME0327 327
         N1ME0328 328
         N1ME0329 329-332
         N1ME0333 333-335
         N1ME0336 336-338
         N1ME0339 339-341
         N1ME0342 342-344
         N1ME0345 345-347
         N1ME0348 348-350
         N1ME0351 351-353
         N1ME0354 354-356
         N1ME0357 357-359
         N1ME0360 360
         N1ME0361 361
         N1ME0362 362-365
         N1ME0366 366-424
         N1ME0425 425
         N1ME0426 426
         N1ME0427 427
         N1ME0428 428
         N1ME0429 429
         N1ME0430 430
         N1ME0431 431
         N1ME0432 432
         N1ME0433 433
         N1ME0434 434
         N1ME0435 435
         N1ME0436 436
         N1ME0437 437
         N1ME0438 438
         N1ME0439 439
         N1ME0440 440
         N1ME0441 441
         N1ME0442 442
         N1ME0443 443
         N1ME0444 444
         N1ME0445 445
         N1ME0446 446
         N1ME0447 447
         N1ME0448 448
         N1ME0449 449
         N1ME0450 450
         N1ME0451 451
         N1ME0452 452
         N1ME0453 453
         N1ME0454 454
         N1ME0455 455
         N1ME0456 456
         N1ME0457 457
         N1ME0458 458
         N1ME0459 459
         N1ME0460 460
         N1ME0461 461
         N1ME0462 462
         N1ME0463 463
         N1ME0464 464
         N1ME0465 465
         N1ME0466 466
         N1ME0467 467
         N1ME0468 468
         N1ME0469 469
         N1ME0470 470
         N1ME0471 471
         N1ME0472 472
         N1ME0473 473
         N1ME0474 474
         N1ME0475 475
         N1ME0476 476
         N1ME0477 477
         N1ME0478 478
         N1ME0479 479
         N1ME0480 480
         N1ME0481 481
         N1ME0482 482
         N1ME0483 483
         N1ME0484 484
         N1ME0485 485
         N1ME0486 486
         N1ME0487 487
         N1ME0488 488
         N1ME0489 489
         N1ME0490 490
         N1ME0491 491
         N1ME0492 492
         N1ME0493 493
         N1ME0494 494
         N1ME0495 495
         N1ME0496 496
         N1ME0497 497
         N1ME0498 498
         N1ME0499 499
         N1ME0500 500
         N1ME0501 501
         N1ME0502 502
         N1ME0503 503
         N1ME0504 504
         N1ME0505 505
         N1ME0506 506
         N1ME0507 507
         N1ME0508 508
         N1ME0509 509
         N1ME0510 510
         N1ME0511 511
         N1ME0512 512
         N1ME0513 513
         N1ME0514 514
         N1ME0515 515
         N1ME0516 516
         N1ME0517 517
         N1ME0518 518
         N1ME0519 519
         N1ME0520 520
         N1ME0521 521
         N1ME0522 522
         N1ME0523 523
         N1ME0524 524
         N1ME0525 525
         N1ME0526 526
         N1ME0527 527
         N1ME0528 528
         N1ME0529 529
         N1ME0530 530
         N1ME0531 531
         N1ME0532 532
         N1ME0533 533
         N1ME0534 534
         N1ME0535 535
         N1ME0536 536
         N1ME0537 537
         N1ME0538 538
         N1ME0539 539
         N1ME0540 540
         N1ME0541 541
         N1ME0542 542
         N1ME0543 543
         N1ME0544 544
         N1ME0545 545
         N1ME0546 546
         N1ME0547 547
         N1ME0548 548
         N1ME0549 549
         N1ME0550 550
         N1ME0551 551
         N1ME0552 552
         N1ME0553 553
         N1ME0554 554
         N1ME0555 555
         N1ME0556 556
         N1ME0557 557
         N1ME0558 558
         N1ME0559 559
         N1ME0560 560
         N1ME0561 561
         N1ME0562 562
         N1ME0563 563
         N1ME0564 564
         N1ME0565 565
         N1ME0566 566
         N1ME0567 567
         N1ME0568 568
         N1ME0569 569
         N1ME0570 570
         N1ME0571 571
         N1ME0572 572
         N1ME0573 573
         N1ME0574 574
         N1ME0575 575
         N1ME0576 576
         N1ME0577 577
         N1ME0578 578
         N1ME0579 579
         N1ME0580 580
         N1ME0581 581
         N1ME0582 582
         N1ME0583 583
         N1ME0584 584
         N1ME0585 585
         N1ME0586 586
         N1ME0587 587
         N1ME0588 588
         N1ME0589 589
         N1ME0590 590
         N1ME0591 591
         N1ME0592 592
         N1ME0593 593
         N1ME0594 594
         N1ME0595 595
         N1ME0596 596
         N1ME0597 597
         N1ME0598 598
         N1ME0599 599
         N1ME0600 600
         N1ME0601 601
         N1ME0602 602
         N1ME0603 603
         N1ME0604 604
         N1ME0605 605
         N1ME0606 606
         N1ME0607 607
         N1ME0608 608
         N1ME0609 609
         N1ME0610 610
         N1ME0611 611
         N1ME0612 612
         N1ME0613 613
         N1ME0614 614
         N1ME0615 615
         N1ME0616 616
         N1ME0617 617
         N1ME0618 618
         N1ME0619 619
         N1ME0620 620
         N1ME0621 621
         N1ME0622 622
         N1ME0623 623
         N1ME0624 624
         N1ME0625 625
         N1ME0626 626
         N1ME0627 627
         N1ME0628 628
         N1ME0629 629
         N1ME0630 630
         N1ME0631 631
         N1ME0632 632
         N1ME0633 633
         N1ME0634 634
         N1ME0635 635
         N1ME0636 636
         N1ME0637 637
         N1ME0638 638
         N1ME0639 639
         N1ME0640 640
         N1ME0641 641
         N1ME0642 642
         N1ME0643 643
         N1ME0644 644
         N1ME0645 645
         N1ME0646 646
         N1ME0647 647
         N1ME0648 648
         N1ME0649 649
         N1ME0650 650
         N1ME0651 651
         N1ME0652 652
         N1ME0653 653
         N1ME0654 654
         N1ME0655 655
         N1ME0656 656
         N1ME0657 657
         N1ME0658 658
         N1ME0659 659
         N1ME0660 660
         N1ME0661 661
         N1ME0662 662
         N1ME0663 663
         N1ME0664 664
         N1ME0665 665
         N1ME0666 666
         N1ME0667 667
         N1ME0668 668
         N1ME0669 669
         N1ME0670 670
         N1ME0671 671
         N1ME0672 672
         N1ME0673 673
         N1ME0674 674
         N1ME0675 675
         N1ME0676 676
         N1ME0677 677
         N1ME0678 678
         N1ME0679 679
         N1ME0680 680
         N1ME0681 681
         N1ME0682 682
         N1ME0683 683
         N1ME0684 684
         N1ME0685 685
         N1ME0686 686
         N1ME0687 687
         N1ME0688 688
         N1ME0689 689
         N1ME0690 690
         N1ME0691 691
         N1ME0692 692
         N1ME0693 693
         N1ME0694 694
         N1ME0695 695
         N1ME0696 696
         N1ME0697 697
         N1ME0698 698
         N1ME0699 699
         N1ME0700 700
         N1ME0701 701
         N1ME0702 702
         N1ME0703 703
         N1ME0704 704
         N1ME0705 705
         N1ME0706 706
         N1ME0707 707-710
         N1ME0711 711
         N1ME0712 712-714
         N1ME0715 715-717
         N1ME0718 718-720
         N1ME0721 721-723
         N1ME0724 724
         N1ME0725 725
         N1ME0726 726
         N1ME0727 727-729
         N1ME0730 730
         N1ME0731 731
         N1ME0732 732-734
         N1ME0735 735
         N1ME0736 736
         N1ME0737 737-739
         N1ME0740 740
         N1ME0741 741
         N1ME0742 742-744
         N1ME0745 745
         N1ME0746 746
         N1ME0747 747-749
         N1ME0750 750
         N1ME0751 751
         N1ME0752 752-754
         N1ME0755 755
         N1ME0756 756
         N1ME0757 757-759
         N1ME0760 760
         N1ME0761 761
         N1ME0762 762-764
         N1ME0765 765
         N1ME0766 766
         N1ME0767 767-769
         N1ME0770 770
         N1ME0771 771
         N1ME0772 772-774
         N1ME0775 775
         N1ME0776 776
         N1ME0777 777-779
         N1ME0780 780
         N1ME0781 781
         N1ME0782 782-784
         N1ME0785 785
         N1ME0786 786
         N1ME0787 787-789
         N1ME0790 790
         N1ME0791 791
         N1ME0792 792-794
         N1ME0795 795
         N1ME0796 796
         N1ME0797 797-799
         N1ME0800 800-824
         N1ME0825 825
         N1ME0826 826
         N1ME0827 827
         N1ME0828 828
         N1ME0829 829
         N1ME0830 830
         N1ME0831 831
         N1ME0832 832
         N1ME0833 833
         N1ME0834 834
         N1ME0835 835
         N1ME0836 836
         N1ME0837 837
         N1ME0838 838
         N1ME0839 839
         N1ME0840 840-850
      ;

      LABEL
         SEQN = "SAMPLE SEQUENCE NUMBER"
         N1ME0006 = "CATALOG NUMBER 4271"
         N1ME0010 = "SIZE OF PLACE"
         N1ME0011 = "SMSA-NOT SMSA"
         N1ME0012 = "TYPE OF LIVING QUARTERS"
         N1ME0013 = "LAND USAGE"
         N1ME0014 = "IF RURAL, ASKED HOW MANY ACRES OF LA ..."
         N1ME0015 = "IF 10 ACRES OF MORE, ASKED IF SALE O ..."
         N1ME0016 = "IF 10 ACRES OR LESLL, ASKED IF SALE  ..."
         N1ME0017 = "AGE-HEAD OF HOUSEHOLD"
         N1ME0019 = "SEX-HEAD OF HOUSEHOLD"
         N1ME0020 = "HIGHEST GRADE ATTENDED-HEAD OF HOUSEHOLD"
         N1ME0022 = "RACE-HEAD OF HOUSEHOLD"
         N1ME0023 = "TOTAL NUMBER OF PERSONS IN HOUSEHOLD"
         N1ME0025 = "TOTAL SAMPLE PERSONS IN HOUSEHOLD"
         N1ME0027 = "NUMBER OF ROOMS IN H9OUSE "
         N1ME0028 = "IS THERE PIPED WATER?"
         N1ME0029 = "IS THER HOT AND COLD PIPED WATER?"
         N1ME0030 = "IF YES TO PIPED WATER-DOES HOUS HAVE ..."
         N1ME0031 = "DOES HOUSE HAVE A RANGE OR COOK STOVE?"
         N1ME0032 = "DOES HOUSE HAVE A REFRIGERATOR?"
         N1ME0033 = "ARE KITCHEN FACILITIES USED BY ANYON ..."
         N1ME0034 = "TOTAL FAMILY INCOME GROUP"
         N1ME0036 = "WAGES OR SALARIES?"
         N1ME0037 = "IF YES TO ABOVE, HOW MUCH ALTOGETHER ..."
         N1ME0041 = "SOCIAL SECURITY OR  RAILROAD RETIREMENT?"
         N1ME0042 = "IF YES TO ABOVE, HOW MUCH ALTOGETHER?"
         N1ME0046 = "WELFARE PAYMENTS OR OTHER PUBLIC ASS ..."
         N1ME0047 = "IF YES TO ABOVE, HOW MUCH ALTOGETHER?"
         N1ME0051 = "UNEMPLOYMENT OR WORKMEN'S COMPENSATION?"
         N1ME0052 = "IF YES TO ABOVE, HOW MUCH ALTOGETHER?"
         N1ME0056 = "BOVERNMENT EMPLOYEE PESIONS OR PRIVA ..."
         N1ME0057 = "IF YES TO ABOVE, HOW MUCH ALTOGETHER?"
         N1ME0061 = "DIVENDES, INTEREST OR RENT?"
         N1ME0062 = "IF YES TO ABOVE, HOW MUCH ALTOGETHER?"
         N1ME0066 = "NET INCOME FROM  OWN NON-FARM BUSINE ..."
         N1ME0067 = "IF YES TO ABOVE, HOW MUCH ALTOGETHER?"
         N1ME0071 = "NET INCOME FROM A FARM?"
         N1ME0072 = "IF YES TO ABOVE, HOW MUCH ALTOGETHER?"
         N1ME0076 = "VETERAN'S PAYMENTS"
         N1ME0077 = "IF YES TO ABOVE, HOW MUCH ALTOGETHER?"
         N1ME0081 = "ALIMONY, CHILD SUPPORT OR CONTRIBUTI ..."
         N1ME0082 = "IF YES TO ABOVE, HOW MUCH ALTOGETHER?"
         N1ME0086 = "ANY OTHER INCOME?"
         N1ME0087 = "IF YES TO ABOVE, HOW MUCH ALTOGETHER?"
         N1ME0091 = "TOTAL AMOUNT(OTAL OF POSITIONS 37-90)"
         N1ME0095 = "FAMILY UNIT CODE"
         N1ME0100 = "RELATIONSHIP TO HEAD OF HOUSEHOLD"
         N1ME0101 = "AGE AT INTERVIEW"
         N1ME0103 = "RACE OF EXAMINED PERSON"
         N1ME0104 = "SEX OF EXAMINED PERSON"
         N1ME0105 = "MARITAL STATUS"
         N1ME0106 = "DATE OF BIRTH (MONTH, YEAR)"
         N1ME0110 = "PLACE OF BIRTH"
         N1ME0112 = "HIGHEST GRADE OF REGULAR SCHOOL EVER ..."
         N1ME0114 = "DID HE FINISH THE GRADE?"
         N1ME0115 = "IS HE ATTENDING SCHOOL NOW?"
         N1ME0116 = "HAS HE EVER ATTENDED A SCHOOL OF ANY ..."
         N1ME0117 = "IF YES, WHAT KIND OF SCHOOL?"
         N1ME0118 = "IS ANY LANGUAGE OTHER THAN ENGLISH F ..."
         N1ME0119 = "IF YES, WHAT LANGUAGE"
         N1ME0120 = "WHAT IS YOUR MAIN ANCESTRY OR NATION ..."
         N1ME0122 = "WHAT WAS HE DOING MOST PAST THREE MO ..."
         N1ME0123 = "IF ' SOMETHING ELSE' FROM ABOVE, WHA ..."
         N1ME0124 = "IF 'KEEPING HOUSE' OR 'SOMETHING ELS ..."
         N1ME0125 = "IF 'WORKING' FROM ABOVE, DID HE WORK ..."
         N1ME0126 = "DID HE WORK AT ANY TIME LAST WEEK OR ..."
         N1ME0127 = "IF 'NO TO ABOVE, EVEN THOUGH HE DID  ..."
         N1ME0128 = "IF 'NO' IN POSITION 126, WAS HE LOOK ..."
         N1ME0129 = "IF YES TO ABOVE-WHICH?"
         N1ME0130 = "CLASS OF WORKER"
         N1ME0131 = "IF SELF-EMPLOYED IN 'OWN' BUSINESS A ..."
         N1ME0132 = "BUSINESS OR INDUSTRY CODE"
         N1ME0135 = "OCCUPATION CODE"
         N1ME0138 = "DATE OF EXAMINATION"
         N1ME0144 = "AGE AT EXAMINATION"
         N1ME0146 = "FARM"
         N1ME0147 = "POVERTY INDEX (X.XX)"
         N1ME0150 = "RELGION"
         N1ME0151 = "FOOD PROGRAMS APPLICABLITY"
         N1ME0152 = "ARE YOU CERTIFIED TO PARTICIPATE IN  ..."
         N1ME0153 = "ARE YOU BUYING STAMPS NOW?"
         N1ME0154 = "WHAT IS THE MAIN REASON YOU AREN'T P ..."
         N1ME0155 = "ARE YOU CERTIFIED TO PARTICIPATE IN  ..."
         N1ME0156 = "ARE YOU RECEIVING COMMODITY FOODS  N ..."
         N1ME0157 = "WHY AREN'T YOU PARTICPATING IN THE P ..."
         N1ME0158 = "DETAILED PERSONS-LOCATIONS 1-35"
         N1ME0164 = "ALL SAMPLE PERSONS-LOCATIONS 1-35"
         N1ME0170 = "DETAILED PERSONS-LOCATIONS 1-65"
         N1ME0176 = "ALL SAMPLE PERSONS-LOCATIONS 1-65"
         N1ME0182 = "DETAILED PERSONS-LOCATIONS  66-100"
         N1ME0188 = "DETALED PERSONS LOCATION 1-1000"
         N1ME0194 = "STRATA 1"
         N1ME0196 = "PRIMARY SAMPLING UNITS 1"
         N1ME0199 = "DATA USER WORK AREA"
         N1ME0201 = "CATALOG NUMBER 4233"
         N1ME0205 = "DATA USER WORK AREA"
         N1ME0225 = "PULSE"
         N1ME0228 = "SYSTOLIC"
         N1ME0231 = "DIASTOLIC"
         N1ME0234 = "HEAD, EYES, EARS, NOSE AND THROAT"
         N1ME0235 = "FINDINGS: DRY, STARING HAIR"
         N1ME0236 = "DYSPIGMENTED HAIR"
         N1ME0237 = "EASILY PLUCKABLE HAIR"
         N1ME0238 = "ABNORMAL TEXTURE OF LOSS OF CURL"
         N1ME0239 = "CIRCUMCORNEAL INJECTION"
         N1ME0240 = "CONJUNCTIVAL INJECTION"
         N1ME0241 = "ANGULAR BLEPHAITIS"
         N1ME0242 = "XEROSIS"
         N1ME0243 = "BITOT'S SPOTS"
         N1ME0244 = "KERATOMALACIA"
         N1ME0245 = "XEROPHTHALMIA"
         N1ME0246 = "ANGULAR LESIONS OF LIPS"
         N1ME0247 = "ANGULAR SCARS OF LIPS"
         N1ME0248 = "CHEILOSIS"
         N1ME0249 = "FILFORM PAPILLARY ATROPHY OF TONGUE"
         N1ME0250 = "FUNGIFORM PAPILLARY HYPERTROPHY OF T ..."
         N1ME0251 = "GEOGRAPHIC TONGUE"
         N1ME0252 = "FISSURES OF TONGUE"
         N1ME0253 = "SEPERATIONS OR SWELLING OF TONGUE"
         N1ME0254 = "SCARLET BEEFY TONGUE"
         N1ME0255 = "MAGENTA TONGUE"
         N1ME0256 = "NASO-LABIAL SEBORRHEA"
         N1ME0257 = "VISIBLE ENLARGED PAROTIDS"
         N1ME0258 = "BOSSING OF SKULL"
         N1ME0259 = "OTHER "
         N1ME0260 = "THYROIDS EVALUATION"
         N1ME0261 = "OTHER THYROID FINDING"
         N1ME0262 = "FINDINGS-TENDERNESS"
         N1ME0263 = "FINDINGS-NODULE"
         N1ME0264 = "ISTHMUS"
         N1ME0265 = "OTHER "
         N1ME0266 = "CHEST EVALUATION"
         N1ME0267 = "BEADING OF RIBS"
         N1ME0268 = "FOLLICULAR HYPERKERATOSIS OF UPPER BACK"
         N1ME0269 = "WHEEZING ON AUSCULTATION (DIFFUSE)"
         N1ME0270 = "WHEEZING ON AUSCULTATION (FOCAL)"
         N1ME0271 = "DECREASED BREATH SOUNDS"
         N1ME0272 = "OTHER FINDINGS"
         N1ME0273 = "CARDIOVASCULAR EVALUATION"
         N1ME0274 = "IF FINDINGS: CYANOSIS"
         N1ME0275 = "IRREGULAR PULSE"
         N1ME0276 = "CARDIAC MURMUR"
         N1ME0277 = "OTHER FINDINGS"
         N1ME0278 = "ABDOMINAL EVALUATION"
         N1ME0279 = "IF FINDINGS: HEPATOMEGALY"
         N1ME0280 = "SPELENOMEGALY"
         N1ME0281 = "UTERINE ENLARGEMENT"
         N1ME0282 = "UMBILICAL HERNIA"
         N1ME0283 = "POT BELLY "
         N1ME0284 = "MASS(ES)"
         N1ME0285 = "AREA(S) OF MASS(ES)"
         N1ME0290 = "OTHER FINDINGS"
         N1ME0291 = "SURGICAL SCARS"
         N1ME0292 = "AREA(S) OF SURGICAL SCAR"
         N1ME0297 = "OTHER FINDINGS"
         N1ME0298 = "WORK AREA"
         N1ME0306 = "MUSCULOSKELETAL EVALUATION"
         N1ME0307 = "BOW LEGS"
         N1ME0308 = "KNOCK KNEES"
         N1ME0309 = "EPIPHYSIAL ENLARGEMENT, WRISTS"
         N1ME0310 = "OTHER FINDINGS"
         N1ME0311 = "NEUROLOGICAL EVALUATION"
         N1ME0312 = "ABSENT KNEE JERKS"
         N1ME0313 = "ABSENT ANKLE JERKS"
         N1ME0314 = "POSITIVE CHVOSTEK SIGN"
         N1ME0315 = "APATHY"
         N1ME0316 = "MARKED HYPERIRRITABILITY"
         N1ME0317 = "OTHER"
         N1ME0318 = "SKIN EVALUATION"
         N1ME0319 = "IF FINDINGS: FOLLICULAR HYPERKERATOS ..."
         N1ME0320 = "HYPERPIGMENTATION, HANDS AND FACE"
         N1ME0321 = "DRY OR SCALING SKIN"
         N1ME0322 = "PERIFOLLICULOSIS"
         N1ME0323 = "PETECHIAL"
         N1ME0324 = "MOSAIC SKIN"
         N1ME0325 = "PELLAGROUS DERMATITIS"
         N1ME0326 = "ECCHYMOSES"
         N1ME0327 = "OTHER FINDINGS"
         N1ME0328 = "GENERAL EVALUATION"
         N1ME0329 = "WORK AREA"
         N1ME0333 = "SUMMARY OF FINDINGS BY ICD CODE FIND ..."
         N1ME0336 = "FINDINGS #2"
         N1ME0339 = "FINDINGS #3"
         N1ME0342 = "FINDINGS #4"
         N1ME0345 = "FINDINGS #5"
         N1ME0348 = "FINDINGS #6"
         N1ME0351 = "FINDINGS #7"
         N1ME0354 = "FINDINGS #8"
         N1ME0357 = "FINDINGS #9"
         N1ME0360 = "EXAMNER'S SUBJECTIVE IMPRESSION OF N ..."
         N1ME0361 = "OBESE"
         N1ME0362 = "TEMPERATURE (XXX.X)"
         N1ME0366 = "WORK AREA"
         N1ME0425 = "EXTERNAL EAR (EXCEPT CANAL) RIGHT EAR"
         N1ME0426 = "LEFT EAR"
         N1ME0427 = "OPERATIVE SCAR (RIGHT)"
         N1ME0428 = "OPERATIVE SCAR (LEFT)"
         N1ME0429 = "OTHER (RIGHT)"
         N1ME0430 = "OTHER (LEFT)"
         N1ME0431 = "PIERCED EARS"
         N1ME0432 = "AUDITORY CANAL RIGHT EAR"
         N1ME0433 = "LEFT EAR"
         N1ME0434 = "OCCLUDED (RIGHT)"
         N1ME0435 = "OCCLUDED (LEFT)"
         N1ME0436 = "OCCLUDED BY-(RIGHT)"
         N1ME0437 = "OCCLUDED BY-(LEFT)"
         N1ME0438 = "DRUM (RIGHT)"
         N1ME0439 = "DRUM (LEFT)"
         N1ME0440 = "DULL-TRANSPARENT (RIGHT)"
         N1ME0441 = "DULL-TRANSPARENT (LEFT)"
         N1ME0442 = "BULGING-RETRACTED (RIGHT)"
         N1ME0443 = "BULGING-RETRACTED (LEFT)"
         N1ME0444 = "CALCIUM PLAQUES (RIGHT)"
         N1ME0445 = "CALCIUM PLAQUES (LEFT)"
         N1ME0446 = "OTHER FINDINGS (RIGHT)"
         N1ME0447 = "OTHER FINDINGS (LEFT)"
         N1ME0448 = "RED-OTHER DISCOLORATION (RIGHT)"
         N1ME0449 = "RED-OTHER DISCOLORATION (LEFT)"
         N1ME0450 = "FLUID (RIGHT)"
         N1ME0451 = "FLUID (LEFT)"
         N1ME0452 = "SCARS (RIGHT)"
         N1ME0453 = "SCARS (LEFT)"
         N1ME0454 = "PERFORATED (RIGHT)"
         N1ME0455 = "PERFORATED (LEFT)"
         N1ME0456 = "NARES (RIGHT)"
         N1ME0457 = "NARES (LEFT)"
         N1ME0458 = "OBSTRUCTION (RIGHT)"
         N1ME0459 = "OBSTRUCTION (LEFT)"
         N1ME0460 = "DEVIATED SEPTUM (RIGHT)"
         N1ME0461 = "DEVIATED SEPTUM (LEFT)"
         N1ME0462 = "SWOLLEN TURBINATES (RIGHT)"
         N1ME0463 = "SWOLLEN TURBINATES (LEFT)"
         N1ME0464 = "CHRONIC INFLAMMATION (RIGHT)"
         N1ME0465 = "CHRONIC INFLAMMATION (LEFT)"
         N1ME0466 = "OTHER (RIGHT)"
         N1ME0467 = "OTHER (LEFT)"
         N1ME0468 = "NECK "
         N1ME0469 = "ADENOPATHY"
         N1ME0470 = "TRACHEAL DEVIATION"
         N1ME0471 = "OTHER"
         N1ME0472 = "CHEST AUSCULTATION"
         N1ME0473 = "RIGHT CHEST-UPPER LOBE"
         N1ME0474 = "BRONCHIAL BREATH SOUNDS"
         N1ME0475 = "RALES"
         N1ME0476 = "RHONCHI"
         N1ME0477 = "WHEEZE"
         N1ME0478 = "MIDDLE LOBE"
         N1ME0479 = "BRONCHIAL BREATH SOUNDS"
         N1ME0480 = "RALES"
         N1ME0481 = "RHONCHI"
         N1ME0482 = "WHEEZE"
         N1ME0483 = "LOWER LOBE"
         N1ME0484 = "BRONCHIAL BREATH SOUNDS"
         N1ME0485 = "RALES"
         N1ME0486 = "RHONCHI"
         N1ME0487 = "WHEEZE"
         N1ME0488 = "LEFT CHEST UPPER LOBE"
         N1ME0489 = "BRONCHIAL BREATH SOUNDS"
         N1ME0490 = "RALES"
         N1ME0491 = "RHONCHI"
         N1ME0492 = "WHEEZE"
         N1ME0493 = "LOWER LOBE"
         N1ME0494 = "BRONCHIAL BREATH SOUNDS"
         N1ME0495 = "RALES"
         N1ME0496 = "RHONCHI"
         N1ME0497 = "WHEEZE"
         N1ME0498 = "OTHER CHEST FINDINGS"
         N1ME0499 = "PMI (POINT OF MAXIMAL IMPULSE)"
         N1ME0500 = "INTERSPACE"
         N1ME0501 = "MIDCLAVICULAR"
         N1ME0502 = "THRILLS"
         N1ME0503 = "SYSTOLIC"
         N1ME0504 = "DIASTOLIC"
         N1ME0505 = "FIRST HEART SOUND"
         N1ME0506 = "SECOND HEART SOUND"
         N1ME0507 = "MURMURS"
         N1ME0508 = "IF MURMUR-TYPE (SYSTOLIC)"
         N1ME0509 = "IF MURMUR-TYPE (DIASTOLIC)"
         N1ME0510 = "APEX-SYSTOLIC"
         N1ME0511 = "APEX-DIASTOLIC"
         N1ME0512 = "MEDPRECORDIUM-SYSTOLIC"
         N1ME0513 = "MEDPRECORDIUM-DIASTOLIC"
         N1ME0514 = "LEFT BASE-SYSTOLIC"
         N1ME0515 = "LEFT BASE-DIASTOLIC"
         N1ME0516 = "RIGHT BASE-DIASTOLIC"
         N1ME0517 = "RIGHT BASE-SYSTOLIC"
         N1ME0518 = "MITRAL"
         N1ME0519 = "AORTIC"
         N1ME0520 = "TRICUSPID"
         N1ME0521 = "PULMONIC"
         N1ME0522 = "ASD"
         N1ME0523 = "VSD"
         N1ME0524 = "OTHER"
         N1ME0525 = "DON'T KNOW"
         N1ME0526 = "OTHER CARDIAC OR CARDIOBASCULAR FINDINGS"
         N1ME0527 = "EDEMA"
         N1ME0528 = "OTHER "
         N1ME0529 = "NECK VEIN DISTENSION"
         N1ME0530 = "RIGHT RADIAL"
         N1ME0531 = "RIGHT FEMORAL"
         N1ME0532 = "RIGHT DORSIS PEDIS"
         N1ME0533 = "LEFT RADIAL"
         N1ME0534 = "LEFT FEMORAL"
         N1ME0535 = "LEFT DORSALIS PEDIS"
         N1ME0536 = "RIGHT RADIAL"
         N1ME0537 = "RIGHT FEMORAL"
         N1ME0538 = "RIGHT DORSIS PEDIS"
         N1ME0539 = "OTHER"
         N1ME0540 = "LEFT RADIAL"
         N1ME0541 = "LEFT FEMORAL"
         N1ME0542 = "LEFT DORSALIS PEDIS"
         N1ME0543 = "OTHER "
         N1ME0544 = "KNEES"
         N1ME0545 = "GENU VARUM"
         N1ME0546 = "GENU VARUM"
         N1ME0547 = "GENU RECURVATUM"
         N1ME0548 = "FIXED FLEXION"
         N1ME0549 = "OTHER"
         N1ME0550 = "RIGHT MEDIAL"
         N1ME0551 = "RIGHT MEDIAL"
         N1ME0552 = "RIGHT LATERAL"
         N1ME0553 = "RIGHT LATERAL"
         N1ME0554 = "RIGHT DIFFUSE"
         N1ME0555 = "RIGHT DIFFUSE"
         N1ME0556 = "LEFT MEDIAL"
         N1ME0557 = "LEFT MEDIAL"
         N1ME0558 = "LEFT LATERAL"
         N1ME0559 = "LEFT LATERAL"
         N1ME0560 = "LEFT DIFFUSE"
         N1ME0561 = "LEFT DIFFUSE"
         N1ME0562 = "RIGHT SUPRAPATERLLAR"
         N1ME0563 = "LEFT SUPRAPATERLLAR"
         N1ME0564 = "RIGHT INFRAPATELLAR"
         N1ME0565 = "LEFT INFRAPATELLAR"
         N1ME0566 = "SWELLING"
         N1ME0567 = "FLUID"
         N1ME0568 = "SOFT TISSUE PROLIFEATION"
         N1ME0569 = "SUBPATELLAR CREPITUS"
         N1ME0570 = "MUSCULAR WASTING THIGH"
         N1ME0571 = "OTHER"
         N1ME0572 = "HIPS"
         N1ME0573 = "EXTENSION--ACTIVE"
         N1ME0574 = "EXTENTION--PASSIVE"
         N1ME0575 = "FLEXION--ACTIVE"
         N1ME0576 = "FLEXION--PASSIVE"
         N1ME0577 = "ABDUCTION--ACTIVE"
         N1ME0578 = "ABDUCTION--PASSIVE"
         N1ME0579 = "ADDUCTION--ACTIVE"
         N1ME0580 = "ADDUCTION--PASSIVE"
         N1ME0581 = "EXTERNAL ROTATION--ACTIVE"
         N1ME0582 = "EXTERNAL ROTATION--PASSIVE"
         N1ME0583 = "INTERNAL ROTATION--ACTIVE"
         N1ME0584 = "INTERNAL ROTATION--PASSIVE"
         N1ME0585 = "MUSCLE WASTINGS (GLUTEAL)"
         N1ME0586 = "TROCHANTER TENDERNESS"
         N1ME0587 = "GROIN TENDERNESS"
         N1ME0588 = "OTHER "
         N1ME0589 = "JOINTS"
         N1ME0590 = "TENDER"
         N1ME0591 = "SWELLING"
         N1ME0592 = "DEFORMITY"
         N1ME0593 = "LIMITATION"
         N1ME0594 = "PAIN ON MOTION"
         N1ME0595 = "OTHER"
         N1ME0596 = "TENDER"
         N1ME0597 = "SWELLING"
         N1ME0598 = "DEFORMITY"
         N1ME0599 = "LIMITATION"
         N1ME0600 = "PAIN ON MOTION"
         N1ME0601 = "OTHER"
         N1ME0602 = "TENDER"
         N1ME0603 = "SWELLING"
         N1ME0604 = "DEFORMITY"
         N1ME0605 = "LIMITATION"
         N1ME0606 = "PAIN ON MOTION"
         N1ME0607 = "OTHER"
         N1ME0608 = "TENDER--RIGHT"
         N1ME0609 = "TENDER--LEFT"
         N1ME0610 = "SWELLING--RIGHT"
         N1ME0611 = "SWELLING--LEFT"
         N1ME0612 = "DEFORMITY--RIGHT"
         N1ME0613 = "DEFORMITY--LEFT"
         N1ME0614 = "LIMITATION--RIGHT"
         N1ME0615 = "LIMITATION-LEFT"
         N1ME0616 = "PAIN ON MOTION--RIGHT"
         N1ME0617 = "PAIN ON MOTION--LEFT"
         N1ME0618 = "OTHER--RIGHT"
         N1ME0619 = "OTHER--LEFT"
         N1ME0620 = "TENDER--RIGHT"
         N1ME0621 = "TENDER--LEFT"
         N1ME0622 = "SWELLING--RIGHT"
         N1ME0623 = "SWELLING--LEFT"
         N1ME0624 = "DEFORMITY--RIGHT"
         N1ME0625 = "DEFORMITY--LEFT"
         N1ME0626 = "LIMITATION--RIGHT"
         N1ME0627 = "LIMITATION--LEFT"
         N1ME0628 = "PAIN ON MOTION--RIGHT"
         N1ME0629 = "PAIN ON MOTION--LEFT"
         N1ME0630 = "OTHER--RIGHT"
         N1ME0631 = "OTHER--LEFT"
         N1ME0632 = "TENDER--RIGHT"
         N1ME0633 = "TENDER--LEFT"
         N1ME0634 = "SWELLING--RIGHT"
         N1ME0635 = "SWELLING--LEFT"
         N1ME0636 = "DEFORMITY--RIGHT"
         N1ME0637 = "DEFORMITY--LEFT"
         N1ME0638 = "LIMITATION--RIGHT"
         N1ME0639 = "LIMITATION--LEFT"
         N1ME0640 = "HERBERDEN'S NODES--RIGHT"
         N1ME0641 = "HERBERDEN'S NODES--LEFT"
         N1ME0642 = "PAIN ON MOTION--RIGHT"
         N1ME0643 = "PAIN ON MOTION--LEFT"
         N1ME0644 = "OTHER--RIGHT"
         N1ME0645 = "OTHER--LEFT"
         N1ME0646 = "OTHER JOINTS ANKLE- TENDER"
         N1ME0647 = "SWELLING"
         N1ME0648 = "DEFORMITY"
         N1ME0649 = "LIMITATION"
         N1ME0650 = "PAIN IN MOTION"
         N1ME0651 = "OTHER"
         N1ME0652 = "FEET-TENDER"
         N1ME0653 = "SWELLING"
         N1ME0654 = "DEFORMITY"
         N1ME0655 = "LIMITATION"
         N1ME0656 = "PAIN IN MOTION"
         N1ME0657 = "OTHER"
         N1ME0658 = "BACK"
         N1ME0659 = "SCOLIOSIS"
         N1ME0660 = "KYPHOSIS"
         N1ME0661 = "LORDOSIS"
         N1ME0662 = "SCIATIC NOTCH"
         N1ME0663 = "SACROILIC"
         N1ME0664 = "OTHER"
         N1ME0665 = "CERVICAL SPINE"
         N1ME0666 = "THORACIC SPINE"
         N1ME0667 = "LUMBAR SPINE FLEXION"
         N1ME0668 = "LUMBAR SPINE--RIGHT LATERAL FLEXION"
         N1ME0669 = "LUMBAR SPINE--LEFT LATERAL FLEXION"
         N1ME0670 = "FULL EXTENSION"
         N1ME0671 = "PAIN ON MOTION"
         N1ME0672 = "CERVICAL "
         N1ME0673 = "THORACIC   "
         N1ME0674 = "LOW BACK"
         N1ME0675 = "DIFFUSE"
         N1ME0676 = "UNCERTAIN"
         N1ME0677 = "CERVICAL"
         N1ME0678 = "THORACIC"
         N1ME0679 = "LOW BACK"
         N1ME0680 = "DIFFUSE"
         N1ME0681 = "UNCERTAIN"
         N1ME0682 = "RIGHT LATERAL BENDING-CERVICAL"
         N1ME0683 = "THORACIC"
         N1ME0684 = "LOW BACK"
         N1ME0685 = "DIFFUSE"
         N1ME0686 = "UNCERTAIN"
         N1ME0687 = "LEFT LATERAL BENDING-CERVICAL"
         N1ME0688 = "THORACIC"
         N1ME0689 = "LOW BACK"
         N1ME0690 = "DIFFUSE"
         N1ME0691 = "UNCERTAIN"
         N1ME0692 = "RIGHT ROTATION-CERVICAL"
         N1ME0693 = "THORACIC"
         N1ME0694 = "LOW BACK"
         N1ME0695 = "DIFFUSE"
         N1ME0696 = "UNCERTAIN"
         N1ME0697 = "LEFT ROTATION-CERVICAL"
         N1ME0698 = "THORACIC"
         N1ME0699 = "LOW BACK"
         N1ME0700 = "DIFFUSE"
         N1ME0701 = "UNCERTAIN"
         N1ME0702 = "STRAIGHT-LEG RASING TEST- RIGHT LEG"
         N1ME0703 = "INCREASE ON ANKLE (RIGHT LEG)"
         N1ME0704 = "LEFT LEG"
         N1ME0705 = "INCEREASE DORSIFLEXION (LEFT LEG)"
         N1ME0706 = "OTHER SYSTEMS"
         N1ME0707 = "BLOOD PRESSURE"
         N1ME0711 = "AM OR PM"
         N1ME0712 = "RECUMBENT--SYSTOLIC"
         N1ME0715 = "RECUMBENT--DIASTOLIC"
         N1ME0718 = "SITTING--SYSTOLIC"
         N1ME0721 = "SITTING--DIASTOLIC"
         N1ME0724 = "SUMMARY OF DIAGNOSTIC IMPRESSION"
         N1ME0725 = "ICD CODES-SEVERITY"
         N1ME0726 = "CERTAINTY"
         N1ME0727 = "ICD CODE  "
         N1ME0730 = "SEVERITY"
         N1ME0731 = "CERTAINTY"
         N1ME0732 = "ICD CODE"
         N1ME0735 = "SEVERITY"
         N1ME0736 = "CERTAINTY"
         N1ME0737 = "ICD CODE"
         N1ME0740 = "SEVERITY"
         N1ME0741 = "CERTAINTY"
         N1ME0742 = "ICD CODE"
         N1ME0745 = "SEVERITY"
         N1ME0746 = "CERTAINTY"
         N1ME0747 = "ICD CODE"
         N1ME0750 = "SEVERITY"
         N1ME0751 = "CERTAINTY"
         N1ME0752 = "ICD CODE"
         N1ME0755 = "SEVERITY"
         N1ME0756 = "CERTAINTY"
         N1ME0757 = "ICD CODE"
         N1ME0760 = "SEVERITY"
         N1ME0761 = "CERTAINTY"
         N1ME0762 = "ICD CODE"
         N1ME0765 = "SEVERITY"
         N1ME0766 = "CERTAINTY"
         N1ME0767 = "ICD CODE"
         N1ME0770 = "SEVERITY"
         N1ME0771 = "CERTAINTY"
         N1ME0772 = "ICD CODE"
         N1ME0775 = "SEVERITY"
         N1ME0776 = "CERTAINTY"
         N1ME0777 = "ICD CODE"
         N1ME0780 = "SEVERITY"
         N1ME0781 = "CERTAINTY"
         N1ME0782 = "ICD CODE"
         N1ME0785 = "SEVERITY"
         N1ME0786 = "CERTAINTY"
         N1ME0787 = "ICD CODE"
         N1ME0790 = "SEVERITY"
         N1ME0791 = "CERTAINTY"
         N1ME0792 = "ICD CODE"
         N1ME0795 = "SEVERITY"
         N1ME0796 = "CERTAINTY"
         N1ME0797 = "ICD CODE"
         N1ME0800 = "DATA USER WORK AREA OCULAR FUNDI"
         N1ME0825 = "NORMAL"
         N1ME0826 = "FUNDUS NOT VISUALIZED"
         N1ME0827 = "GLOBE ABSENT"
         N1ME0828 = "INCREASED LIGHT REFKLEX"
         N1ME0829 = "NARROW ARTERIOLES"
         N1ME0830 = "TORTUOUS ARTERIOLES"
         N1ME0831 = "AV COMPRESSION"
         N1ME0832 = "HEMMORHAGE"
         N1ME0833 = "EXUDATE"
         N1ME0834 = "VENOUS ENGORGEMENT"
         N1ME0835 = "PAPILLEDMA"
         N1ME0836 = "DISC ABNORMAL"
         N1ME0837 = "LENS OPACITIES"
         N1ME0838 = "IRITIS"
         N1ME0839 = "OTHER"
         N1ME0840 = "DATA USER WORK AREA"
      ;
RUN;
