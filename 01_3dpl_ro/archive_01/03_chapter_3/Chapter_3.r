source("~/Documents/Science/3dPlaning_RadiusOsteotomy/00_preprocessing_data/05_script.R")

escribir("3.1 Результаты ретроспективной группы в целом")
descResutsCh3("3.1.1",dfRadRetro,"во всей выборке")


escribir("3.2 Результаты в подгруппах по признаку повреждения доминирующей руки")

descResutsCh3("3.2.1",dfRadRetroDdomH_Y,"в подгруппе повреждения доминирующей руки ")
descResutsCh3("3.2.2",dfRadRetroDdomH_N,"в подгруппе повреждения недоминирующей руки ")
pvalResutsCh3(dfRadRetro,Damage_dominant_hand)


descResutsCh3_Table("3.1",dfRadRetroDdomH_Y,"в повреждения доминирующей руки ")
descResutsCh3_Table("3.2",dfRadRetroDdomH_N,"в подгруппе повреждения недоминирующей руки ")
pvalResutsCh3_Table("3.3", "во всей выборке",dfRadRetro$Damage_dominant_hand)


escribir("3.3 Результаты в подгруппах по признаку типа деформации")
descResutsCh3("3.3.1",dfRadRetroTypeDef_P,"в подгруппе ладонной деформации ")
descResutsCh3("3.3.2",dfRadRetroTypeDef_D,"в подгруппе дорсальной деформации ")
pvalResutsCh3(dfRadRetro,Type_deformation)

descResutsCh3_Table("3.4",dfRadRetroTypeDef_P,"в подгруппе ладонной деформации ")
descResutsCh3_Table("3.5",dfRadRetroTypeDef_D,"в подгруппе дорсальной деформации ")
pvalResutsCh3_Table("3.6", "во всей выборке",dfRadRetro$Type_deformation)


escribir("3.4 Результаты в подгруппах по признаку типа активности")
descResutsCh3("3.4.1",dfRadRetroTypeAct_H,"в подгруппе ручного труда ")
descResutsCh3("3.4.2",dfRadRetroTypeAct_B,"в подгруппе смешанного типа труда ")
descResutsCh3("3.4.2",dfRadRetroTypeAct_RT,"в подгруппе не работающих пенсионеров ")
pvalResutsCh3(dfRadRetro,Type_action)


descResutsCh3_Table("3.7",dfRadRetroTypeAct_H,"в подгруппе ручного труда ")
descResutsCh3_Table("3.8",dfRadRetroTypeAct_B,"в подгруппе смешанного типа труда ")
descResutsCh3_Table("3.9",dfRadRetroTypeAct_RT,"в подгруппе не работающих пенсионерои ")
pvalResutsCh3_Table("3.10", "во всей выборке",dfRadRetro$Type_action)
