# УСЛОВНЫЕ ОБОЗНАЧЕНИЯ ДЛЯ ПОИСКА---------------------------------------------------------
# NB!! - обратить внимание
# ToDO - исправаить



# СТРОКОВЫЙ ВЫВОД УНИВЕРСАЛЬНЫЙ---------------------------------------------------------

# Функция позволяте ввести адрес сборочного файла вручную в консоли
fileNameEnter <- function(){
  FileName <- readline(prompt = "Enter a adress of FileName: ")
  return(FileName)
}


# Функция берет троку и выводит его в указанный файл.
# Файл нужно указать заранее
# Классификация: функция нулевого уровня
# приемер: escribir ("Запись1")
escribir <- function(a) {
  
  Descr <- print(a)
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
  
}


# СТРОКОВЫЙ ВЫВОД СТАТИСТИКИ  ---------------------------------------------------------
# Функция формирует вывод числовых, нормально распределенных данных в виде строки (Me +/- se)
# Классификация: функция первого уровня
# приемер:Describe_numeric_Norm (dfSr1$age, "возраст ","пациентов по всей выборке составил "," лет")
Describe_numeric_Norm<-function(database,parametr,sample1,mesurement)
{
  mean1<-round(mean(database, na.rm = TRUE),2)
  sd1<-round(sd(database, na.rm = TRUE),2)
  Descr<-print(paste("Средний ", parametr ,sample1,mean1 ,"±",sd1, mesurement,".", sep=""))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}


# Функция формирует вывод числовых, ненормально распределенных данных в виде строки (M [Q1:Q3])
# Классификация: функция первого уровня
# приемер:Describe_numeric_NoNorm (dfSr1$age, "возраст","пациентов по всей выборке составил "," лет")
Describe_numeric_NoNorm<-function(database,parametr,sample1,mesurement)
{
  median1<-round(median(database, na.rm = TRUE),2)
  quan1<-summary(database, na.rm = TRUE)
  Descr<-print(paste("Медиана ", parametr ,sample1,median1 ," [Q1-Q3: ",round(quan1[2],2),";",round(quan1[5],2),"]", mesurement,".", sep=""))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}





# ВЫВОД СТРОКИ ТАБЛИЦЫ ---------------------------------------------------------
## 2 группы ---------------------------------------------------------
# Функция формирует вывод числовых, нормально распределенных данных в виде строки таблицы с p-уровнем для 2 групп (Me +/- se)
# Table_numeric_Normal("возраст",dfSr1$q3_age, dfSr1$q2_gender)

Table_numeric_Normal<-function(parametr,database,dev)
{
  df1 <- subset(database, dev == levels(dev)[1])
  mean1<-round(mean(df1, na.rm = TRUE),2)
  sd1<-round(sd(df1, na.rm = TRUE),2)
  df2 <- subset(database, dev == levels(dev)[2])
  mean2<-round(mean(df2, na.rm = TRUE),2)
  sd2<-round(sd(df2, na.rm = TRUE),2)
  p_value <- round(as.numeric(t.test(database ~ dev)[3]),2)
  Descr<-print(paste("|",parametr,"|",mean1 ,"±",sd1,"|",mean2 ,"±",sd2,"|",p_value,"|"))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}



# Функция формирует вывод числовых, ненормально распределенных данных в виде строки таблицы с p-уровнем для 2 групп (M [Q1:Q3])
# приемер: Table_numeric_NoNormal("возраст",dfSr1$q3_age, dfSr1$q2_gender)
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


# приемер: Table_numeric2("возраст",dfSr1$q3_age, dfSr1$q2_gender)
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

## 3 группы ---------------------------------------------------------
# Функция формирует вывод числовых, нормально распределенных данных в виде строки таблицы с p-уровнем для 3 групп и более (Me +/- se)
# приемер: Table_numericANOV("возраст",dfSr1$q3_age, dfSr1$q3_age)
Table_numericANOV<-function(parametr,database,dev )
{
  mean1<-round(mean(database, na.rm = TRUE),2)
  sd1<-round(sd(database, na.rm = TRUE),2)
  p_value <- round(as.numeric(summary(aov(database ~ dev))[[1]][["Pr(>F)"]][1],2))
  Descr<-print(paste(parametr,"*",mean1 ,"±",sd1,"*", p_value))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}

# приемер: Table_numericKr("возраст",dfSr1$q3_age, dfSr1$q3_age)
Table_numericKr<-function(parametr,database,dev )
{
  median1<-round(median(database, na.rm = TRUE),2)
  quan1<-summary(database, na.rm = TRUE)
  p_value <- round(as.numeric(kruskal.test(database ~ dev)[3]),2)
  Descr<-print(paste(parametr,"*",median1 ,"[ Q1-Q3:",round(quan1[2],2),";",round(quan1[5],2),"]","*", p_value))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}


## Вывод статистически значимости ---------------------------------------------------------
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

# КАТЕГОРИАЛЬНЫЕ ДАННЫЕ ---------------------------------------------------------
## Запись 2 групп ---------------------------------------------------------

# Функция записывает категориальные данные в строковом виде, сокрщенная запись (0 - мужской в 56.25% (162))
# NB!! функция не адаптирована под строку
# Quantity_discr_short("Распределение по полу ",dfSr1$q2_gender)
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

# Функция записывает категориальные данные в строковом виде, длинная запись (0 - мужской в 56.25% (162/289случаев))
# Quantity_discr("Распределение по полу ",dfSr1$q2_gender)
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
        " случаев),"
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







# Функция записи таблицы с 2мя группами, выводит 2 столбца
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


## Запись 3 групп ---------------------------------------------------------
# Функция записи таблицы с 3мя группами, выводит 3 столбца
#Quantity_table_2("Диагноз",dfXlsxGr1$diagnosis_primary,dfXlsxGr3$diagnosis_primary)
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


## Вывод статистически значимости ---------------------------------------------------------

#pvalue сравнения качественных данных. Функмя определяет выполнение и Хи-квадрат или критерий Фишера и далее выводь значимость.
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