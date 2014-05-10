#Read datasets from textfile
data=read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings= "?")

#subset datasets from origin.
plot3<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Changing the class of Date variable.
plot3$Date <- as.Date(plot3$Date, format = "%d/%m/%Y")

#Combining Date and Time to one variable.
plot3$DateTime <- as.POSIXct(paste(plot3$Date, plot3$Time))

# Creating the plot3
png("plot3.png", width = 480, height = 480)

plot(plot3$DateTime, plot3$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(plot3$DateTime, plot3$Sub_metering_2, type="l", col="red")
lines(plot3$DateTime, plot3$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

dev.off()