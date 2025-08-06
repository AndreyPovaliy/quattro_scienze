
# 2.3.4 Клиническое исследование эффективности применения протокол --------

escribir(paste("### ",s2_3_4))

source("~/Documents/Science/3dPlaning_RadiusOsteotomy/archive_01/02_chapter_2/02_subsetting/num_data_2.R")
source("~/Documents/Science/3dPlaning_RadiusOsteotomy/archive_01/02_chapter_2/02_subsetting/cat_data_2.R")

escribir("*Описание всей выборки*")
numer_descr_2_prosp(dfRad_num_before, "пациентов во всей выборке ")
category_descr_2_prosp(dfRad_cat_before, "пациентов во всей выборке ")


escribir("*Описание по группам")
numer_descr_2_prosp_twoGr(Gr1_num_before,Gr2_num_before, " пациентов в группе А ", " пациентов в группе Б ", dfRad_num_before)
category_descr_2_prosp_twoGr(Gr1_cat_before,Gr2_cat_before," пациентов в группе А ", " пациентов в группе Б ",dfRad_cat_before)



