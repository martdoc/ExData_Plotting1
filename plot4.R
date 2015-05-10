plot4 <- function(){
  
  data<-read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?" )
  
  data[,1]<-as.Date(data[,1],format="%d/%m/%Y")
  condition <- data[,1]=="2007-02-01" | data[,1]=="2007-02-02"  
  data_clear <- data[condition,]
  rm(data)
  
  data_and_time <- paste(data_clear[,1], data_clear[,2])
  data_and_time <- strptime(data_and_time, format="%Y-%m-%d %H:%M:%S")
  
  png(filename = "plot4.png")
  par(mfcol=c(2,2))
  
  plot(data_and_time, data_clear$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  plot(data_and_time, data_clear[,7], type="n", xlab="", ylab="Energy sub metering")
    points(data_and_time, data_clear[,7], type="l", col="black")
    points(data_and_time, data_clear[,8], type="l", col="red")
    points(data_and_time, data_clear[,9], type="l", col="blue")
    legend("topright", bty="n",  pch="-", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(data_and_time, data_clear$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(data_and_time, data_clear$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  par(mfcol=c(1,1))
  dev.off()
  
  # ATTENTION!!! Polish names of the days of week.
  
}



