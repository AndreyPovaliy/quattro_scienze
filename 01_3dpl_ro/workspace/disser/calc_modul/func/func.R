library(ggplot2)
#####FUNCTIONS####

#########
# функция создает отдельный data frame с наименованием переменной и ее размерность
# входным параметром нужен только 1 data frame
# ПРИМЕР: createSubTable(df)
#########
createSubTable <- function(df){
  df1 <-  data.frame(vec = colnames(df),dataTrans= c(0),dataMeasure = c(0))
  for (i in 1:length(df1$vec)) {
    df1$dataTrans[i] <- readline(prompt = paste("Введите имя переменной:",df1$vec[i],": "))
    df1$dataMeasure[i] <- readline(prompt = paste("Введите размерность:",df1$vec[i],": "))
  }
  return(df1)
}


#приемер: escribir ("Запись1")
escribir <- function(a) {
  
  Descr <- print(a)
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
  
}

#escribir_rT("~/Documents/Science/ABUS_US_diagnostics/Text_work/Articles/Calc_abus_accur/decomp/txt/Материалы.txt")
escribir_rT <- function (way_to_text){
  rT <- read.table(way_to_text,sep = "_")
  for (i in 1:nrow(rT)) {
    if (substring(rT$V1[i],length(rT$V1[i])-1,length(rT$V1[i]))=="|") {
      escribir(paste(rT$V1[i]))
    } else {
      escribir(paste(rT$V1[i],
                     "\n\n"))
    }
    
  }
}


# приемер:Describe_numeric_Norm (df_Pillow$age, "возраст ","пациентов по всей выборке составил "," лет")
Describe_numeric_Norm<-function(database,parametr,sample1,mesurement)
{
  mean1<-round(mean(database, na.rm = TRUE),2)
  sd1<-round(sd(database, na.rm = TRUE),2)
  Descr<-print(paste("Средний ", parametr ,sample1,mean1 ,"±",sd1, mesurement,".", sep=""))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}


# приемер:Describe_numeric_NoNorm (df_Pillow$age, "возраст","пациентов по всей выборке составил "," лет")
Describe_numeric_NoNorm<-function(database,parametr,sample1,mesurement)
{
  median1<-round(median(database, na.rm = TRUE),2)
  quan1<-summary(database, na.rm = TRUE)
  Descr<-print(paste("Медиана ", parametr ,sample1,median1 ," [Q1-Q3: ",round(quan1[2],2),";",round(quan1[5],2),"]", mesurement,".", sep=""))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}


# Table_numeric_Normal("возраст",df1$age, df1$dominant_hand)
Table_numeric_Normal<-function(parametr,database,dev)
{
  df1 <- subset(database, dev == levels(dev)[1])
  mean1<-round(mean(df1, na.rm = TRUE),2)
  sd1<-round(sd(df1, na.rm = TRUE),2)
  # subset(output, output[,list1[["compairMain"]][compairMain]] == levels(df_subset2[,list1[["compairMain"]][compairMain]])[2]
  df2 <- subset(database, dev == levels(dev)[2])
  mean2<-round(mean(df2, na.rm = TRUE),2)
  sd2<-round(sd(df2, na.rm = TRUE),2)
  p_value <- round(as.numeric(t.test(database ~ dev)[3]),2)
  Descr<-print(paste("|",parametr,"|",mean1 ,"±",sd1,"|",mean2 ,"±",sd2,"|",p_value,"|"))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}





# приемер:Table_numeric_NoNormal("возраст",df1$age, df1$dominant_hand)
Table_numeric_NoNormal<-function(parametr,database,dev )
{
  df1 <- subset(database, dev == levels(dev)[1])
  median1<-round(median(df1, na.rm = TRUE),2)
  quan1<-summary(df1, na.rm = TRUE)
  
  df2 <- subset(database, dev == levels(dev)[2])
  median2<-round(median(df2, na.rm = TRUE),2)
  quan2<-summary(df2, na.rm = TRUE)
  
  p_value <- round(as.numeric(wilcox.test(database ~ dev)[3]),2)
  Descr<-print(paste("|",parametr,"|",
                     median1 ,"[ Q1-Q3:",round(quan1[2],2),";",round(quan1[5],2),"]","|",
                     median2 ,"[ Q1-Q3:",round(quan2[2],2),";",round(quan2[5],2),"]","|",
                     p_value,"|"))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}



# приемер: Table_numericANOV ("возраст",df_Pillow$age, df_Pillow$group)
Table_numericANOV<-function(parametr,database,dev )
{
  mean1<-round(mean(database, na.rm = TRUE),2)
  sd1<-round(sd(database, na.rm = TRUE),2)
  p_value <- round(as.numeric(summary(aov(database ~ dev))[[1]][["Pr(>F)"]][1],2))
  Descr<-print(paste(parametr,"*",mean1 ,"±",sd1,"*", p_value))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}

# приемер:Table_numericKr("возраст",df_Pillow$age, df_Pillow$group)
Table_numericKr<-function(parametr,database,dev )
{
  median1<-round(median(database, na.rm = TRUE),2)
  quan1<-summary(database, na.rm = TRUE)
  p_value <- round(as.numeric(kruskal.test(database ~ dev)[3]),2)
  Descr<-print(paste(parametr,"*",median1 ,"[ Q1-Q3:",round(quan1[2],2),";",round(quan1[5],2),"]","*", p_value))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}


# Quantity_discr_short("Девиация была ",df_Pillow$deviation)
Quantity_discr_short<-function(parametr,database){
  Descr <- parametr
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
  n <- length(data.frame(table(database), row.names = TRUE )$Freq)
  i<-0
  while (i<n){
    Descr<-print(paste(
      data.frame(table(database))[i+1,1],
      " в ",
      data.frame(round(prop.table(table(database))*100,2))[i+1,2],
      "% (", 
      data.frame(table(database))[i+1,2],
      
      ")", sep=""))
    
    i<-i+1
    a <- paste(Descr,"\n")
    cat(a, file = FileName, append = TRUE)
    
  }
}


# Quantity_discr("Тип труда ",dfRetro_CR$obesity)
Quantity_discr<-function(parametr,database){
  Descr <- parametr
  n <- length(data.frame(table(database), row.names = TRUE )$Freq)
  i<-0
  if(n>1){
    while (i<n-1){
      Descr1<-print(paste(
        data.frame(table(database))[i+1,1],
        " в ",
        data.frame(round(prop.table(table(database))*100,2))[i+1,2],
        "% (", 
        data.frame(table(database))[i+1,2],
        "/",length(database),
        "случаев),"
        , sep=""))
      
      
      i<-i+1
      Descr <- paste(Descr,Descr1)
      
    }
    DescrEnd<-print(paste("и ",
                          data.frame(table(database))[n,1],
                          " в ",
                          data.frame(round(prop.table(table(database))*100,2))[n,2],
                          "% (", 
                          data.frame(table(database))[n,2],
                          "/",length(database),
                          "случаев)."
                          , sep=""))
    DescrConcat <- paste("\n",Descr,DescrEnd)
  }else{
    DescrConcat <-print(paste(data.frame(table(database))[n,1],
                              " в ",
                              data.frame(round(prop.table(table(database))*100,2))[n,2],
                              "% (", 
                              data.frame(table(database))[n,2],
                              "/",length(database),
                              "случаев).\n\n"
                              , sep=""))
  }
  
  
  
  
  cat(DescrConcat, file = FileName, append = TRUE)
}


Quantity_table_3<-function(parametr,database1,database2,database3){
  
  
  n <- length(data.frame(table(database1), row.names = TRUE )$Freq)
  Descr<-print(paste(parametr,"
|Процентная доля|95% ДИ","|Процентная доля|95% ДИ |","
|------|------|------|------|------|------|------|
|Группы|Группа X|------|Группа Y|------|Группа Z|------|"))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
  i<-0
  while (i<n){
    Descr<-print(paste("|",
                       data.frame(table(database1))[i+1,1],
                       "|",
                       data.frame(round(prop.table(table(database1)),5))[i+1,2]*100,
                       "% (", 
                       data.frame(table(database1))[i+1,2],
                       "/",length(database1),
                       "случаев)|",
                       "[",
                       round(prop.test(table(database1)[i+1], length(database1))$conf.int[1],2),
                       ";",
                       round(prop.test(table(database1)[i+1], length(database1))$conf.int[2],2),
                       "]|",
                       data.frame(round(prop.table(table(database2)),5))[i+1,2]*100,
                       "% (", 
                       data.frame(table(database2))[i+1,2],
                       "/",length(database2),
                       "случаев)|",
                       "[",
                       round(prop.test(table(database2)[i+1], length(database2))$conf.int[1],2),
                       ";",
                       round(prop.test(table(database2)[i+1], length(database2))$conf.int[2],2),
                       "]|",
                       data.frame(round(prop.table(table(database3)),5))[i+1,2]*100,
                       "% (", 
                       data.frame(table(database3))[i+1,2],
                       "/",length(database3),
                       "случаев)|",
                       "[",
                       round(prop.test(table(database3)[i+1], length(database3))$conf.int[1],2),
                       ";",
                       round(prop.test(table(database3)[i+1], length(database3))$conf.int[2],2),
                       "]|"
                       
    ))
    a <- paste(Descr,"\n")
    cat(a, file = FileName, append = TRUE)
    i<-i+1
    
  }
}

#Quantity_table("Девиация",df_Pillow,"deviation","group")
Quantity_table<-function(parametr,database,vector,sep){
  lev1 <- levels(database[[sep]])[1]
  lev2 <- levels(database[[sep]])[2]
  database1 <- subset(database,database[[sep]]==lev1)
  database2 <- subset(database,database[[sep]]==lev2)
  Quantity_table_2(parametr,database1[[vector]],database2[[vector]],lev1,lev2)
}




#Quantity_table_2("Диагноз",dfXlsxGr1$diagnosis_primary,dfXlsxGr3$diagnosis_primary)
Quantity_table_2<-function(parametr,database1,database2,lev1,lev2){
  
  
  n <- length(data.frame(table(database1), row.names = TRUE )$Freq)
  Descr<-print(paste("

|",parametr,"|Процентная доля|95% ДИ","|Процентная доля|95% ДИ |","
|------|------|------|------|------|
|Группы|",lev1,"|------|",lev2,"|------|"))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
  i<-0
  while (i<n){
    Descr<-print(paste("|",
                       data.frame(table(database1))[i+1,1],
                       "|",
                       data.frame(round(prop.table(table(database1)),3))[i+1,2]*100,
                       "% (", 
                       data.frame(table(database1))[i+1,2],
                       "/",length(database1),
                       "случаев)|",
                       "[",
                       round(prop.test(table(database1)[i+1], length(database1))$conf.int[1],2),
                       ";",
                       round(prop.test(table(database1)[i+1], length(database1))$conf.int[2],2),
                       "]|",
                       data.frame(round(prop.table(table(database2)),3))[i+1,2]*100,
                       "% (", 
                       data.frame(table(database2))[i+1,2],
                       "/",length(database2),
                       "случаев)|",
                       "[",
                       round(prop.test(table(database2)[i+1], length(database2))$conf.int[1],2),
                       ";",
                       round(prop.test(table(database2)[i+1], length(database2))$conf.int[2],2),
                       "]|"
                       
    ))
    a <- paste(Descr,"\n")
    cat(a, file = FileName, append = TRUE)
    i<-i+1
    
  }
}



#pvalue сравнения качественных данных
#приемер: pvalueQualitativeText(df_Pillow$gender,df_Pillow$group,"по стороне поражения")
pvalueQualitativeText <-  function(x,y,parametr1){
  if(
    min(table(x)>5)
    
  )
  {
    S_Table <-chisq.test(table(x,y), simulate.p.value = TRUE)$p.value
    if (S_Table<0.05) {
      S_Table <- round(as.numeric(S_Table),2)
      Descr<-print(paste("Разница между группами  по показателю", parametr1," составила",S_Table, "."))
      a <- paste(Descr,"\n")
      cat(a, file = FileName, append = TRUE) 
      
    }else{
      S_Table <- round(as.numeric(S_Table),2)
      Descr<-print(paste("Разницы между группами по показателю", parametr1,"не было найдено (p-уровень=",S_Table,")."))
      a <- paste(Descr,"\n")
      cat(a, file = FileName, append = TRUE)
    }
    
  }
  else{
    S_Table <-fisher.test(table(x,y), simulate.p.value = TRUE)$p.value
    if (S_Table<0.05) {
      S_Table <- round(as.numeric(S_Table),2)
      Descr<-print(paste("Разница между группами", parametr1," составила",S_Table, "."))
      a <- paste(Descr,"\n")
      cat(a, file = FileName, append = TRUE) 
      
    }else{
      S_Table <- round(as.numeric(S_Table),2)
      Descr<-print(paste("Разницы между группами не было найдено (p-уровень=",S_Table,")."))
      a <- paste(Descr,"\n")
      cat(a, file = FileName, append = TRUE)
    }
    
    
  }
}  






#pvalue сравнения непарметрич данных (kruskal.test)
#приемер: pvalueParaKrText(df_Pillow,df_Pillow$Age,df_Pillow$Group,"по возрасту")
pvalueParaKrText <-function(database,x,y, parametr1)
{
  kruskal<-round(as.numeric(kruskal.test(x ~ y, data=database)[3]),2)
  Descr<-print(paste("Разница между группами", parametr1," составила",kruskal, "."))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}

#pvalue сравнения непарметрич данных (wilcox.test)
#приемер: pvalueParaWxText(gr_Jun,gr_Jun$Age,gr_Jun$Group,"по возрасту")
pvalueParaWxText <-function(database,x,y, parametr1)
{
  wilcox<-round(as.numeric(wilcox.test(x ~ y, data=database)[3]),2)
  Descr<-print(paste("Разница между группами", parametr1," составила",wilcox, "."))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}



# приемер:Table_numeric2("возраст",df1$age, df1$dominant_hand)
Table_numeric2<-function(parametr,database,dev)
{
  if( shapiro.test(database)$p.value> 0.05
  )
  {
    Table_numeric_Normal(parametr,database,dev )
  }
  else
  {
    Table_numeric_NoNormal(parametr,database,dev)
  }
}


# приемер:Value_numeric2("возраст",df_Pillow$age, df_Pillow$group)
Value_numeric2<-function(parametr,database,dev)
{
  if( shapiro.test(database)$p.value> 0.05
  )
  {
    S_Table <- round(as.numeric(t.test(database ~ dev)[3]),2)
    if (S_Table<0.05) {
      S_Table <- round(as.numeric(S_Table),2)
      Descr<-print(paste("Разница между группами по показателю", parametr," составила",S_Table, "."))
      a <- paste(Descr,"\n")
      cat(a, file = FileName, append = TRUE) 
      
    }else{
      S_Table <- round(as.numeric(S_Table),2)
      Descr<-print(paste("Разницы между группами по показателю", parametr," не было найдено (p-уровень=",S_Table,")."))
      a <- paste(Descr,"\n")
      cat(a, file = FileName, append = TRUE)
    }
  }
  else
  {
    S_Table <- round(as.numeric(wilcox.test(database ~ dev)[3]),2)
    if (S_Table<0.05) {
      S_Table <- round(as.numeric(S_Table),2)
      Descr<-print(paste("Разница между группами", parametr," составила",S_Table, "."))
      a <- paste(Descr,"\n")
      cat(a, file = FileName, append = TRUE) 
      
    }else{
      S_Table <- round(as.numeric(S_Table),2)
      Descr<-print(paste("Разницы между группами ", parametr," не было найдено (p-уровень=",S_Table,")."))
      a <- paste(Descr,"\n")
      cat(a, file = FileName, append = TRUE)
    }
  }
}

# приемер:Table_numeric3("возраст",df_Pillow$Age, df_Pillow$Group)
Table_numeric3<-function(parametr,database,dev)
{
  if( shapiro.test(database)$p.value> 0.05
  )
  {
    Table_numericANOV(parametr,database,dev)
  }
  else
  {
    Table_numericKr(parametr,database,dev)
  }
}


#####COMB FUNCTIONS####
# приемер:Describe_numeric (df_Pillow$Age, "возраст","пациентов по всей выборке составил","лет")
Describe_numeric<-function(database,parametr,sample1,mesurement){
  if( shapiro.test(database)$p.value> 0.05
  ){
    Describe_numeric_Norm(database,parametr,sample1,mesurement)
    
  }
  else{
    Describe_numeric_NoNorm(database,parametr,sample1,mesurement)
    
  }
  
}

#SSA(dfUsIsTumorGr1$us_is_tumor,dfIsTumorGr1$tumor_is)
SSA <- function(predicted_value, expected_value){
  example <- confusionMatrix(data=predicted_value, reference = expected_value)
  example
}

#binary_table (dfUsIsTumorGr1$us_is_tumor)
binary_table <- function(data){
  a <- replace(data, data=="не проводилось", "нет")
  a <- 	factor(a, levels=c("нет","да"), labels = c("нет"="нет","1"="да"))
  return(a)
}





chapter_2_text <- function(parametr,  vector1, vector2, database,vector, sep){
  escribir (parametr)
  Quantity_discr(levels(database[[sep]])[1],vector1)
  Quantity_discr(levels(database[[sep]])[2],vector2)
  Quantity_table(parametr,database,vector,sep)
  
}




# chapter_qual_text("Тип ативности",df1,"type_action","type_deformation")


chapter_qual_text<-function(parametr,database,vector,sep){
  database1 <- subset(database,database[[sep]]==levels(database[[sep]])[1])
  database2 <- subset(database,database[[sep]]==levels(database[[sep]])[2])
  chapter_2_text(parametr, database1[[vector]],database2[[vector]], database,vector, sep)
  
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


calculate_function_2group <- function(dataframe1, list1,sample, compairMain){
  
  # перевести символ в фактор
  for (i in 1:length(colnames(dataframe1))) {
    if(sapply(dataframe1[i], is.character)){
      dataframe1[,i] <- as.factor(dataframe1[,i])
    }
  }
  # перевести челые в дробные
  for (i in 1:length(colnames(dataframe1))) {
    if(sapply(dataframe1[i], is.integer)){
      dataframe1[,i] <- as.numeric(dataframe1[,i])
    }
  }
  # разделить на 2 потока
  input  <- dataframe1[,c(list1[["inputData"]],list1[["compairMain"]][compairMain])]
  n_Figure <- 1
  n_Table <- 1
  # описать в целом по факторам
  escribir(paste("\n\n",toupper(sample),"\n\n"))
  escribir(paste("\n\n",toupper("метериалы"),"\n\n"))
  escribir(paste("\"##\" Описание факторов",sample,"\n\n"))
  for (i in 1:length(colnames(input))) {
    if(sapply(input[i], is.factor)){
      Quantity_discr(list1[["inputData_transl"]][i],input[,i])
    }
  }
  escribir("\n\n")
  # описать в целом по числам
  escribir(paste("\"##\" Описание количественных данных",sample,"\n\n"))
  for (i in 1:length(colnames(input))) {
    if(sapply(input[i], is.numeric)){
      Describe_numeric (input[,i], list1[["inputData_transl"]][i]," пациентов по всей выборке составил ",list1[["inputData_measure"]][i])
    }
  }
  escribir("\n\n")
  
  
  
  
  
  # сравнить группы по факторам
  escribir(paste("\"##\" Сравнение между группами по факторам",sample))
  for (i in 1:length(colnames(input))) {
    
    if(sapply(input[i], is.factor)){
      chapter_qual_text(list1[["inputData_transl"]][i],input,list1[["inputData"]][i],list1[["compairMain"]][compairMain])
      escribir(paste("Таблица №",as.character(n_Table),". Распределение по ",list1[["inputData_transl"]][i]," в группах X и Y.",sample))
      n_Table <- n_Table+1
      
    }
    
  }
  escribir("\n\n")
  # сравнение группы по факторам
  for (i in 1:length(colnames(input))) {
    if(sapply(input[i], is.factor)){
      escribir(list1[["inputData_transl"]][i])
      try(pvalueQualitativeText(input[,i], input[,list1[["compairMain"]][compairMain]],list1[["inputData_transl"]][i]))
    }
  }
  
  escribir("\n\n")
  # визуализация группы по факторам
  
  for (i in 1:length(colnames(input))) {
    PSDS_PATH <- file.path(getwd())
    
    if(sapply(input[i], is.factor)){
      sample1 <- gsub(" ", "_", sample)
      wd <- getwd()
      string <-paste("![](",wd,"workspace/disser/str/img",paste(sample1,compairMain),"/",list1[["inputData"]][i],".png)")
      updated_string <- gsub(" ", "", string)
      escribir (updated_string)
      escribir (paste("Рисунок №",as.character(n_Figure),". Распределение по ",list1[["inputData_transl"]][i]," в группах X и Y.",sample))
      nameImg <- GeomBar(input,input[,i],input[,list1[["compairMain"]][compairMain]],list1[["inputData"]][i])
      string <-paste(wd,"/workspace/disser/str/img","/",paste(sample1,compairMain),"/",list1[["inputData"]][i],".png")
      updated_string <- gsub(" ", "", string)
      ggsave(file.path(updated_string), 
             plot = nameImg, units = "in", width = 14, height = 8)
      n_Figure <- n_Figure+1
    }
  }
  escribir("\n\n")
  # описать номера по групам
  
  
  
  escribir(paste("\"##\" Сравнение между группами по количественным данным",sample))
  for (i in 1:length(colnames(input))) {
    df_subset1 <- subset(input, input[,list1[["compairMain"]][compairMain]] == levels(input[,list1[["compairMain"]][compairMain]])[1])
    
    if(sapply(df_subset1[i], is.numeric)){
      
      Describe_numeric (df_subset1[,i], list1[["inputData_transl"]][i],paste("пациентов в",levels(df_subset1[,list1[["compairMain"]][compairMain]])[1]," "),list1[["inputData_measure"]][i])
    }
    
  }
  
  for (i in 1:length(colnames(input))) {
    df_subset2 <- subset(input, input[,list1[["compairMain"]][compairMain]] == levels(input[,list1[["compairMain"]][compairMain]])[2])
    
    if(sapply(df_subset2[i], is.numeric)){
      
      Describe_numeric (df_subset2[,i], list1[["inputData_transl"]][i],paste("пациентов в",levels(df_subset2[,list1[["compairMain"]][compairMain]])[2]," "),list1[["inputData_measure"]][i])
      
    }
    
  }
  
  
  escribir("\n\n")
  # таблица группы по номерам
  for (i in 1:length(colnames(input))) {
    
    
    if(sapply(input[i], is.numeric)){
      
      try(Table_numeric2(list1[["inputData_transl"]][i],input[,i], input[,list1[["compairMain"]][compairMain]]))
      escribir (paste("Таблица №",as.character(n_Table),". Распределение по ",list1[["inputData_transl"]][i]," в группах X и Y.",sample))
      n_Table <- n_Table+1
    }
    
  }
  escribir("\n\n")
  # сравнение группы по номерам
  for (i in 1:length(colnames(input))) {
    if(sapply(input[i], is.numeric)){
      escribir(list1[["inputData_transl"]][i])
      try(Value_numeric2(list1[["inputData_transl"]][i],input[,i], input[,list1[["compairMain"]][compairMain]]))
    }
  }
  escribir("\n\n")
  # визуализация группы по номерам
  
  for (i in 1:length(colnames(input))) {
    PSDS_PATH <- file.path(getwd())
    
    if(sapply(input[i], is.numeric)){
      sample1 <- gsub(" ", "_", sample)
      string <-paste("![](workspace/disser/str/img",paste(sample1,compairMain),"/",list1[["inputData"]][i],".png)")
      updated_string <- gsub(" ", "", string)
      escribir (updated_string)
      escribir (paste("Рисунок №",as.character(n_Figure),". Распределение по ",list1[["inputData_transl"]][i]," в группах X и Y.",sample))
      nameImg <- Violinplot(input,input[,i],input[,list1[["compairMain"]][compairMain]],list1[["inputData"]][i],"группа")
      string <-paste("workspace/disser/str/img","/",paste(sample1,compairMain),"/",list1[["inputData"]][i],".png")
      updated_string <- gsub(" ", "", string)
      ggsave(file.path(PSDS_PATH, updated_string), 
             plot = nameImg, units = "in", width = 14, height = 8)
      n_Figure <- n_Figure+1
    }
  }
  
  escribir(paste("\n\n",toupper("результаты"),"\n\n"))
  output  <- dataframe1[,c(list1[["outputData"]],list1[["compairMain"]][compairMain])]
  n_Figure <- 1
  n_Table <- 1
  escribir("\n\n")
  # описать в целом по факторам
  escribir(paste("\"##\" Описание факторов",sample))
  for (i in 1:length(colnames(output))) {
    if(sapply(output[i], is.factor)){
      Quantity_discr(list1[["outputData_transl"]][i],output[,i])
    }
  }
  escribir("\n\n")
  # описать в целом по числам
  escribir(paste("\"##\" Описание количественных данных",sample))
  for (i in 1:length(colnames(output))) {
    if(sapply(output[i], is.numeric)){
      Describe_numeric (output[,i], list1[["outputData_transl"]][i]," пациентов по всей выборке составил ",list1[["outputData_measure"]][i])
    }
  }
  escribir("\n\n")
  
  
  
  # сравнить группы по факторам
  escribir(paste("\"##\" Сравнение между группами по факторам",sample))
  for (i in 1:length(colnames(output))) {
    if(sapply(output[i], is.factor)){
      chapter_qual_text(list1[["outputData_transl"]][i],output,list1[["outputData"]][i],list1[["compairMain"]][compairMain])
      escribir (paste("Таблица №",as.character(n_Table),". Распределение по ",list1[["outputData_transl"]][i]," в группах X и Y.",sample))
      n_Table <- n_Table+1
      
    }
    
  }
  escribir("\n\n")
  # сравнение группы по факторам
  for (i in 1:length(colnames(output))) {
    if(sapply(output[i], is.factor)){
      escribir(list1[["outputData_transl"]][i])
      try(pvalueQualitativeText(output[,i], output[,list1[["compairMain"]][compairMain]],list1[["outputData_transl"]][i]))
    }
  }
  
  escribir("\n\n")
  # визуализация группы по факторам
  
  for (i in 1:length(colnames(output))) {
    PSDS_PATH <- file.path(getwd())
    
    if(sapply(output[i], is.factor)){
      sample1 <- gsub(" ", "_", sample)
      string <-paste("![](workspace/disser/str/img",paste(sample1,compairMain),"/",list1[["outputData"]][i],".png)")
      updated_string <- gsub(" ", "", string)
      escribir (updated_string)
      escribir (paste("Рисунок №",as.character(n_Figure),". Распределение по ",list1[["outputData_transl"]][i]," в группах X и Y.",sample))
      nameImg <- GeomBar(output,output[,i],output[,list1[["compairMain"]][compairMain]],list1[["outputData"]][i])
      string <-paste("workspace/disser/str/img","/",paste(sample1,compairMain),"/",list1[["outputData"]][i],".png")
      updated_string <- gsub(" ", "", string)
      ggsave(file.path(PSDS_PATH, updated_string), 
             plot = nameImg, units = "in", width = 14, height = 8)
      n_Figure <- n_Figure+1
    }
  }
  escribir("\n\n")
  # описать номера по групам
  escribir(paste("\"##\" Сравнение между группами по количественным данным",sample))
  for (i in 1:length(colnames(output))) {
    df_subset1 <- subset(output, output[,list1[["compairMain"]][compairMain]] == levels(output[,list1[["compairMain"]][compairMain]])[1])
    
    if(sapply(df_subset1[i], is.numeric)){
      
      Describe_numeric (df_subset1[,i], list1[["outputData_transl"]][i],paste("пациентов в",levels(df_subset1[,list1[["compairMain"]][compairMain]])[1]," "),list1[["outputData_measure"]][i])
    }
    
  }
  escribir("\n\n")
  for (i in 1:length(colnames(output))) {
    df_subset2 <- subset(output, output[,list1[["compairMain"]][compairMain]] == levels(output[,list1[["compairMain"]][compairMain]])[2])
    
    if(sapply(df_subset2[i], is.numeric)){
      
      Describe_numeric (df_subset2[,i], list1[["outputData_transl"]][i],paste("пациентов в",levels(df_subset2[,list1[["compairMain"]][compairMain]])[2]," "),list1[["outputData_measure"]][i])
      
    }
    
  }
  escribir("\n\n")
  # таблица группы по номерам
  for (i in 1:length(colnames(output))) {
    
    
    if(sapply(output[i], is.numeric)){
      
      try(Table_numeric2(list1[["outputData_transl"]][i],output[,i], output[,list1[["compairMain"]][compairMain]]))
      escribir (paste("Таблица №",as.character(n_Table),". Распределение по ",list1[["outputData_transl"]][i]," в группах X и Y.",sample))
      n_Table <- n_Table+1
    }
    
  }
  escribir("\n\n")
  # сравнение группы по номерам
  for (i in 1:length(colnames(output))) {
    if(sapply(output[i], is.numeric)){
      escribir(list1[["outputData_transl"]][i])
      try(Value_numeric2(list1[["outputData_transl"]][i],output[,i], output[,list1[["compairMain"]][compairMain]]))
    }
  }
  escribir("\n\n")
  # визуализация группы по номерам
  
  for (i in 1:length(colnames(output))) {
    PSDS_PATH <- file.path(getwd())
    
    if(sapply(output[i], is.numeric)){
      sample1 <- gsub(" ", "_", sample)
      string <-paste("![](workspace/disser/str/img",paste(sample1,compairMain),"/",list1[["outputData"]][i],".png)")
      updated_string <- gsub(" ", "", string)
      escribir (updated_string)
      escribir (paste("Рисунок №",as.character(n_Figure),". Распределение по ",list1[["outputData_transl"]][i]," в группах X и Y.",sample))
      nameImg <- Violinplot(output,output[,i],output[,list1[["compairMain"]][compairMain]],list1[["outputData"]][i],"группа")
      string <-paste("workspace/disser/str/img","/",paste(sample1,compairMain),"/",list1[["outputData"]][i],".png")
      updated_string <- gsub(" ", "", string)
      ggsave(file.path(PSDS_PATH, updated_string), 
             plot = nameImg, units = "in", width = 14, height = 8)
      n_Figure <- n_Figure+1
    }
  }
  escribir("\n\n")
  rm(n_Figure)
  rm(n_Table)
}


calculate_function_1group <- function(dataframe1, list1,sample, compairMain){
  
  # перевести символ в фактор
  for (i in 1:length(colnames(dataframe1))) {
    if(sapply(dataframe1[i], is.character)){
      dataframe1[,i] <- as.factor(dataframe1[,i])
    }
  }
  # перевести челые в дробные
  for (i in 1:length(colnames(dataframe1))) {
    if(sapply(dataframe1[i], is.integer)){
      dataframe1[,i] <- as.numeric(dataframe1[,i])
    }
  }
  # разделить на 2 потока
  input  <- dataframe1[,c(list1[["inputData"]],list1[["compairMain"]][compairMain])]
  
  # описать в целом по факторам
  escribir(paste("\n\n",toupper(sample),"\n\n"))
  escribir(paste("\n\n",toupper("метериалы"),"\n\n"))
  escribir(paste("\"##\" Описание факторов",sample,"\n\n"))
  for (i in 1:length(colnames(input))) {
    if(sapply(input[i], is.factor)){
      Quantity_discr(list1[["inputData_transl"]][i],input[,i])
    }
  }
  escribir("\n\n")
  # описать в целом по числам
  escribir(paste("\"##\" Описание количественных данных",sample,"\n\n"))
  for (i in 1:length(colnames(input))) {
    if(sapply(input[i], is.numeric)){
      Describe_numeric (input[,i], list1[["inputData_transl"]][i]," пациентов по всей выборке составил ",list1[["inputData_measure"]][i])
    }
  }
  escribir("\n\n")
  
  
  
  
  escribir(paste("\n\n",toupper("результаты"),"\n\n"))
  output  <- dataframe1[,c(list1[["outputData"]],list1[["compairMain"]][compairMain])]
  
  escribir("\n\n")
  # описать в целом по факторам
  escribir(paste("\"##\" Описание факторов",sample))
  for (i in 1:length(colnames(output))) {
    if(sapply(output[i], is.factor)){
      Quantity_discr(list1[["outputData_transl"]][i],output[,i])
    }
  }
  escribir("\n\n")
  # описать в целом по числам
  escribir(paste("\"##\" Описание количественных данных",sample))
  for (i in 1:length(colnames(output))) {
    if(sapply(output[i], is.numeric)){
      Describe_numeric (output[,i], list1[["outputData_transl"]][i]," пациентов по всей выборке составил ",list1[["outputData_measure"]][i])
    }
  }
  
  
}





calculate_function <- function(dataframe1, list1,sample, compairMain){
  if(length(table(dataframe1[list1[["compairMain"]][compairMain]]))==2){
    calculate_function_2group(dataframe1, list1,sample, compairMain)
  }
  else if(length(table(dataframe1[list1[["compairMain"]][compairMain]]))==1){
    calculate_function_1group(dataframe1, list1,sample, compairMain)
  }
  else{
    # calculate_function_3group(dataframe1, list1,sample, compairMain)
    print("нет функции")
  }
}
