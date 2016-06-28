corr<-function(directory,threshold=0){
  #define output variable
  output<-numeric(length=0)
  #store data frame with file ids and number on complete data rows per file
  complete_data<-complete(directory)
  #extract ids from files which are over or equal threshold
  ids<-as.integer(complete_data["id"][complete_data["nobs"]>=threshold])
  
  for (counter in ids){
    if (file.exists(file.path(directory,paste(formatC(counter,width=3,flag=0),".csv",sep="")))){ 
    #read file
    my_file <- read.csv(file.path(directory,paste(formatC(counter,width=3,flag=0),".csv",sep="")), header = TRUE)
    #append to data frame
    my_data<-data.frame(my_file)
    #store only the data with complete data rows
    complete_data<-as.data.frame(my_data[!is.na(my_data["sulfate"])&!is.na(my_data["nitrate"]),])
    #append the correlation to the cor-vector
    output<-c(output,cor(complete_data["nitrate"],complete_data["sulfate"]))  
  }
  }
  output
}