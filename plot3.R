##Project1 Exploratory Data Analysis

##Read data from file
electric_table<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

##Select only data which date is between 1/2/2007 and 2/2/2007
electric_select<-subset(electric_table,Date=="1/2/2007"|Date=="2/2/2007")

##Change date format and combine date&time
electric_select[,1]<-as.Date(electric_select[,1],format="%d/%m/%Y")
electric_select[,10]<-as.POSIXct(paste(electric_select$Date, electric_select$Time), format="%Y-%m-%d %H:%M:%S")

##Change data type from factor to numeric
electric_select[,7]<-as.numeric(as.character(electric_select[,7]))
electric_select[,8]<-as.numeric(as.character(electric_select[,8]))

##Plot png file
png(file="plot3.png",width = 480, height = 480)
plot(electric_select[,10],electric_select[,7],type="l",ylab="Energy sub metering",col="black",lty=1,lwd=2.5,xlab="")
lines(electric_select[,10],electric_select[,8],type="l",col="red",lty=1,lwd=2.5)
lines(electric_select[,10],electric_select[,9],type="l",col="blue",lty=1,lwd=2.5)
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), 
       lwd=c(2.5,2.5,2.5),
       col=c("black","red","blue"))
dev.off()