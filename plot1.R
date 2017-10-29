##Project1 Exploratory Data Analysis

##Read data from file
electric_table<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

##Select only data which date is between 1/2/2007 and 2/2/2007
electric_select<-subset(electric_table,Date=="1/2/2007"|Date=="2/2/2007")

##Change date format and combine date&time
electric_select[,1]<-as.Date(electric_select[,1],format="%d/%m/%Y")
electric_select[,10]<-as.POSIXct(paste(electric_select$Date, electric_select$Time), format="%Y-%m-%d %H:%M:%S")

##Change data type from factor to numeric
electric_select[,3]<-as.numeric(as.character(electric_select[,3]))

##Plot png file
png(file="plot1.png",width = 480, height = 480)
hist(electric_select$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()