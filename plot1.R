data=read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings= "?")

plot1<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 



png("plot1.png", width = 480, height = 480)

hist(sub$Global_active_power, type="l", main="Global Active Power",col="red",ylab= "Frequency", xlab="Global Active Power (kilowatts)")

dev.off()
