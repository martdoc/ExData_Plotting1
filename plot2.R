plot2 <- function(){
  
  data<-read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?" )
  
  data[,1]<-as.Date(data[,1],format="%d/%m/%Y")
  condition <- data[,1]=="2007-02-01" | data[,1]=="2007-02-02"  
  data_clear <- data[condition,]
  rm(data)
  
  data_and_time <- paste(data_clear[,1], data_clear[,2])
  data_and_time <- strptime(data_and_time, format="%Y-%m-%d %H:%M:%S")
  
  png(filename = "plot2.png")
  plot(data_and_time, data_clear$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
  
  # ATTENTION!!! Polish names of the days of week.
  
}





