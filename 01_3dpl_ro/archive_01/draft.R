source("~/Documents/Science/3dPlaning_RadiusOsteotomy/00_preprocessing_data/05_script.R")
source("~/Documents/Science/3dPlaning_RadiusOsteotomy/00_preprocessing_data/06_dict.R")





#описали полученные цифры
Describe_numericText (dfRadRetro[[4]], colnames(dfRadRetro)[4] ," пациентов, вошедших в исследование, составил "," лет")
Describe_numericText (dfRadRetro[[5]], colnames(dfRadRetro)[5] ," пациентов, вошедших в исследование, составил "," лет")
Describe_numericText (dfRadRetro[[6]], colnames(dfRadRetro)[6] ," пациентов, вошедших в исследование, составил "," м/кг2")
Describe_numericText (dfRadRetro[[12]], colnames(dfRadRetro)[12] ," пациентов, вошедших в исследование, составил "," гадусов")
Describe_numericText (dfRadRetro[[14]], colnames(dfRadRetro)[14] ," пациентов, вошедших в исследование, составил "," гадусов")
Describe_numericText (dfRadRetro[[16]], colnames(dfRadRetro)[16] ," пациентов, вошедших в исследование, составил "," гадусов")
Describe_numericText (dfRadRetro[[18]], colnames(dfRadRetro)[18] ," пациентов, вошедших в исследование, составил "," гадусов")
Describe_numericText (dfRadRetro[[20]], colnames(dfRadRetro)[20] ," пациентов, вошедших в исследование, составил "," гадусов")
Describe_numericText (dfRadRetro[[22]], colnames(dfRadRetro)[22] ," пациентов, вошедших в исследование, составил "," гадусов")

#внесли в таблицу
Table_numeric2(colnames(dfRadRetro)[4], dfRadRetro[[4]])

Quantity_discr(colnames(dfRadRetro)[7],dfRadRetro[[7]])

# 1) в exel data_type нужно заполнить для каждого этапа данные
# 2) написать словарик для каждого этапа и вынести в отдельный файл
# 2) дописать описательную часть, зачем сравнительную и таблицу
# 3) создать функцию которая будет работь с сабсетами
# 4) заполнить строки для глав с примерной разметкой как должно будет выглядеть (текст + таблица)
# 5) для значимых позиций создать графики
