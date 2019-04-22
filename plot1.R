library(ggplot2)
library(lubridate)
library(data.table)

main<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
main$Date<-as.Date(main$Date,format="%d/%m/%Y")
main$Time<-format(main$Time,format="%H:$M:%S")
main[,3]<-as.numeric(main[,3])
needed<-main[which(main$Date == "2007-02-01" | main$Date=="2007-02-02"),]

png("plot1.png",width=480,height=480)
hist(needed$Global_active_power,col = "red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()