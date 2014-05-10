#Read datasets from textfile
data=read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings= "?")

#subset datasets from origin.
plot2<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Changing the class of Date variable from character to Date: 
plot2$Date <- as.Date(plot2$Date, format = "%d/%m/%Y")
# Combining the Date and Time variable and creating a new column in dataset named "DateTime":
plot2$DateTime <- as.POSIXct(paste(plot2$Date, plot2$Time))

#Plotting 2nd graph.

#In case you're using another language system(e.g. Korean, Spanish, etc), you have to change your system locale in order to plot English weekdays.
Sys.setlocale(category = "LC_TIME", locale = "C")

png("plot2.png", width = 480, height = 480)

with(plot2,plot(DateTime,Global_active_power, type="l",xact="n", ylab= "Global Active Power(kilowatts)", xlab=""))

dev.off()