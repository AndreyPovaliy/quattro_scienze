# СОЕДИНЕНИЕ МЕЖДУ .TXT ---------------------------------------------------------
# Функция выводит поток текста в из файла .txt, который является единицей хранения текста и выводит в единый файл сборщик.
# функция ссылается на escribir
# Классификация: функция первого уровня
# пример: escribir_rT("~/Documents/Science/ABUS_US_diagnostics/Text_work/Articles/Calc_abus_accur/decomp/txt/Материалы.txt")
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





# # СОРТИРОВЩИКИ ----------------------------------------------------------

# Функция получает общий вектор, делит их на 2 сравнения и передает в функцию Quantity_table_2
# функция ссылается на Quantity_table_2
#Quantity_table("Девиация",df_Pillow,"deviation","group")
Quantity_table<-function(parametr,database,vector,sep){
  lev1 <- levels(database[[sep]])[1]
  lev2 <- levels(database[[sep]])[2]
  database1 <- subset(database,database[[sep]]==lev1)
  database2 <- subset(database,database[[sep]]==lev2)
  Quantity_table_2(parametr,database1[[vector]],database2[[vector]],lev1,lev2)
}

# Функция определяет нормальность далее выводь соответсвующую запись
#  ссылается на Describe_numeric_Norm и Describe_numeric_NoNorm
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



# Функция получает общий вектор с категориальными данными и делит их на 2 уровная, далее ссылается на
# chapter_2_text
# chapter_qual_text("Тип ативности",df1,"type_action","type_deformation")
chapter_qual_text<-function(parametr,database,vector,sep){
  database1 <- subset(database,database[[sep]]==levels(database[[sep]])[1])
  database2 <- subset(database,database[[sep]]==levels(database[[sep]])[2])
  chapter_2_text(parametr, database1[[vector]],database2[[vector]], database,vector, sep)
  
}
