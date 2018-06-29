corr=function(directory,threshold=0){
  cor_val=NULL
  source('complete.R')
  data=complete(directory)
  id=data[(data$nobs>threshold),]$id
  if(length(id)==0){
    return(numeric())
  }
  else{
    file_vector=sapply(sprintf('%03d',id),FUN=function(x){paste0(directory,'/',x,'.csv')})
    for(file in file_vector){
      obs=read.csv(file=file,header=T,stringsAsFactors=F)
      obs=obs[complete.cases(obs),]
      val=cor(obs$sulfate,obs$nitrate)
      cor_val=c(cor_val,val)
    }
    return(cor_val)
  }
}
#cr <- corr("specdata")
#summary(cr)
  
  
  

