#Read datasets from textfile
data=read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings= "?")

#subset datasets from origin.
plot1<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 


#let's do some graphic work

png("plot1.png", width = 480, height = 480)

hist(plot1$Global_active_power, main="Global Active Power",col="red",ylab= "Frequency", xlab="Global Active Power(kilowatts)")

dev.off()