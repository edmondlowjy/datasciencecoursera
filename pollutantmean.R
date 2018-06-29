pollutantmean=function(directory,pollutant,id=1:332){
  pollutant_data=NULL
  file_vector=sapply(sprintf('%03d',id),FUN=function(x){paste0(directory,'/',x,'.csv')})
  for(file in file_vector){
    data=read.csv(file=file,header=T,stringsAsFactors=F)
    data=(data[,(which(colnames(data)==pollutant))])#extracting chosen pollutant
    data=data[(!is.na(data))]
    pollutant_data=c(pollutant_data,data)
  }
  return(mean(pollutant_data))#taking mean
}
#pollutantmean(directory='specdata',pollutant='nitrate',id=23)
#rm(list=ls())

