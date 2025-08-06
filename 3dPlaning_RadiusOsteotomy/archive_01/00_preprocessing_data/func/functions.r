#####FUNCTIONS####


# SIMPLE FUNCTIONS --------------------------------------------------------


#приемер: escribir ("Запись1")
escribir <- function(a) {
  
  a <- paste(a,"\n")
  cat(a, file = FileName, append = TRUE)
  
}

How_many<-function(a,b)
{
  количество_пациентов<-length(a)
  Descr<-print(paste(b,количество_пациентов, "пациентов."))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}

# приемер:Describe_numeric_Norm (dfRad$age, "возраст ","пациентов по всей выборке составил "," лет")
Describe_numeric_Norm<-function(database,parametr,sample1,mesurement)
{
  mean1<-round(mean(database, na.rm = TRUE),2)
  sd1<-round(sd(database, na.rm = TRUE),2)
  Descr<-print(paste("Средний ", parametr ,sample1,mean1 ,"±",sd1, mesurement,".", sep=""))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}
# приемер:Describe_numeric_NoNorm (dfRad$age, "возраста ","пациентов по всей выборке составила "," лет")
Describe_numeric_NoNorm<-function(database,parametr,sample1,mesurement)
{
  median1<-round(median(database, na.rm = TRUE),2)
  quan1<-summary(database, na.rm = TRUE)
  Descr<-print(paste("Медиана ", parametr ,sample1,median1 ," [Q1-Q3: ",round(quan1[2],2),";",round(quan1[5],2),"]", mesurement,".", sep=""))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}


# приемер:Table_numeric_Normal("возраст",gr1$age,gr2$age,dfRad$age, dfRad$group)
Table_numeric_Normal<-function(parametr,database1,database2,database,dev )
{
  mean1<-round(mean(database1, na.rm = TRUE),2)
  sd1<-round(sd(database1, na.rm = TRUE),2)
  mean2<-round(mean(database2, na.rm = TRUE),2)
  sd2<-round(sd(database2, na.rm = TRUE),2)
  p_value <- round(as.numeric(t.test(database ~ dev)[3]),2)
  Descr<-print(paste("|",parametr,"|",mean1 ,"±",sd1,"|",mean2 ,"±",sd2,"|", p_value,"|"), sep="|")
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}

quan2<-summary(gr2$age, na.rm = TRUE)
# приемер:Table_numeric_NoNormal("возраст",gr1$age,gr2$age,dfRad$age,dfRad$group)
Table_numeric_NoNormal<-function(parametr,database1,database2,database,dev )
{
  median1<-round(median(database1, na.rm = TRUE),2)
  quan1<-summary(database1, na.rm = TRUE)
  median2<-round(median(database2, na.rm = TRUE),2)
  quan2<-summary(database2, na.rm = TRUE)
  p_value <- round(as.numeric(wilcox.test(database ~ dev)[3]),2)
  
  Descr<-print(paste("|",parametr,"|",median1 ,"[ Q1-Q3:",round(quan1[2],2),";",round(quan1[5],2),"]","|",median1 ,"[ Q1-Q3:",round(quan2[2],2),";",round(quan2[5],2),"]","|", p_value,"|"), sep="")
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}



# приемер: Table_numericANOV ("возраст",dfRad$age, dfRad$group)
Table_numericANOV<-function(parametr,database,dev )
{
  mean1<-round(mean(database, na.rm = TRUE),2)
  sd1<-round(sd(database, na.rm = TRUE),2)
  p_value <- round(as.numeric(summary(aov(database ~ dev))[[1]][["Pr(>F)"]][1],2))
  Descr<-print(paste("|",parametr,"|",mean1 ,"±",sd1,"|", p_value,"|"))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}

# приемер:Table_numericKr("возраст",dfRad$age, dfRad$group)
Table_numericKr<-function(parametr,database,dev )
{
  median1<-round(median(database, na.rm = TRUE),2)
  quan1<-summary(database, na.rm = TRUE)
  p_value <- round(as.numeric(kruskal.test(database ~ dev)[3]),2)
  Descr<-print(paste("|",parametr,"|",median1 ,"[ Q1-Q3:",round(quan1[2],2),";",round(quan1[5],2),"]","|", p_value,"|"))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}





# Quantity_discr("В группе ",dfRad$group)
Quantity_discr<-function(parametr,database){
  n <- length(data.frame(table(database), row.names = TRUE )$Freq)
  i<-0
  cat(parametr, file = FileName, append = TRUE)
  while (i<n){
    Descr<-print(paste(
                       data.frame(table(database))[i+1,1],
                       " в ",
                       data.frame(round(prop.table(table(database))*100,2))[i+1,2],
                       "% (", 
                       data.frame(table(database))[i+1,2],
                       "/",length(database),
                       "случаев)",
                       "[95% ДИ ",
                       round(prop.test(table(database)[i+1], length(database))$conf.int[1],2),
                       ";",
                       round(prop.test(table(database)[i+1], length(database))$conf.int[2],2),
                       "]."
                       , sep=""))
    a <- paste(Descr,"\n")
    cat(a, file = FileName, append = TRUE)
    i<-i+1
    
  }
}

#escribir_rT("~/Documents/Science/ABUS_US_diagnostics/Text_work/Articles/Calc_abus_accur/decomp/txt/Материалы.txt")
escribir_rT <- function (way_to_text){
  rT <- read.table(way_to_text,sep = "_")
  for (i in 1:nrow(rT)) {
    escribir(paste(rT$V1[i],
                   "\n\n"))
    
  }
}

#приемер: pvalueQualitative(dfRad$side,dfRad$group)
pvalueQualitative <-  function(x,y){
  if(
    min(table(x)>5)
    
  )
  {
    S_Table <-chisq.test(table(x,y), simulate.p.value = TRUE)$p.value
    S_Table <- round(as.numeric(S_Table),2)
    return(S_Table)
    
  } else if (
    min(table(x)<2)
        ) {
    S_Table <-fisher.test(table(x,y), simulate.p.value = TRUE)$p.value
    S_Table <- round(as.numeric(S_Table),2)
    return(S_Table)
    
    
  } else {
    return(0)
  }

}


#Quantity_table_descr_singl ("Группа",dfRad$side) 
Quantity_table_descr_singl<-function(parametr,database){
  n <- length(data.frame(table(database), row.names = TRUE )$Freq)
  i<-0
  while (i<n){
    Descr<-print(paste("|",data.frame(table(database))[i+1,1],
                       "|",
                       data.frame(round(prop.table(table(database)),2))[i+1,2]*100,
                       "% (", 
                       data.frame(table(database))[i+1,2],
                       "/",length(database),
                       " случаев)|",
                       "[95% ДИ",
                       round(prop.test(table(database)[i+1], length(database))$conf.int[1],2),
                       ";",
                       round(prop.test(table(database)[i+1], length(database))$conf.int[2],2),
                       "]|"
    ))
    a <- paste(Descr,"\n")
    cat(a, file = FileName, append = TRUE)
    i<-i+1
    
  }
}


#Quantity_table_Single ("Группа",dfRad$side,dfRad$group) 
Quantity_table_Single<-function(parametr,database,group){
  n <- length(data.frame(table(database), row.names = TRUE )$Freq)
  Descr<-print(paste("|",parametr,"|Процентная доля|ДИ|p-value|
|------|------|------|------|"))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
  i<-0
  while (i<n){
    Descr<-print(paste("|",data.frame(table(database))[i+1,1],
                       "|",
                       data.frame(round(prop.table(table(database)),2))[i+1,2],
                       "% (", 
                       data.frame(table(database))[i+1,2],
                       "/",length(database),
                       " случаев)|",
                       "[95% ДИ",
                       round(prop.test(table(database)[i+1], length(database))$conf.int[1],2),
                       ";",
                       round(prop.test(table(database)[i+1], length(database))$conf.int[2],2),
                       "]|",pvalueQualitative(database,group),"|"
    ))
    a <- paste(Descr,"\n")
    cat(a, file = FileName, append = TRUE)
    i<-i+1
    
  }
}

#Quantity_table_Double(gr1$dominant_hand,gr2$dominant_hand,dfRad$dominant_hand,dfRad$group)
Quantity_table_Double<-function(database1,database2,database, group){
  n <- length(data.frame(table(database), row.names = TRUE )$Freq)
  i<-0
  while (i<n){
    Descr<-print(paste(data.frame(table(database1))[i+1,1],
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
                       "]|",pvalueQualitative(database,group),"|"
                       
    ))
    a <- paste(Descr,"\n")
    cat(a, file = FileName, append = TRUE)
    i<-i+1
    
  }
}


#pvalue сравнения качественных данных
#приемер: pvalueQualitativeText(dfRad$side,dfRad$group,"по стороне поражения")
pvalueQualitativeText <-  function(x,y,parametr1){
  if(
    min(table(x)>5)
    
  )
  {
    S_Table <-chisq.test(table(x,y), simulate.p.value = TRUE)$p.value
    S_Table <- round(as.numeric(S_Table),2)
    Описание<-print(paste("Разница между группами", parametr1," составила",S_Table, "."))
    a <- paste(Descr,"\n")
    cat(a, file = FileName, append = TRUE)
  }
  else{
    S_Table <-fisher.test(table(x,y), simulate.p.value = TRUE)$p.value
    S_Table <- round(as.numeric(S_Table),2)
    Описание<-print(paste("Разница между группами", parametr1," составила",S_Table, "."))
    a <- paste(Descr,"\n")
    cat(a, file = FileName, append = TRUE) 
    
  }
}  






#pvalue сравнения непарметрич данных (kruskal.test)
#приемер: pvalueParaKrText(dfRad,dfRad$age,dfRad$group,"по возрасту")
pvalueParaKrText <-function(database,x,y, parametr1)
{
  kruskal<-round(as.numeric(kruskal.test(x ~ y, data=database)[3]),2)
  Descr<-print(paste("Разница между группами", parametr1," составила",kruskal, "."))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE) 
}

#pvalue сравнения непарметрич данных (ANOVA)
#приемер: pvalueANOVText(dfRad,dfRad$age,dfRad$group,"по возрасту")
pvalueANOVText <-function(database,x,y, parametr1)
{
  fit <- aov(x~ y, data=database)
  s <- round(as.numeric(summary(fit)[[1]][["Pr(>F)"]][1]),2)
  Descr<-print(paste("Разница между группами", parametr1," составила",s, "."))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE) 
}


#pvalue сравнения непарметрич данных (wilcox.test)
#приемер: pvalueParaWxText(dfRad,dfRad$age,dfRad$group,"по возрасту")
pvalueParaWxText <-function(database,x,y, parametr1)
{
  wilcox<-round(as.numeric(wilcox.test(x ~ y, data=database)[3]),2)
  Descr<-print(paste("Разница между группами", parametr1," составила",wilcox, "."))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}

#pvalue сравнения парметрич данных (t.test)
#приемер: pvalueParaT_Text(dfRad,dfRad$age,dfRad$group,"по возрасту")
pvalueParaT_Text <-function(database,x,y, parametr1)
{
  wilcox<-round(as.numeric(t.test(x ~ y, data=database)[3]),2)
  Descr<-print(paste("Разница между группами", parametr1," составила",wilcox, "."))
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
}



#####COMB FUNCTIONS####


# приемер:Describe_numericText (dfRad$age, "возраст ","пациентов по всей выборке составил "," лет")
Describe_numericText<-function(database,parametr,sample1,mesurement){
  if( shapiro.test(database)$p.value> 0.05
  ){
    Describe_numeric_Norm(database,parametr,sample1,mesurement)
    
  }
  else{
    Describe_numeric_NoNorm(database,parametr,sample1,mesurement)
    
  }
  
}

# приемер:Pvalue_numericText2(dfRad,dfRad$age,dfRad$group,"по возрасту")
Pvalue_numericText2<-function(database,x,y, parametr1){
  if( shapiro.test(x)$p.value> 0.05
  ){
    pvalueParaT_Text (database,x,y, parametr1)
  }
  else{
    pvalueParaWxText (database,x,y, parametr1)
  }
  
}

# приемер:Pvalue_numericText3(dfRad,dfRad$age,dfRad$group,"по возрасту")
Pvalue_numericText3<-function(database,x,y, parametr1){
  if( shapiro.test(x)$p.value> 0.05
  ){
    pvalueANOVText(database,x,y, parametr1)
  }
  else{
    pvalueParaKrText(database,x,y, parametr1)
  }
  
}

# приемер:Pvalue_numeric(dfRad$age,dfRad$group)
Pvalue_numeric<-function(database,dev){
  if( shapiro.test(database)$p.value> 0.05
  ){
    p_value <- round(as.numeric(t.test(database~ dev)[3]),2)
    p_value
  }
  else{
    p_value <- round(as.numeric(wilcox.test(database~ dev)[3]),2)
    p_value
  }
  
}

# приемер:Table_numeric2("возраст",dfRad$age, "лет")
Table_numeric2<-function(parametr,database, measure)
{
  if( shapiro.test(database)$p.value> 0.05
  )
  {
    mean1<-round(mean(database, na.rm = TRUE),2)
    sd1<-round(sd(database, na.rm = TRUE),2)
    Descr<-print(paste("|",parametr,"|",mean1 ,"±",sd1,"|", measure ,"|"), sep="")
    a <- paste(Descr,"\n")
    cat(a, file = FileName, append = TRUE)
  }
  else
  {
    median1<-round(median(database, na.rm = TRUE),2)
    quan1<-summary(database, na.rm = TRUE)
    
    Descr<-print(paste("|",parametr,"|",median1 ,"[ Q1-Q3:",round(quan1[2],2),";",round(quan1[5],2),"]|",measure,"|"), sep="")
    a <- paste(Descr,"\n")
    cat(a, file = FileName, append = TRUE)
  }
}


# приемер:Table_numeric2bSide("возраст",gr1$age, gr2$age, dfRad$age, dfRad$group, dfRad, "лет")
# (parametr,group1,group2, vector, dev, df,  measure)
Table_numeric2bSide<-function(parametr,group1,group2, vector, dev, df,  measure)
{
  if( shapiro.test(vector)$p.value> 0.05
  )
  {
    mean1<-round(mean(group1, na.rm = TRUE),2)
    sd1<-round(sd(group1, na.rm = TRUE),2)
    mean2<-round(mean(group2, na.rm = TRUE),2)
    sd2<-round(sd(group2, na.rm = TRUE),2)
    p_value <- round(as.numeric(t.test(vector ~ dev, data=df)[3]),2)
    Descr<-print(paste("|",parametr,"|",mean1 ,"±",sd1,"|",
                       "|",mean2 ,"±",sd2,"|", measure ,
                       "|",p_value,"|"
                       
                       ), sep="")
    a <- paste(Descr,"\n")
    cat(a, file = FileName, append = TRUE)
  }
  else
  {
    median1<-round(median(group1, na.rm = TRUE),2)
    quan1<-summary(group1, na.rm = TRUE)
    median2<-round(median(group2, na.rm = TRUE),2)
    quan2<-summary(group2, na.rm = TRUE)
    p_value <- round(as.numeric(wilcox.test(vector ~ dev, data=df)[3]),2)
    Descr<-print(paste("|",parametr,"|",median1,"| [Q1-Q3: ",round(quan1[2],2),";",round(quan1[5],2),"]",
                       "|",median2,"| [Q1-Q3: ",round(quan2[2],2),";",round(quan2[5],2),"]|", measure ,
                       "|",p_value,"|"
                       
    ), sep="")
    a <- paste(Descr,"\n")
    cat(a, file = FileName, append = TRUE)
  }
}



# приемер:Table_numericP2("возраст",gr1$age,gr2$age,dfRad$age, dfRad$group)
Table_numericP2<-function(parametr,database1,database2,database,dev )
{
  
  if( shapiro.test(database)$p.value> 0.05
  )
  {
    Table_numeric_Normal(parametr,database1,database2,database,dev )
  }
  else
  {
    Table_numeric_NoNormal(parametr,database1,database2,database,dev )
  }
}

# приемер:Table_numericP3("возраст",dfRad$age, dfRad$group)
Table_numericP3<-function(parametr,database,dev)
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

# приемер: TextPvalue(pvalueQualitative(dfRad$side,dfRad$group),"По стороне поражения" )
# TextPvalue(Pvalue_numeric(dfRad$age,dfRad$group),"По возрасту" )

TextPvalue<- function(fun, parametr1)
{
  if (fun<0.05)
  {
    Descr <- print(paste(parametr1," обнаружено статистически значимое различие p-уровень=",fun))
    a <- paste(Descr,"\n")
    cat(a, file = FileName, append = TRUE)
  }
  # else
  # {
  #   Descr <-print(paste(parametr1," не обнаружено статистически значимых различий."))
  #   a <- paste(Descr,"\n")
  #   cat(a, file = FileName, append = TRUE)
  # }
  
}


#####value FUNCTIONS####
#Describe_numericSimp (dfRad$age)
Describe_numericSimp<-function(database){
  if( shapiro.test(database)$p.value> 0.05
  ){
    mean1<-round(mean(database, na.rm = TRUE),2)
    sd1<-round(sd(database, na.rm = TRUE),2)
    Descr<-print(paste(mean1 ,"±",sd1, sep=""))
    
    
  }
  else{
    median1<-round(median(database, na.rm = TRUE),2)
    quan1<-summary(database, na.rm = TRUE)
    Descr<-print(paste(median1 ," [Q1-Q3: ",round(quan1[2],2),";",round(quan1[5],2),"]", sep=""))
    
    
  }
  
}


 





