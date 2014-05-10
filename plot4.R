#Read datasets from textfile
data=read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings= "?")

#subset datasets from origin.
plot4<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Changing the class of Date variable.
plot4$Date <- as.Date(plot3$Date, format = "%d/%m/%Y")

#Combining Date and Time to one variable.
plot4$DateTime <- as.POSIXct(paste(plot3$Date, plot3$Time))

# Creating the plot4
png("plot4.png", width = 480, height = 480)

#setting pallete layout.
par(mfcol=c(2,2))

plot(plot4$DateTime, plot4$Global_active_power, type="l", ylab= "Global Active Power", xlab="")

plot(plot4$DateTime, plot4$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(plot4$DateTime, plot4$Sub_metering_2, type="l", col="red")
lines(plot4$DateTime, plot4$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(plot4$DateTime,plot4$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(plot4$DateTime,plot4$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")

dev.off()