complete=function(directory,id=1:332){
  nobs=NULL
  file_vector=sapply(sprintf('%03d',id),FUN=function(x){paste0(directory,'/',x,'.csv')})
  for(file in file_vector){
    data=read.csv(file=file,header=T,stringsAsFactors=F)
    nobs=c(nobs,sum(complete.cases(data)))
  }
  output=data.frame(cbind(id,nobs))
  return(output)
}
#complete("specdata", 30:25)
#rm(list=ls())



