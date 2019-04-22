library(ggplot2)
library(lubridate)

main<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
main$Date<-as.Date(main$Date,format="%d/%m/%Y")
main$Time<-format(main$Time,format="%H:$M:%S")
main[,3]<-as.numeric(main[,3])
needed<-main[which(main$Date == "2007-02-01" | main$Date=="2007-02-02"),]
needed$timeanddate<-strptime(paste(needed$Date,needed$Time,sep=" "),"%Y-%m-%d %H:%M:%S")

png("plot2.png",width=480,height=480)
plot(needed$timeanddate,needed$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

