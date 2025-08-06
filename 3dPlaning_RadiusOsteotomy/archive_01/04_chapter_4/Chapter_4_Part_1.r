#####library#####
#подключаем библитеку для чтения exel
library(openxlsx)
#подключаем библитеку для работы со статистическими данными
library(psych)
#подключаем библитеку для работы с ggplot2
library(ggplot2)




####Глава 4####
escribir("ГЛАВА №4.")
escribir("4.1 Биллатеральное исследование симметрии дистального метаэпифиза у лиц без травмы в анамнезе")

descResutsCh4a("4.1.1 ",dfRadBillat,"во всей выборке")
escribir(" Результаты по сторонам")
descResutsCh4a("4.1.2 ",dfRadBillatLeft,"по левой стороне")
descResutsCh4a("4.1.3 ",dfRadBillatRight,"по правой стороне")
escribir("Разница по сторонам")
pvalResutsCh4a(dfRadBillat,dfRadBillat$Side)

descResutsCh4a_Table("4.1",dfRadBillatLeft,"по левой стороне")
descResutsCh4a_Table("4.1",dfRadBillatRight,"по правой стороне")
pvalResutsCh4a_Table("4.1", "во всей выборке",dfRadBillat$Side)

escribir("Результаты подгруппы смешанного типа труда стороны")
descResutsCh4("4.1.2 ",dfRadBillat_B_Left,"по левой стороне")
descResutsCh4("4.1.3 ",dfRadBillat_B_Right,"по правой стороне")
escribir("Разница по сторонам")
pvalResutsCh4(dfRadBillat_B,dfRadBillat_B$Side)



escribir("Результаты подгруппы ручного типа труда стороны")
descResutsCh4("4.1.2 ",dfRadBillat_H_Left,"по левой стороне")
descResutsCh4("4.1.3 ",dfRadBillat_H_Right,"по правой стороне")
escribir("Разница по сторонам")
pvalResutsCh4(dfRadBillat_H,dfRadBillat_H$Side)




escribir("4.1.4 Обсуждение полученного результата")

