library(ggplot2)
library(openxlsx)
#####FUNCTIONS####

# createSubTable(dfSr1, "dataOutput/dfSr1_subtable1.xlsx")
createSubTable <- function(df, name){
  classType <- c()
  for(i in 1:ncol(df)){
    classType <- c(classType,class(df[,i]))
  }
  df1 <-  data.frame(
    vec = colnames(df),
    type = classType, 
    dataTrans= c(0),
    dataMeasure = c(0))
  write.xlsx(df1, name)
  
}














#####COMB FUNCTIONS####







chapter_2_text <- function(parametr,  vector1, vector2, database,vector, sep){
  escribir (parametr)
  Quantity_discr(levels(database[[sep]])[1],vector1)
  Quantity_discr(levels(database[[sep]])[2],vector2)
  Quantity_table(parametr,database,vector,sep)
  
}









chapter_5_text <- function(text, 
                           in_group1, in_group2,  in_group3,
                           vector1, vector2, vector3,
                           vectorSum, separation){
  escribir (text)
  Quantity_discr(in_group1,vector1)
  Quantity_discr(in_group2,vector2)
  Quantity_discr(in_group3,vector3)
  Quantity_table_3(text,vector1,vector2,vector3)
  pvalueQualitativeText(vectorSum,separation,text)
  
}


article_text <- function(text, in_group1, in_group2, vector1, vector2, vectorSum, separation){
  escribir (text)
  Quantity_discr_short(in_group1,vector1)
  Quantity_discr_short(in_group2,vector2)
  
  Quantity_table(text,vector1,vector2)
  pvalueQualitativeText(vectorSum,separation,text)
}

# SSA_text(dfXlsxJun$us_is_tumor,dfXlsxJun$hist_is_tumor, "УЗИ в группе А")
SSA_text <- function(predicted_value, expected_value, method){
  x <- SSA(predicted_value, expected_value)
  Descr<-print(paste("При оценке ", method," количество истинно верно определенных образований как доброкачественные было ",x[["table"]][4], 
                     ",  количество верно определённых образований как злокачественные было", x[["table"]][1],
                     ", количество неверно определенных образований как злокачественные было ", x[["table"]][3],
                     " и количество неопределенных злокачественных образований как доброкачественные было ",x[["table"]][2], ".",
                     "Точность метода составила", round(x[["overall"]][["Accuracy"]],2),
                     "[95% ДИ:",round(x[["overall"]][["AccuracyLower"]],2),",",round(x[["overall"]][["AccuracyUpper"]],2) ,"].",
                     "P-Value модели составил",round(x[["overall"]][["AccuracyPValue"]],2), 
                     "что означает, что модель отличается от точности нулевой гипотезы.",
                     "Коэфициент Kappa составил", round(x[["overall"]][["Kappa"]],2),
                     " показывает (если стремится к 1), что метод указывает на высокое согласие между предсказаниями и истинными значениями",
                     "(количество  истинно положительных и отрицательных результатов).",
                     "Тест Макнемара составил", round(x[["overall"]][["McnemarPValue"]],2),
                     " показывает, что метод не имеет существенно отличную от контрольного метода частоту ошибок",
                     "(количество ложноположительных и ложноотрицательных результатов).",
                     "Чувствительность метода составила", round(x[["byClass"]][["Sensitivity"]],2),
                     ". Специфичность метода составила", round(x[["byClass"]][["Specificity"]],2),
                     ". Доля положительных прогнозов составила", round(x[["byClass"]][["Pos Pred Value"]],2),
                     ". Доля отрицательных прогнозов составила", round(x[["byClass"]][["Neg Pred Value"]],2),
                     ". Доля истинно положительных случаев в наборе данных составила", round(x[["byClass"]][["Prevalence"]],2),
                     ". Доля истинно положительных случаев, правильно определённых методом составила", round(x[["byClass"]][["Detection Rate"]],2),
                     ". Отбалансированная точность метода составила", round(x[["byClass"]][["Balanced Accuracy"]],2),"

                        (Т -Точность, P - P-Value, КК - Коэффициент Kappa, ТМ -Тест Макнемара, ППЦ - положительная прогностическая ценность, ОПЦ - отрицательная прогностическая ценность,  Ч-Чувствительность, Сп -Специфичность, ОТ- Отбалансированная точность)
                        | Метод | Т       |P       | КК | ТМ  |  ППЦ  | ОПЦ |  Ч  | Сп | ОТ|
                        |",method ,"|"
                     , round(x[["overall"]][["Accuracy"]],2),
                     "[95% ДИ:",round(x[["overall"]][["AccuracyLower"]],2),","
                     ,round(x[["overall"]][["AccuracyUpper"]],2) ,"].","|"
                     ,round(x[["overall"]][["AccuracyPValue"]],2),"|"
                     ,round(x[["overall"]][["Kappa"]],2),"|"
                     ,round(x[["overall"]][["McnemarPValue"]],2),"|"
                     ,round(x[["byClass"]][["Pos Pred Value"]],2),"|"
                     ,round(x[["byClass"]][["Neg Pred Value"]],2),"|"
                     ,round(x[["byClass"]][["Sensitivity"]],2),"|"
                     ,round(x[["byClass"]][["Specificity"]],2),"|"
                     ,round(x[["byClass"]][["Balanced Accuracy"]],2),"|"
                     
                     
  ))
  
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
  
}


# SSA_textClac(dfXlsxJun$us_is_tumor,dfXlsxJun$hist_is_tumor, "УЗИ в группе А")
SSA_textClac <- function(predicted_value, expected_value, method){
  x <- SSA(predicted_value, expected_value)
  Descr<-print(paste("При оценке ", method," количество истинно верно определенных образований как отсутствие кальцината было ",x[["table"]][4], 
                     ",  количество верно определённых образований как наличие кальцината было", x[["table"]][1],
                     ", количество неверно определенных кальцинатов как отсутствие кальцината было ", x[["table"]][2],
                     " и количество определенных истинно отсутствовавших кальциантов как найденное было ",x[["table"]][3], ".",
                     "Точность метода составила", round(x[["overall"]][["Accuracy"]],2),
                     "[95% ДИ:",round(x[["overall"]][["AccuracyLower"]],2),",",round(x[["overall"]][["AccuracyUpper"]],2) ,"].",
                     "P-Value модели составил",round(x[["overall"]][["AccuracyPValue"]],2), 
                     "что означает, что модель отличается от точности нулевой гипотезы.",
                     "Коэфициент Kappa составил", round(x[["overall"]][["Kappa"]],2),
                     " показывает, что метод не имеет существенно отличную от контрольного метода частоту верно определенных результатов",
                     "(количество  истинно положительных и отрицательных результатов).",
                     "Тест Макнемара составил", round(x[["overall"]][["McnemarPValue"]],2),
                     " показывает, что метод не имеет существенно отличную от контрольного метода частоту ошибок",
                     "(количество ложноположительных и ложноотрицательных результатов).",
                     "Чувствительность метода составила", round(x[["byClass"]][["Sensitivity"]],2),
                     ". Специфичность метода составила", round(x[["byClass"]][["Specificity"]],2),
                     ". Доля положительных прогнозов составила", round(x[["byClass"]][["Pos Pred Value"]],2),
                     ". Доля отрицательных прогнозов составила", round(x[["byClass"]][["Neg Pred Value"]],2),
                     ". Доля истинно положительных случаев в наборе данных составила", round(x[["byClass"]][["Prevalence"]],2),
                     ". Доля истинно положительных случаев, правильно определённых методом составила", round(x[["byClass"]][["Detection Rate"]],2),
                     ". Отбалансированная точность метода составила", round(x[["byClass"]][["Balanced Accuracy"]],2),"

                        (Т -Точность, P - P-Value, КК - Коэффициент Kappa, ТМ -Тест Макнемара, Ч-Чувствительность, Сп -Специфичность, ППЦ - положительная прогностическая ценность, ОПЦ - отрицательная прогностическая ценность, ОТ- Отбалансированная точность)
                        | Метод | Т       |P       | КК | ТМ  |  Ч  | Сп | ППЦ | ОПЦ | ОТ |
                        |------------|------------|------------|------------|------------|------------|------------|------------|------------|------------|
                        |",method ,"|"
                     , round(x[["overall"]][["Accuracy"]],2),
                     "[95% ДИ:",round(x[["overall"]][["AccuracyLower"]],2),",",round(x[["overall"]][["AccuracyUpper"]],2) ,"].","|"
                     ,round(x[["overall"]][["AccuracyPValue"]],2),"|"
                     ,round(x[["overall"]][["Kappa"]],2),"|"
                     ,round(x[["overall"]][["McnemarPValue"]],2),"|"
                     ,round(x[["byClass"]][["Sensitivity"]],2),"|"
                     ,round(x[["byClass"]][["Specificity"]],2),"|"
                     ,round(x[["byClass"]][["Pos Pred Value"]],2),"|"
                     ,round(x[["byClass"]][["Neg Pred Value"]],2),"|"
                     ,round(x[["byClass"]][["Balanced Accuracy"]],2),"|"
                     
                     
  ))
  
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
  
}


