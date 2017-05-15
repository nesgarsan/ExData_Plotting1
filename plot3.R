## Read data from working directory
PowerConsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")

##Convert Time column as POSIXlt format and Date column as Date Type
PowerConsumption$Time <- strptime(paste(PowerConsumption$Date, PowerConsumption$Time), format="%d/%m/%Y %H:%M:%S")  
PowerConsumption$Date <- as.Date(PowerConsumption$Date,format="%d/%m/%Y")

# Filter data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
SubsetPowerConsumption <- subset(PowerConsumption, Date %in% dates)

##Construct the plot 
png("plot3.png", width=480, height=480)
with(SubsetPowerConsumption,plot(Time,Sub_metering_1,xlab="",ylab="Energy sub metering",type = "n"))
with(SubsetPowerConsumption, lines(Time,Sub_metering_1, col = "black"))
with(SubsetPowerConsumption, lines(Time,Sub_metering_2, col = "red"))
with(SubsetPowerConsumption, lines(Time,Sub_metering_3, col = "blue"))
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()

