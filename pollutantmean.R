pollutantmean <- function (directory, pollutant, id = 1:332) {
  #define data frame
  my_data<-data.frame()
  #iterate through alls csv files
  for (counter in id){
    if (file.exists(file.path(directory,paste(formatC(counter,width=3,flag=0),".csv",sep="")))){ 
    #read file
    my_file <- read.csv(file.path(directory,paste(formatC(counter,width=3,flag=0),".csv",sep="")), header = TRUE)
    #append to data frame
    my_data<-rbind(my_data,data.frame(my_file))
    }
  }
  #calculate output
  output<-mean(my_data[,pollutant],na.rm=TRUE)
  #output
  output
  
}