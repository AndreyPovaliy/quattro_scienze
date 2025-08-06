library(tidyverse)
# сброс
source("./workspace/disser/calc_modul/input_data/data_script.R")
# calculate_function_2group(df2a, list2a, "общая выборка", 1)
dataframe1 <-  df1 
comprain <- c("group","damage_dominant_hand","type_deformation","type_action")
# нужно создать функцию для создания листа из dataframe

create_list_by_df <- function(dataframe1){
  list(compairMain = c(vecDf1[c(2,9:11)]),
       inputData = c(vecDf1[3:23]),
       inputData_transl = c(),
       inputData_measure = c(),
       outputData = c(vecDf1[24:35]),
       outputData_transl = c(),
       outputData_measure = c()
       }


list2a <-  list(compairMain = c(vecDf2a[6]),
                inputData = c(vecDf2a[2:5]),
                inputData_transl = c(
                  "возраст", 
                  "пол",
                  "ИМТ",
                  "тип апктивности"
                ),
                inputData_measure = c(
                  "лет", 
                  "кат",
                  "кг/м2",
                  "кат"
                ),
                outputData = c(vecDf2a[7:13]),
                outputData_transl = c(
                  "НЛК",
                  "ЛВ",
                  "ЛН",
                  "медиальный ладоннокортикальный угол",
                  "медианный ладоннокортикальный угол",
                  "латеральный ладоннокортикальный угол",
                  "среднее ладоннокортикальных углов"
                ),
                outputData_measure = c("градусы",
                                       "градусы",
                                       "градусы",
                                       "градусы",
                                       "градусы",
                                       "градусы",
                                       "градусы"),
                compairSecondary = c()
)







list1 = list2a
sample = "общая выборка" #вводим описание выборки
compairMain = 1 #вводим номер вектора compairMain из list

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