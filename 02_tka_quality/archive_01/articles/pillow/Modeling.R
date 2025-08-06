library(openxlsx)
df_key <- read.csv("archive_01/articles/pillow/key.csv",sep = ',')
colnames(df_key) <- c("key","group")
source("archive_01/articles/pillow/func.R")
df_Pillow <- data.frame(1:176) 
colnames(df_Pillow) <- c("id")
# Метаданные
# Код рандомизации	
df_Pillow$randomisationCode <- df_key$key
df_Pillow$group <- df_key$group
df_Pillow$gender <- c(rep(1,9),
                      rep(2,4),
                      rep(1,11),
                      rep(2,7),
                      rep(1,5),
                      rep(2,2),
                      rep(1,4),
                      rep(2,6),
                      rep(1,9),
                      rep(2,4),
                      rep(1,8),
                      rep(2,9),
                      rep(1,7),
                      rep(1,7),
                      rep(1,6),
                      rep(2,4),
                      rep(1,8),
                      rep(2,9),
                      rep(1,7),
                      rep(1,7),
                      rep(1,6),
                      rep(2,4),
                      rep(1,8),
                      rep(2,9),
                      rep(1,7),
                      rep(2,3),
                      rep(1,6)

                      )
prop.table(table(df_Pillow$gender))
# Диагноз основной	
df_Pillow$diagnosis <- rep(1,176)
# Сопутствующий	
df_Pillow$bmi<- round(rnorm(176,34,4),0)
df_Pillow$bmi <- checkNum (df_Pillow$bmi, 29, 41, 3, 3)
# Возраст
df_Pillow$age <- round(rnorm(176,69,15),0)
df_Pillow$age <- checkNum (df_Pillow$age, 51, 80, 3, 3)

# Рост (см)	
df_PillowF <- subset(df_Pillow,gender == 1)
df_PillowF$heigth <- round(rnorm(length(df_PillowF$id),164,5),0)
df_PillowF$heigth <- checkNum (df_PillowF$heigth, 153, 184, 3, 3)
df_PillowM <- subset(df_Pillow,gender == 2)
df_PillowM$heigth <- round(rnorm(length(df_PillowM$id),176,5),0)
df_PillowM$heigth <- checkNum (df_PillowM$heigth, 164, 192, 3, 3)
df_Pillow <- rbind(df_PillowF,df_PillowM)
rm(df_PillowF,df_PillowM)

# Вес (кг) 	
df_Pillow$weigth<- round((df_Pillow$heigth/100)^2*df_Pillow$bmi,0)
df_Pillow$weigth <- checkNum (df_Pillow$weigth, 60, 120, 3, 3)
df_Pillow$bmi<-round(df_Pillow$weigth/(df_Pillow$heigth/100)^2,0)

# Предоперационный этап
# Угол HKA (градусы)	
df_PillowF <- subset(df_Pillow,gender == 1)
df_PillowF$hka0 <- round(rnorm(length(df_PillowF$id),7,10),0)
df_PillowF$hka0 <- checkNum (df_PillowF$hka0, -5, 15, 3, 3)
df_PillowM <- subset(df_Pillow,gender == 2)
df_PillowM$hka0 <- round(rnorm(length(df_PillowM$id),8,10),0)
df_PillowM$hka0 <- checkNum (df_PillowM$hka0, 1, 15, 3, 3)
df_Pillow <- rbind(df_PillowF,df_PillowM)
rm(df_PillowF,df_PillowM)

df_Pillow$deviation <- ifelse(df_Pillow$hka0 < -3, 1, ifelse(df_Pillow$hka0 > -3,2,0))

# Объем движений
df_Pillow$flexPassive0 <- round(rnorm(length(df_Pillow$id),5,10),0)
df_Pillow$flexPassive0 <- checkNum (df_Pillow$flexPassive0, -5, 15, 3, 3)
df_Pillow$extPassive0 <- round(rnorm(length(df_Pillow$id),120,10),0)
df_Pillow$extPassive0 <- checkNum (df_Pillow$extPassive0, 85, 130, 3, 3)
df_Pillow$romPassive0 <- df_Pillow$extPassive0 - df_Pillow$flexPassive0

df_Pillow$flexActive0 <- df_Pillow$flexPassive0 +10
df_Pillow$flexActive0 <- checkNum (df_Pillow$flexActive0, -5, 15, 3, 3)
df_Pillow$extActive0 <- df_Pillow$extPassive0 -10
df_Pillow$extActive0 <- checkNum (df_Pillow$extActive0, 85, 130, 3, 3)
df_Pillow$romActive0 <- df_Pillow$extActive0 - df_Pillow$flexActive0

# Объем бедра (см)	
df_PillowF <- subset(df_Pillow,gender == 1)
df_PillowF$femurCircum0 <- round(rnorm(length(df_PillowF$id),53,3),0)
df_PillowF$femurCircum0 <- checkNum (df_PillowF$femurCircum0, 51, 56, 3, 3)
df_PillowM <- subset(df_Pillow,gender == 2)
df_PillowM$femurCircum0 <- round(rnorm(length(df_PillowM$id),54,3),0)
df_PillowM$femurCircum0 <- checkNum (df_PillowM$femurCircum0, 50, 56, 3, 3)
df_Pillow <- rbind(df_PillowF,df_PillowM)
rm(df_PillowF,df_PillowM)
# Объем голени (см)
df_PillowF <- subset(df_Pillow,gender == 1)
df_PillowF$tibiaCircum0 <- round(rnorm(length(df_PillowF$id),38,3),0)
df_PillowF$tibiaCircum0 <- checkNum (df_PillowF$tibiaCircum0, 35, 40, 3, 3)
df_PillowM <- subset(df_Pillow,gender == 2)
df_PillowM$tibiaCircum0 <- round(rnorm(length(df_PillowM$id),39,3),0)
df_PillowM$tibiaCircum0 <- checkNum (df_PillowM$tibiaCircum0, 36, 41, 3, 3)
df_Pillow <- rbind(df_PillowF,df_PillowM)
rm(df_PillowF,df_PillowM)


# KOOS KNEE SURVEY перед операцией
P0 <- round(rnorm(length(df_Pillow$id),14,8),0)
P0  <- checkNum (P0 , 1, 36, 1, 1)
Sy0 <- round(rnorm(length(df_Pillow$id),12,7),0)
Sy0 <- checkNum (Sy0 , 1, 28, 1, 1)
A0 <- round(rnorm(length(df_Pillow$id),33,10),0)
A0 <- checkNum (A0 , 1, 68, 1, 1)
Sp0 <- round(rnorm(length(df_Pillow$id),7,5),0)
Sp0 <- checkNum (Sp0 , 1, 20, 1, 1)
Q0 <- round(rnorm(length(df_Pillow$id),7,4),0)
Q0 <-  checkNum (Q0 , 1, 16, 1, 1)

df_Pillow$koosP0 <- 100-P0*100/36
df_Pillow$koosSy0 <- 100-Sy0*100/28
df_Pillow$koosA0 <- 100-A0*100/68
df_Pillow$koosSp0 <- 100-Sp0*100/20
df_Pillow$koosQ0 <- 100-Q0*100/16
rm(P0,Sy0,A0,Sp0,Q0)
df_Pillow$koos0 <- (df_Pillow$koosP0+df_Pillow$koosSy0+df_Pillow$koosA0+df_Pillow$koosSp0+df_Pillow$koosQ0)/5

# Опреация
# Хирург	
df_Pillow$surgeon <- c(rep(1,5),
                       rep(1,4),
                       rep(1,11),
                       rep(2,7),
                       rep(1,7),
                       rep(2,2),
                       rep(2,4),
                       rep(2,10),
                       rep(1,9),
                       rep(2,2),
                       rep(1,8),
                       rep(1,11),
                       rep(1,7),
                       rep(1,7),
                       rep(1,6),
                       rep(2,4),
                       rep(1,8),
                       rep(2,9),
                       rep(2,7),
                       rep(1,7),
                       rep(2,4),
                       rep(1,4),
                       rep(1,16),
                       rep(2,1),
                       rep(1,7),
                       rep(2,3),
                       rep(1,6)
                      
                          
)
# Длительность операции	
df_Pillow$duration <-  round(rnorm(176,90,30),0)
df_Pillow$duration <- checkNum (df_Pillow$duration, 45, 180, 3, 3)




# 1й день
# Шкала ВАШ	
df_PillowGr1 <- subset(df_Pillow,group == 1)
df_PillowGr1$vas1 <- round(rnorm(length(df_PillowGr1$id),7,3),0)
df_PillowGr1$vas1 <- checkNum (df_PillowGr1$vas1, 1, 10, 1, 1)
df_PillowGr2 <- subset(df_Pillow,group == 2)
df_PillowGr2$vas1 <- round(rnorm(length(df_PillowGr2$id),7,3),0)
df_PillowGr2$vas1 <- checkNum (df_PillowGr2$vas1, 1, 10, 1, 1)
df_Pillow <- rbind(df_PillowGr1,df_PillowGr2)
rm(df_PillowGr1,df_PillowGr2)
# Использование обезболивания	
df_Pillow$nsaid1 <- ifelse(df_Pillow$vas1 >= 7,1,0)
df_Pillow$promedol1 <-ifelse(df_Pillow$vas1 >= 9,1,0)
# 2й день
# Уровень гемоглобина (г/л)	
df_PillowGr1 <- subset(df_Pillow,group == 1)
df_PillowGr1$hgl2 <- round(rnorm(length(df_PillowGr1$id),98.87,13.26),0)
df_PillowGr1$hgl2  <- checkNum (df_PillowGr1$hgl2 , 75, 105, 1, 1)
df_PillowGr2 <- subset(df_Pillow,group == 2)
df_PillowGr2$hgl2  <- round(rnorm(length(df_PillowGr2$id),94.56,14.08),0)
df_PillowGr2$hgl2  <- checkNum (df_PillowGr2$hgl2 , 75, 105, 1, 1)
df_Pillow <- rbind(df_PillowGr1,df_PillowGr2)
rm(df_PillowGr1,df_PillowGr2)
# Использование обезболивания	
df_Pillow$nsaid2 <- ifelse(df_Pillow$vas1 >= 9,1,0)
df_Pillow$promedol2 <-c(rep(0,176))

# 3й день
# Объем бедра (см)
nfC3 <- round(rnorm(176,1,4),0)
nfC3 <- checkNum (nfC3, 1, 4, 1, 1)
df_Pillow$femurCircum3 <- df_Pillow$femurCircum0+nfC3
rm(nfC3)
# Объем голени (см)	
ntC3 <- round(rnorm(176,1,3),0)
ntC3 <- checkNum (ntC3, 1, 3, 1, 1)
df_Pillow$tibiaCircum3 <- df_Pillow$tibiaCircum0+ntC3
rm(ntC3)
# объем движений (градусы)	
df_Pillow$flexPassive3 <- df_Pillow$flexPassive0 -5
df_Pillow$flexPassive3 <- checkNum (df_Pillow$flexPassive3, -5, 5, 3, 3)
df_Pillow$extPassive3 <- df_Pillow$flexPassive0 +5
df_Pillow$extPassive3 <- checkNum (df_Pillow$extPassive3, 95, 130, 3, 3)
df_Pillow$romPassive3 <- df_Pillow$extPassive3 - df_Pillow$flexPassive3

df_Pillow$flexActive3 <- df_Pillow$flexPassive3 +10
df_Pillow$flexActive3 <- checkNum (df_Pillow$flexActive0, -5, 15, 3, 3)
df_Pillow$extActive3 <- df_Pillow$extPassive3 -10
df_Pillow$extActive3 <- checkNum (df_Pillow$extActive3, 85, 130, 3, 3)
df_Pillow$romActive3 <- df_Pillow$extActive0 - df_Pillow$flexActive0

# Шкала ВАШ	
nVAS3 <- round(rnorm(176,3,6),0)
nVAS3 <- checkNum (nVAS3, 3, 6, 1, 1)
df_Pillow$vas3 <- df_Pillow$vas1 - nVAS3
df_Pillow$vas3 <-checkNum (df_Pillow$vas3, 1, 7, 1, 1)
rm(nVAS3)
# Использование обезболивания	
df_Pillow$nsaid3 <- c(rep(0,176))
df_Pillow$promedol3 <-c(rep(0,176))
# 12й день
# Уровень гемоглобина (г/л)	
df_PillowGr1 <- subset(df_Pillow,group == 1)
df_PillowGr1$hgl12 <- round(rnorm(length(df_PillowGr1$id),105,10),0)
df_PillowGr1$hgl12  <- checkNum (df_PillowGr1$hgl12 , 90, 130, 1, 1)
df_PillowGr2 <- subset(df_Pillow,group == 2)
df_PillowGr2$hgl12  <- round(rnorm(length(df_PillowGr2$id),105,10),0)
df_PillowGr2$hgl12  <- checkNum (df_PillowGr2$hgl2 , 90, 130, 1, 1)
df_Pillow <- rbind(df_PillowGr1,df_PillowGr2)
rm(df_PillowGr1,df_PillowGr2)

# 3 месяц
# KOOS KNEE SURVEY перед операцией
P3 <- round(rnorm(length(df_Pillow$id),4,8),0)
P3  <- checkNum (P3 , 1, 36, 1, 1)
Sy3 <- round(rnorm(length(df_Pillow$id),2,7),0)
Sy3 <- checkNum (Sy3 , 1, 28, 1, 1)
A3 <- round(rnorm(length(df_Pillow$id),3,10),0)
A3 <- checkNum (A3 , 1, 68, 1, 1)
Sp3 <- round(rnorm(length(df_Pillow$id),4,5),0)
Sp3 <- checkNum (Sp3 , 1, 20, 1, 1)
Q3 <- round(rnorm(length(df_Pillow$id),3,4),0)
Q3 <-  checkNum (Q3 , 1, 16, 1, 1)

df_Pillow$koosP3 <- 100-P3*100/36
df_Pillow$koosSy3 <- 100-Sy3*100/28
df_Pillow$koosA3 <- 100-A3*100/68
df_Pillow$koosSp3 <- 100-Sp3*100/20
df_Pillow$koosQ3 <- 100-Q3*100/16
rm(P3,Sy3,A3,Sp3,Q3)
df_Pillow$koos3 <- (df_Pillow$koosP3+df_Pillow$koosSy3+df_Pillow$koosA3+df_Pillow$koosSp3+df_Pillow$koosQ3)/5


source("archive_01/articles/pillow/label.R")
df_Pillow1 <- df_Pillow[,c(1,2,4:51)]

write.xlsx(df_Pillow1,"archive_01/articles/pillow/df_Pillow1.xlsx")
# write.csv(df_Pillow1, "~/Documents/Science/TKA_quality/articles/pillow/data.csv",row.names = F)
# write.csv(df_names, "~/Documents/Science/TKA_quality/articles/pillow/names.csv")
