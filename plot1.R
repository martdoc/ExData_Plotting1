plot1 <- function(){
  
  data<-read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?" )
  
  data[,1]<-as.Date(data[,1],format="%d/%m/%Y")
  condition <- data[,1]=="2007-02-01" | data[,1]=="2007-02-02"  
  data_clear <- data[condition,]
  rm(data)
  
  png(filename = "plot1.png")
  hist(data_clear$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
  
}
