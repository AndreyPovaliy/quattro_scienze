library(tidyverse)

inputData <- read.csv(file = "/Users/andreypovaliy/OneDrive/Текущая работа/Наука/06. KLIM/Статьи/Дексаметазон/Пациенты вошедшие/Рассмотрение.csv",sep = ',')


inputData$дата <- factor(inputData$дата,
                         levels = c(2,3,4,5),
                         labels = c(
                           "2"="февраль",
                           "3"="март",
                           "4"="апрель",
                           "5"="май"
                           
                         )
)


inputData$отказ<- factor(inputData$отказ,
                         levels = c(1,0),
                         labels = c(
                           
                           "1"="отказ",
                           "0"="согласен"
                           
                         )
)


stringSubTitle <- paste("февраль -", 
                        table(inputData$дата)[1],
                              "(",
                              table(inputData$дата[inputData$отказ=="отказ"])[1],
                              ")",
                              ",   март - ",
                              table(inputData$дата)[2],
                                    "(",
                                    table(inputData$дата[inputData$отказ=="отказ"])[2],
                                    ")", 
                              "апрель - ",
                              table(inputData$дата)[3],
                                    "(",
                                    table(inputData$дата[inputData$отказ=="отказ"])[3],
                              ") ,    май - ",
                              table(inputData$дата)[4],
                                    "(",
                                    table(inputData$дата[inputData$отказ=="отказ"])[4],
                        ")"
                              
                              )

ggplot(data = inputData,
       mapping = aes(x=дата,
                     fill= отказ)
       )+
  geom_bar(position=position_dodge())+
  labs(
    title = "Количество пацинтов, которым предложено участвовать",
    subtitle = stringSubTitle,
    x="Месяц",
    y = " Количество",
    fill = "Согласие"
  )




