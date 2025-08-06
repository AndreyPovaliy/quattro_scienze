# 2.3.1 Ретроспективная оценка результатов остетомии ЛК при неправ --------
escribir(paste("### ",s2_3_1))


source("~/Documents/Science/3dPlaning_RadiusOsteotomy/archive_01/02_chapter_2/02_subsetting/num_data_2.R")
source("~/Documents/Science/3dPlaning_RadiusOsteotomy/archive_01/02_chapter_2/02_subsetting/cat_data_2.R")

escribir("*Описание всей ретроспективной выборки*")
numer_descr_2_retro(dfRadRetro_num_before, "пациентов во всей ретроспективной выборке ")
category_descr_2_retro(dfRadRetro_cat_before, "пациентов во всей ретроспективной выборке ")

escribir("*Описание подгруппы пациентов с повреждением доминирующей руки*")
numer_descr_2_retro(dfRadRetroDdomH_Y_num_before, "подгруппы пациентов с повреждением доминирующей руки ")
category_descr_2_retro(dfRadRetroDdomH_Y_cat_before, "подгруппы пациентов с повреждением доминирующей руки ")

escribir("*Описание подгруппы пациентов с повреждением недоминирующей руки*")
numer_descr_2_retro(dfRadRetroDdomH_N_num_before, "подгруппы пациентов с повреждением недоминирующей руки ")
category_descr_2_retro(dfRadRetroDdomH_N_cat_before, "подгруппы пациентов с повреждением недоминирующей руки ")

escribir("*Описание подгруппы пациентов ладонной деформации*")
numer_descr_2_retro(dfRadRetroTypeDef_P_num_before, "подгруппы пациентов ладонной деформации ")
category_descr_2_retro(dfRadRetroTypeDef_P_cat_before, "подгруппы пациентов ладонной деформации ")

escribir("*Описание подгруппы пациентов дорсальной деформации*")
numer_descr_2_retro(dfRadRetroTypeDef_D_num_before, "подгруппы пациентов дорсальной деформации ")
category_descr_2_retro(dfRadRetroTypeDef_D_cat_before, "подгруппы пациентов дорсальной деформации ")

escribir("*Описание подгруппы пациентов ручного типа труда*")
numer_descr_2_retro(dfRadRetroTypeAct_H_num_before, "подгруппы пациентов ручного типа труда ")
category_descr_2_retro(dfRadRetroTypeAct_H_cat_before, "подгруппы пациентов ручного типа труда ")

escribir("*Описание подгруппы пациентов смешанного типа труда*")
numer_descr_2_retro(dfRadRetroTypeAct_B_num_before, "подгруппы пациентов смешанного типа труда ")
category_descr_2_retro(dfRadRetroTypeAct_B_cat_before, "подгруппы пациентов смешанного типа труда ")

escribir("*Описание подгруппы пациентов пенсионного возраста *")
numer_descr_2_retro(dfRadRetroTypeAct_RT_num_before, "подгруппы пациентов пенсионного возраста ")
category_descr_2_retro(dfRadRetroTypeAct_RT_cat_before, "подгруппы пациентов пенсионного возраста ")









