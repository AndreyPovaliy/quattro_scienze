library(ggplot2)
library(psych)
library(scales)
####PLOTS####

#визуализация нормальности
#приемер: QQplot(dfRad, dfRad$Age, "Возраст")
QQplot<-function(database, sample1, parametr1)
{
  ggplot(database, aes(sample = sample1)) +
    stat_qq( color="blue") +
    stat_qq_line(color="red")+
    xlab("")+
    ylab(parametr1)
  
}
#визуализация сравнения парметрич данных
#приемер: Boxplot(dfRad, dfRad$Age, dfRad$Group, "Возраст", "Group")
Boxplot<-function(database, sample1, sample2, parametr1, parametr2)
{
  ggplot(database, aes(x=sample2, y=sample1, fill=sample2))+
    geom_boxplot()+
    xlab(parametr2)+
    ylab(parametr1)+
    theme(legend.position="none")
  
}

#визуализация сравнения непарметрич данных
#приемер: GeomBar(dfXlsxSnr,dfXlsxSnr$diagnosis_primary,dfXlsxSnr$group_separation,"Диагноз")
GeomBar<-function(database, sample1, sample2, parametr1)
{
  ggplot(database, aes(x = sample2, fill = factor(sample1))) +
    geom_bar(position = "dodge", color="black") +
    theme(legend.position = "left")+
    xlab("Группа")+
    ylab("Количество пациентов")+
    scale_fill_discrete(name=parametr1)+
    theme(
      axis.title.y = element_text(size = rel(1.3)),
      axis.title.x = element_text(size = rel(1.3)),
      axis.text = element_text(size = rel(1.3)),
      legend.text = element_text(size = rel(1.3)),
      legend.title=element_text(size = rel(1.3)))+
    scale_y_continuous(breaks= pretty_breaks())
  
}

#приемер: GeomBarNoLegendDiag(dfXlsxSnr,dfXlsxSnr$diagnosis_primary,dfXlsxSnr$group_separation,"Диагноз")
GeomBarNoLegendDiag<-function(database, sample1, sample2, parametr1)
{
  ggplot(database, aes(x = sample2, fill = factor(sample1))) +
    geom_bar(position = "dodge", color="black") +
    theme(legend.position = "none")+
    xlab("Группа")+
    ylab("Количество пациентов")+
    scale_fill_discrete(name=parametr1)+
    theme(
      axis.title.y = element_text(size = rel(1.3)),
      axis.title.x = element_text(size = rel(1.3)),
      axis.text.x = element_text(angle = 20, hjust = 1, size=10),
      axis.text = element_text(size = rel(1.3)),
      legend.text = element_text(size = rel(1.3)),
      legend.title=element_text(size = rel(1.3)))+
    scale_y_continuous(breaks= pretty_breaks())
  
}


#приемер: Violinplot(dfRad, dfRad$Age, dfRad$Group, "Возраст", "Group")
Violinplot<-function(database, sample1, sample2, parametr1, parametr2){
  
  
  ggplot(database, aes(x=sample2, y=sample1, fill=sample2))+
    geom_violin()+
    xlab(parametr2)+
    ylab(parametr1)+
    theme(legend.position="none")+
    geom_boxplot(width=0.1) 
  
}