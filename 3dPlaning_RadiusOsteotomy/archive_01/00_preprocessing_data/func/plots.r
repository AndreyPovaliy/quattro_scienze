####PLOTS####
library(ggplot2)
#визуализация нормальности
#приемер: QQplot(dfRad, dfRad$age, "Возраст")
QQplot<-function(database, sample1, parametr1)
{
  ggplot(database, aes(sample = sample1)) +
    stat_qq( color="blue") +
    stat_qq_line(color="red")+
    xlab("")+
    ylab(parametr1)
  
}


#визуализация сравнения парметрич данных
#приемер: Boxplot(dfRad, dfRad$age, dfRad$group, "Возраст", "Group")
Boxplot<-function(database, sample1, sample2, parametr1, parametr2)
{
  ggplot(database, aes(x=sample2, y=sample1, fill=sample2))+
    geom_boxplot()+
    xlab(parametr2)+
    ylab(parametr1)+
    theme(legend.position="none")
  
}



#визуализация сравнения непарметрич данных
#приемер: GeomBar(dfRad,dfRad$gender,dfRad$group,"Пол")
GeomBar<-function(database, sample1, sample2, parametr1)
{
  ggplot(database, aes(x = sample2, fill = factor(	sample1	))) +
    geom_bar(aes(fill = factor(	sample1	)), position = position_stack(reverse = TRUE)) +
    theme(legend.position = "top")+
    xlab("Группа")+
    ylab("Количество пациентов")+
    scale_fill_discrete(name=parametr1)+
    theme(axis.title.y = element_text(size = rel(1.3)),
          axis.title.x = element_text(size = rel(1.3)),
          axis.text = element_text(size = rel(1.3)),
          legend.text = element_text(size = rel(0.9)),
          legend.title=element_text(size = rel(1.1)))
  
}


#приемер: Violinplot(dfRad, dfRad$age, dfRad$group, "Возраст", "Group")
Violinplot<-function(database, sample1, sample2, parametr1, parametr2){
  
  
  ggplot(database, aes(x=sample2, y=sample1, fill=sample2))+
    geom_violin()+
    xlab(parametr2)+
    ylab(parametr1)+
    theme(legend.position="none")+
    geom_boxplot(width=0.1) 
  
}

