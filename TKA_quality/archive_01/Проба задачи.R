source("~/Documents/Science/TKA_quality/archive_01/articles/pillow/join_table.R")
library(openxlsx)

# write.xlsx(df_Pillow,"df_Pillow.xlsx")


df_Pillow <- read.xlsx("df_Pillow.xlsx")

df_PillowF <- subset(df_Pillow, df_Pillow$gender=="Женский")
df_PillowM <- subset(df_Pillow, df_Pillow$gender=="Мужской")



calculate_function(df_Pillow,list_Pillow,"общая выборка")

calculate_function(df_PillowF,list_Pillow,"женщины")
calculate_function(df_PillowM,list_Pillow,"мужчины")

