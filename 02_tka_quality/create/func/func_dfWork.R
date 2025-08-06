# функция подготавливает таблицу переводя в фактор и цифровые значения
# NB!! функция требует переводв df1 в data.frame
# dfSr1 <- data.frame(dfSr1)
# Пример использования chFactAndNum(dfSr1)


chFactAndNum <- function(dataframe1){
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
  
}


