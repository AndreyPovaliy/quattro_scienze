library(readr)
library(tidyverse)
library(openxlsx)
library(lubridate)


# чтение данных
df3 <- read_csv("Deksametazon.csv")
codes3 <- read_csv("codes_3.csv")


# names_cals <- data.frame(native = colnames(df3))
# write.xlsx(names_cals, "names_cals.xlsx")
names_cals <- read.xlsx("names_cals.xlsx")
colnames(df3) <- names_cals$en

df3 <- inner_join(df3, codes3,by=c("code"="code"))


# сортировка, чистка, кодировка данных, устранение столбцов -----------------------------------------------------

# перенесли group
# объединили ФИО, переврели пол в кодировнный фактор
df3 <- df3 %>% 
  relocate(group) %>% 
  mutate(name = paste(df3$surname,df3$name, df3$sndName), .before = 5,
         gender = if_else(gender == "Мужской",1,2),
         diagnosis = case_when(
           diagnosis == "Посттравматический деформирующий артроз 3 ст. левого коленного сустава" ~ 1,
           diagnosis == "Посттравматический деформирующий артроз 3 ст. левого коленного сустава с нарушением оси конечности" ~ 2,
           diagnosis == "Посттравматический деформирующий артроз 3 ст. правого коленного сустава" ~ 3,
           diagnosis == "Посттравматический деформирующий артроз 3 ст. правого коленного сустава с нарушением оси конечности" ~ 4)
                )


# перевод номера карты в строку
df3$emc = as.character(df3$emc)

# работа с датами
df3$date_birth <- dmy(df3$date_birth)
df3$date_admin <- dmy(df3$date_admin)
df3$date_out <- dmy(df3$date_out)
df3$date_1st_day <- dmy(df3$date_1st_day)
df3$date_2nd_day <- dmy(df3$date_2nd_day)
df3$date_3nd_day <- dmy(df3$date_3nd_day)
df3$date_3_week <- dmy(df3$date_3_week)


# удаление столбцов
df3 <- select(df3,-c(code,surname,sndName))

# преобразование шкал
for(i in grep(pattern = "q1_0_cat", colnames(df3)):grep(pattern = "q13_0_cat", colnames(df3))){
  df3[[colnames(df3)[i]]] <- as.integer(gsub("[^0-9]+","",df3[[colnames(df3)[i]]]))
}


df3 <- df3 %>%
  mutate(
         cat_scale0 = q1_0_cat_scale + 
           q2_0_cat_scale+
           q3_0_cat_scale+
           q4_0_cat_scale+
           q5_0_cat_scale+
           q6_0_cat_scale+
           q7_0_cat_scale+
           q8_0_cat_scale+
           q9_0_cat_scale+
           q10_0_cat_scale+
           q11_0_cat_scale+
           q12_0_cat_scale+
           q12_0_cat_scale,
         cat_scale_grade0 = if_else(cat_scale0 > 30,1,0)
  )

for(i in grep(pattern = "q1_2_cat", colnames(df3)):grep(pattern = "q13_2_cat", colnames(df3))){
  df3[[colnames(df3)[i]]] <- as.integer(gsub("[^0-9]+","",df3[[colnames(df3)[i]]]))
}


df3 <- df3 %>%
  mutate(
    cat_scale2 = q1_2_cat_scale + 
      q2_2_cat_scale+
      q3_2_cat_scale+
      q4_2_cat_scale+
      q5_2_cat_scale+
      q6_2_cat_scale+
      q7_2_cat_scale+
      q8_2_cat_scale+
      q9_2_cat_scale+
      q10_2_cat_scale+
      q11_2_cat_scale+
      q12_2_cat_scale+
      q12_2_cat_scale,
    cat_scale_grade2 = if_else(cat_scale0 > 30,1,0)
  )



# добавление столбцов -----------------------------------------------------
# 1) добавить возраст
# 2) выделить сторону
# 3) добавить ИМТ

# выделение отдельных таблиц -----------------------------------------------------
# получение сопутсвующих
comorbid <- df3[,c(
  grep(pattern = "name", colnames(df3)),
  grep(pattern = "group", colnames(df3)),
  grep(pattern = "comorbid", colnames(df3))
  )]

names <- str_split(comorbid$comorbid[1], "; ")[[1]]
name <- rep(comorbid$name[1],length(names))
group <- rep(comorbid$group[1],length(names))
comorbid_1 <- names
re_comorbid <- data.frame(name,group,comorbid_1)
for(i in 2:nrow(comorbid)){
  names <- str_split(comorbid$comorbid[i], "; ")[[1]]
  name <- rep(comorbid$name[i],length(names))
  group <- rep(comorbid$group[i],length(names))
  comorbid_1 <- names
  re_comorbid2 <- data.frame(name,group,comorbid_1)
  re_comorbid <- rbind(re_comorbid,re_comorbid2)

}
comorbid <- re_comorbid

rm(re_comorbid2,re_comorbid,name,names,i,group,comorbid_1)


rm(drug_list,drug_list_1,day1,day2,day3)
drug_list <- df3[,c(grep(pattern = "name", colnames(df3)),
       grep(pattern = "emc", colnames(df3)),
       grep(pattern = "group", colnames(df3)),
       grep(pattern = "drug_1_1", colnames(df3)),
       grep(pattern = "dose_1_1", colnames(df3)),
       grep(pattern = "form_1_1", colnames(df3)),
       grep(pattern = "time_1_1", colnames(df3)))]
colnames(drug_list) <- c("name","emc","group","drug","dose","form","time")


for(i in 2:5){
  drug_list_1 <- df3[,c(grep(pattern = "name", colnames(df3)),
                                  grep(pattern = "emc", colnames(df3)),
                                  grep(pattern = "group", colnames(df3)),
                                  grep(pattern = paste("drug_",i,"_1",sep =""), colnames(df3)),
                                  grep(pattern = paste("dose_",i,"_1",sep =""), colnames(df3)),
                                  grep(pattern = paste("form_",i,"_1",sep =""), colnames(df3)),
                                  grep(pattern = paste("time_",i,"_1",sep =""), colnames(df3)))]
  colnames(drug_list_1) <- c("name","emc","group","drug","dose","form","time")
  drug_list <- rbind(drug_list,drug_list_1)
  
  
}
day1 <- rep(1,nrow(drug_list))

for(i in 1:6){
  drug_list_1 <- df3[,c(grep(pattern = "name", colnames(df3)),
                        grep(pattern = "emc", colnames(df3)),
                        grep(pattern = "group", colnames(df3)),
                        grep(pattern = paste("drug_2_",i,sep =""), colnames(df3)),
                        grep(pattern = paste("dose_2_",i,sep =""), colnames(df3)),
                        grep(pattern = paste("form_2_",i,sep =""), colnames(df3)),
                        grep(pattern = paste("time_2_",i,sep =""), colnames(df3))
                        )]
  colnames(drug_list_1) <- c("name","emc","group","drug","dose","form","time")
  drug_list <- rbind(drug_list,drug_list_1)
  
  
}
day2 <- rep(2,nrow(drug_list) - length(day1))

for(i in 1:4){
  drug_list_1 <- df3[,c(grep(pattern = "name", colnames(df3)),
                        grep(pattern = "emc", colnames(df3)),
                        grep(pattern = "group", colnames(df3)),
                        grep(pattern = paste("drug_3_",i,sep =""), colnames(df3)),
                        grep(pattern = paste("dose_3_",i,sep =""), colnames(df3)),
                        grep(pattern = paste("form_3_",i,sep =""), colnames(df3)),
                        grep(pattern = paste("time_3_",i,sep =""), colnames(df3)))]
  colnames(drug_list_1) <- c("name","emc","group","drug","dose","form","time")
  drug_list <- rbind(drug_list,drug_list_1)
  
  
}
day3 <- rep(3,nrow(drug_list) - (length(day2)+length(day1)))

drug_list$day <- c(day1,day2,day3)
drug_list <- drug_list[!is.na(drug_list$drug),]
drug_list$is_opic <- ifelse(drug_list$drug == "Sol. Promedoli",1,0)


glimpse(df3)
