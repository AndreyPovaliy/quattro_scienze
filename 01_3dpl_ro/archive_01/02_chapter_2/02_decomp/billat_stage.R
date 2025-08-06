
# 2.3.2 Биллатеральное исследование симметрии дистального метаэпиф --------


escribir(paste("### ",s2_3_2))


source("~/Documents/Science/3dPlaning_RadiusOsteotomy/archive_01/02_chapter_2/02_subsetting/num_data_2.R")
source("~/Documents/Science/3dPlaning_RadiusOsteotomy/archive_01/02_chapter_2/02_subsetting/cat_data_2.R")

escribir("*Описание всей ретроспективной выборки*")
numer_descr_2_billat(dfRadBillat_num_before, "пациентов во всей выборке ")
category_descr_2_billat(dfRadBillat_cat_before, "пациентов во всей выборке ")

escribir("*Описание подгруппы пациентов ручного типа труда*")
numer_descr_2_billat(dfRadBillat_H_num_before, "пациентов во всей выборке ")
category_descr_2_billat(dfRadBillat_H_cat_before, "пациентов во всей выборке ")

escribir("*Описание подгруппы пациентов смешанного типа труда*")
numer_descr_2_billat(dfRadBillat_B_num_before, "пациентов во всей выборке ")
category_descr_2_billat(dfRadBillat_B_cat_before, "пациентов во всей выборке ")