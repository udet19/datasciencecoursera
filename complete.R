complete<-function(directory,id=1:332){
  #define variables
  output<-data.frame()

  
  for (counter in id){
    if (file.exists(file.path(directory,paste(formatC(counter,width=3,flag=0),".csv",sep="")))){ 
    #read file
    my_file <- read.csv(file.path(directory,paste(formatC(counter,width=3,flag=0),".csv",sep="")), header = TRUE)
    
    #append to data frame
    my_data<-data.frame(my_file)
    
    #filter complete rows
    complete_data<-my_data[!is.na(my_data["sulfate"])&!is.na(my_data["nitrate"]),]["ID"]
    
    #create output
    output<-rbind(output,c(counter,nrow(complete_data)))
    }
  }
  
  #name columns
  names(output)<-c("id","nobs")
  
  output
}