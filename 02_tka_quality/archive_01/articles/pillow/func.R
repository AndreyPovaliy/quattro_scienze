checkNum <- function(df, minCut, maxCut, minStep, maxStep){
  while(max(df)>maxCut){
    for(i in 1:length(df)){
      if(df[i] > maxCut){
        df[i]<- df[i]-maxStep
      }
    }
  }
  while(min(df)<minCut){
    for(i in 1:length(df)){
      if(df[i] < minCut){
        df[i]<- df[i]+minStep
      }
    }
  }
  return(df)
}



