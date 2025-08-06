# source --------------------------------------------------------------

source("~/Documents/Science/3dPlaning_RadiusOsteotomy/archive_01/02_chapter_2/02_subsetting/num_data_2.R")
source("~/Documents/Science/3dPlaning_RadiusOsteotomy/archive_01/02_chapter_2/02_subsetting/cat_data_2.R")


# RetroStage --------------------------------------------------------------

numer_descr_2_retro <- function(x,descr){
  dfRadRetro_num_desc <-c(
    "время с момента опрерации ",
    "возраст ", 
    "ИМТ ",
    "НЛК поврежденной руки ",
    "ЛН поврежденной руки",
    "ЛВ поврежденной руки",
    "НЛК неповрежденной руки ",
    "ЛН неповрежденной руки",
    "ЛВ неповрежденной руки")
  
  dfRadRetro_num_mes <-c(
    " лет",
    " лет", 
    " кг/м2",
    " градусов",
    " градусов",
    " градусов",
    " градусов",
    " градусов",
    " градусов")
  escribir("\n\n")
  
  
  for (i in 1:ncol(x)){
    
    Describe_numericText (x[,i], dfRadRetro_num_desc[i], descr, dfRadRetro_num_mes[i])
    
  }
  escribir("\n\n")
  escribir("Таблица № 2.n. Показатели ")
  escribir(paste(dfRadRetro_num_desc))
  escribir(paste(descr,"\n\n"))
  escribir("|Показатель|Количество|Единица измерения|")
  escribir("|------|------|------|")
  for (i in 1:ncol(x)){
    
    Table_numeric2(dfRadRetro_num_desc[i],x[,i], dfRadRetro_num_mes[i])
  }
}


category_descr_2_retro <- function(x,descr){
  dfRadRetro_cat_before_names <- c(
     "Пол",
     "Сторона поражения",
     "Доминирующая рука",
     "Повреждение доминирующей руки",
    "Тип деформации",
    "Тип Активности",
    "Категория НЛК поврежденной руки",
    "Категория ЛН поврежденной руки",
    "Категория ЛВ поврежденной руки",
    "Категория НЛК неповрежденной руки ",
    "Категория ЛН неповрежденной руки",
    "Категория ЛВ неповрежденной руки"
  )
  for (i in 1:ncol(x)){
    escribir(paste("\n",dfRadRetro_cat_before_names[i]))
    Quantity_discr(descr,x[,i])
  }
  escribir("\n\nТаблица № 2.n. Показатели ")
  escribir(paste(dfRadRetro_cat_before_names))
  escribir(paste(descr,"\n\n"))
  
  escribir("| Показатель |Процентная доля|ДИ|p-value|\n|------|------|------|------|")
  for (i in 1:ncol(x)){
    escribir(paste("|",dfRadRetro_cat_before_names[i],"|------|------|------|"))
    Quantity_table_descr_singl (dfRadRetro_cat_before_names[i],x[,i]) 
  }
  
}

# BillatStage --------------------------------------------------------------
numer_descr_2_billat <- function(x,descr){
  
  dfRadBillat_num_desc <-c(
    "возраст ", 
    "ИМТ ")
  
  dfRadBillat_num_mes <-c(
    " лет", 
    " кг/м2")
  
  escribir (paste("Всего",descr,"было", length(x[,1])/2))
  Describe_numericText (x[,1], "возраста ",descr," лет")
  escribir (paste("Минимальный возраст сотсавил", min(x[,1]), "лет"))
  escribir (paste("Максимальный возраст сотсавил", max(x[,1]), "лет"))
  Describe_numericText (x[,2], "ИМТ ",descr," кг/м2")
  
  escribir("\n\n")
  escribir("Таблица № 2.n. Показатели ")
  escribir(paste(dfRadBillat_num_desc))
  escribir(paste(descr,"\n\n"))
  escribir("|Показатель|Количество|Единица измерения|")
  escribir("|------|------|------|")
  for (i in 1:ncol(x)){
    
    Table_numeric2(dfRadBillat_num_desc[i],x[,i], dfRadBillat_num_mes[i])
  }
}


category_descr_2_billat <- function(x,descr){
  dfRadBillat_cat_before_names <- c(
    "Пол",
    "Тип Активности"
  )
  for (i in 1:ncol(x)){
    escribir(paste("\n",dfRadBillat_cat_before_names[i]))
    Quantity_discr(descr,x[,i])
  }
  escribir("\n\nТаблица № 2.n. Показатели ")
  escribir(paste(dfRadBillat_cat_before_names))
  escribir(paste(descr,"\n\n"))
  
  escribir("| Показатель |Процентная доля|ДИ|p-value|\n|------|------|------|------|")
  for (i in 1:ncol(x)){
    escribir(paste("|",dfRadBillat_cat_before_names[i],"|------|------|------|"))
    Quantity_table_descr_singl (dfRadBillat_cat_before_names[i],x[,i]) 
  }
  
}


# TemplStage --------------------------------------------------------------

numer_descr_2_prot1 <- function(x,descr){
  
  dfRadProt1_num_desc <-c(
    "время от момента травмы ", 
    "возраст ")
  
  dfRadProt1_num_mes <-c(
    " месяцев", 
    " лет")
  
  escribir (paste("Всего",descr,"было", length(x[,1])/2))
  Describe_numericText (x[,2], dfRadProt1_num_desc[2],descr,dfRadProt1_num_mes[2])
  escribir (paste("Минимальный возраст сотсавил", min(x[,2]), dfRadProt1_num_mes[2]))
  escribir (paste("Максимальный возраст сотсавил", max(x[,2]), dfRadProt1_num_mes[2]))
  Describe_numericText (x[,1], dfRadProt1_num_desc[1],descr,dfRadProt1_num_mes[1])
  
  escribir("\n\n")
  escribir("Таблица № 2.n. Показатели ")
  escribir(paste(dfRadProt1_num_desc))
  escribir(paste(descr,"\n\n"))
  escribir("|Показатель|Количество|Единица измерения|")
  escribir("|------|------|------|")
  for (i in 1:ncol(x)){
    
    Table_numeric2(dfRadProt1_num_desc[i],x[,i], dfRadProt1_num_mes[i])
  }
}


category_descr_2_prot1 <- function(x,descr){
  dfRadProt1_cat_before_names <- c(
    "Пол",
    "Сторона",
    "Доминирующая рука",
    "Повреждение доминирующей руки",
    "Тип деформации"
  )
  for (i in 1:ncol(x)){
    escribir(paste("\n",dfRadProt1_cat_before_names[i]))
    Quantity_discr(descr,x[,i])
  }
  escribir("\n\nТаблица № 2.n. Показатели ")
  escribir(paste(dfRadProt1_cat_before_names))
  escribir(paste(descr,"\n\n"))
  
  escribir("| Показатель |Процентная доля|ДИ|p-value|\n|------|------|------|------|")
  for (i in 1:ncol(x)){
    escribir(paste("|",dfRadProt1_cat_before_names[i],"|------|------|------|"))
    Quantity_table_descr_singl (dfRadProt1_cat_before_names[i],x[,i]) 
  }
  
}

# ProspectStage --------------------------------------------------------------

numer_descr_2_prosp_single <- function(x,descr){
  dfRad_num_desc <-c(
    "возраст",
    "ИМТ",
    "НЛК поврежденной руки ",
    "ЛН поврежденной руки",
    "ЛВ поврежденной руки",
    "НЛК неповрежденной руки ",
    "ЛН неповрежденной руки",
    "ЛВ неповрежденной руки",
    "Оценка DASH до операции",
    "Оценка SF-16 физический компонент",
    "Оценка SF-16 ментальный компонент")
  
  dfRad_num_mes <-c(
    " лет", 
    " кг/м2",
    " градусов",
    " градусов",
    " градусов",
    " градусов",
    " градусов",
    " градусов",
    " баллов",
    " баллов",
    " баллов")
  escribir("\n\n")
  
  for (i in 1:ncol(x)){
    
    Describe_numericText (x[,i], dfRad_num_desc[i], descr, dfRad_num_mes[i])
    
  }
  escribir("\n\n")
  escribir("Таблица № 2.n. Показатели ")
  escribir(paste(dfRad_num_desc))
  escribir(paste(descr,"\n\n"))
  escribir("|Показатель|Количество|Единица измерения|")
  escribir("|------|------|------|")
  for (i in 1:ncol(x)){
    
    Table_numeric2(dfRad_num_desc[i],x[,i], dfRad_num_mes[i])
  }
}


category_descr_2_prosp_single  <- function(x,descr){
  dfRad_cat_before_names <- c(
    "Пол",
    "Сторона поражения",
    "Доминирующая рука",
    "Повреждение доминирующей руки",
    "Тип деформации",
    "Тип Активности",
    "Категория НЛК поврежденной руки",
    "Категория ЛН поврежденной руки",
    "Категория ЛВ поврежденной руки",
    "Категория НЛК неповрежденной руки ",
    "Категория ЛН неповрежденной руки",
    "Категория ЛВ неповрежденной руки"
  )

  for (i in 1:ncol(x)){
    escribir(paste("\n",dfRad_cat_before_names[i]))
    Quantity_discr(descr,x[,i])
  }
  escribir("\n\nТаблица № 2.n. Показатели ")
  escribir(paste(dfRad_cat_before_names))
  escribir(paste(descr,"\n\n"))
  
  escribir("| Показатель |Процентная доля|ДИ|p-value|\n|------|------|------|------|")
  for (i in 1:ncol(x)){
    escribir(paste("|",dfRad_cat_before_names[i],"|------|------|------|"))
    Quantity_table_descr_singl (dfRad_cat_before_names[i],x[,i]) 
  }
  
}


numer_descr_2_prosp_twoGr  <- function(x,y,descrX,descrY, df){
  dfRad_num_desc <-c(
    "возраст",
    "ИМТ",
    "НЛК поврежденной руки ",
    "ЛН поврежденной руки",
    "ЛВ поврежденной руки",
    "НЛК неповрежденной руки ",
    "ЛН неповрежденной руки",
    "ЛВ неповрежденной руки",
    "Оценка DASH до операции",
    "Оценка SF-16 физический компонент",
    "Оценка SF-16 ментальный компонент")
  
  dfRad_num_mes <-c(
    " лет", 
    " кг/м2",
    " градусов",
    " градусов",
    " градусов",
    " градусов",
    " градусов",
    " градусов",
    " баллов",
    " баллов",
    " баллов")
  escribir("\n\n")
  
  for (i in 1:(ncol(df)-1)){
    Describe_numericText (x[,i], dfRad_num_desc[i], descrX, dfRad_num_mes[i])
    Describe_numericText (y[,i], dfRad_num_desc[i], descrY, dfRad_num_mes[i])
    
  }
  n <- ncol(df)
  escribir("\n\n")
  for (i in 1:(ncol(df)-1)){
    TextPvalue(Pvalue_numeric(df[,i], df[,n]),dfRad_num_desc[i] )

  }
  
  Descr <-print(" В остальных случаях не обнаружено статистически значимых различий.")
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
  escribir("\n\n")
  escribir("Таблица № 2.n. Показатели ")
  escribir(paste(dfRad_num_desc))
  escribir(paste(descrX," и ",descrY,"\n\n"))
  escribir("|Показатель|Группа X|Группа Y|Единица измерения|p-уровень|")
  escribir("|------|------|------|------|------|")
  for (i in 1:ncol(df)){
    # Table_numeric2bSide("возраст",gr1$age, gr2$age, dfRad$age, dfRad$group, dfRad, "лет")
    
    Table_numeric2bSide(dfRad_num_desc[i],x[,i],y[,i],df[,i], df[,n],df, dfRad_num_mes[i])
  }
}

category_descr_2_prosp_twoGr  <- function(x,y,descrX,descrY,df){
  dfRad_cat_before_names <- c(
    "Пол",
    "Сторона поражения",
    "Доминирующая рука",
    "Повреждение доминирующей руки",
    "Тип деформации",
    "Тип Активности",
    "Категория НЛК поврежденной руки",
    "Категория ЛН поврежденной руки",
    "Категория ЛВ поврежденной руки",
    "Категория НЛК неповрежденной руки ",
    "Категория ЛН неповрежденной руки",
    "Категория ЛВ неповрежденной руки"
  )
  
  n <- ncol(df)
  for (i in 1:(ncol(df)-1)){
    escribir(paste("\n",dfRad_cat_before_names[i]))
    Quantity_discr(descrX,x[,i])
  }
  
  escribir("\n\n")
  
  for (i in 1:(ncol(df)-1)){
    TextPvalue(pvalueQualitative(df[,i],df[,n]),dfRad_cat_before_names[i] )

  }
  
  Descr <-print(" В остальных случаях не обнаружено статистически значимых различий.")
  a <- paste(Descr,"\n")
  cat(a, file = FileName, append = TRUE)
  
  escribir("\n\nТаблица № 2.n. Показатели ")
  escribir(paste(dfRad_cat_before_names))
  escribir(paste(descrX,"\n\n"))
  escribir(paste(descrY,"\n\n"))
  
  escribir(paste(
    "| Показатель |Процентная доля|ДИ|Процентная доля|ДИ|p-value|\n",
           "|------|------|------|------|------|------|\n",
           "|Группы|Группа А||Группа Б|||"))
  for (i in 1:(ncol(df)-1)){
    escribir(paste("|",dfRad_cat_before_names[i],"|------|------|------|------|------|"))
    Quantity_table_Double (x[,i],y[,i],df[,i],df[,n]) 
    
  }
  
}
