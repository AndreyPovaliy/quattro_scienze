#####library####
#подключаем библитеку для чтения exel
library(openxlsx)
library(pwr)
#####SAMPLES####
dfRad<- read.xlsx(xlsxFile = "~/3dPlaning_RadiusOsteotomy/Луч Глава 5.xlsx",
                  sheet = '5')

gr1<- subset(dfRad, Group == 'Контроль')
gr2<- subset(dfRad, Group == 'Протокол 3d')


domYes<- subset(dfRad, Damage_dominant_hand == 'да')
gr1_domYes<- subset(domYes, Group == 'Контроль')
gr2_domYes<- subset(domYes, Group == 'Протокол 3d')

domNo<- subset(dfRad, Damage_dominant_hand == 'нет')
gr1_domNo<- subset(domNo, Group == 'Контроль')
gr2_domNo<- subset(domNo, Group == 'Протокол 3d')

defDors<- subset(dfRad, Type_deformation == 'дорсальная')
gr1_defDors<- subset(defDors, Group == 'Контроль')
gr2_defDors<- subset(defDors, Group == 'Протокол 3d')

defPalm<- subset(dfRad, Type_deformation == 'ладонная')
gr1_defPalm<- subset(defPalm, Group == 'Контроль')
gr2_defPalm<- subset(dfRad, Group == 'Протокол 3d')

defBrain<- subset(dfRad, Type_action  == 'B')
gr1_defPalm<- subset(defBrain, Group == 'Контроль')
gr2_defPalm<- subset(defBrain, Group == 'Протокол 3d')

defHand<- subset(dfRad, Type_action  == 'H')
gr1_defPalm<- subset(defHand, Group == 'Контроль')
gr2_defPalm<- subset(defHand, Group == 'Протокол 3d')


#####function####
sizeNum <- function(M1,M2,sigma) {
  size_effect<-abs(mean(M1)-mean(M2))/sd(sigma)
  PWT <- pwr.t.test(d=size_effect,sig.level=.05, power=.9, type="two.sample", alternative="two.sided")[1]
  print(PWT)
}


Recommended_values <- function(n1,mean1,sd1,n2,mean2,sd2){
  gr1<-round(rnorm(n1, mean1, sd1),2)
  gr2<-round(rnorm(n2, mean2, sd2),2)
  grT<-c(gr1,gr2)
  Result <- sizeNum(gr1,gr2,grT)
  ifelse (Result<n1+n2,"Рекомендовано","Не рекомендовано")
}


test_significant <- function(db,group,sample) {
  ifelse (shapiro.test(db)[2]<0.05, round(as.numeric(wilcox.test(db ~ group, data=sample)[3]),2), round(as.numeric(t.test(db ~ group, data=sample)[3]),2))
  
}



######Моделирование анкетирования#####
DASH6	


DASH12	


SF_16_РН_6	


SF_16_MН_6	


SF_16_РН_12	


SF_16_MН_12




######Моделирование времени операции и боль#####pwr.chisq.test()
Minutes_1 


VAS3

######Моделирование лучевой нагрузки#####
Rg_quantity_gr1 <- round(rnorm(n= 24, mean= 15, sd= 4),0)
Rg_quantity_gr2 <- round(rnorm(n= 24, mean= 8, sd= 2),0)


Rg_time_sec <-round(rnorm(n= 48, mean= 1.5, sd= 0.5),2)

Rg_time <-Rg_quantity$values*Rg_time_sec

Rg_Zv_dose <- round(rnorm(n= 48, mean= 0.35, sd= 0.1),2)

Rg_Zv <- round((Rg_time*Rg_Zv_dose),2)


######Моделирование функции руки#####


Diviation_gr1 <- round(rnorm(n= 24, mean= 40, sd= 5),0)
Diviation_gr2 <- round(rnorm(n= 24, mean= 50, sd= 5),0)

Diviation <- c(Diviation_gr1,Diviation_gr2)








######Выведение данных#####

setwd("~/3dPlaning_RadiusOsteotomy")

Diviation <- round(rnorm(n= 22, mean= 12, sd= 6),0)

Output_data <- data.frame(cbind(Diviation))
colnames(Output_data) <- c( "Дивиация")


test_significant(Output_data$`Длительность эксозиции`,Additional_data$Группа,Additional_data)



write.xlsx(x= Output_data ,file ="Output_data.xlsx" , append = TRUE)
