#####library####
#подключаем библитеку для чтения exel
library(openxlsx)
#подключаем библитеку для работы со статистическими данными
library(psych)
#подключаем библитеку для работы с ggplot2
library(ggplot2)




#####SAMPLES####


######1#####
dfRadRetro<- read.xlsx(xlsxFile = WayData, sheet = '1')

######2a#####
dfRadBillat<- read.xlsx(xlsxFile = WayData, sheet = '2a')


######2b#####
dfRadProt<- read.xlsx(xlsxFile = WayData, sheet = '2b')


######3#####
dfRad<- read.xlsx(xlsxFile = WayData, sheet = '3')






