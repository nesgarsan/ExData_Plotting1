## Read data from working directory
PowerConsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")

##Convert Time column as POSIXlt format and Date column as Date Type
PowerConsumption$Time <- strptime(paste(PowerConsumption$Date, PowerConsumption$Time), format="%d/%m/%Y %H:%M:%S")  
PowerConsumption$Date <- as.Date(PowerConsumption$Date,format="%d/%m/%Y")

# Filter data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
SubsetPowerConsumption <- subset(PowerConsumption, Date %in% dates)

##Construct the plot 
png("plot4.png", width=480, height=480)

##Divide device in 4 segments(2 rows, 2 columns)
par(mfrow=c(2,2))

## Plot1
with(SubsetPowerConsumption,plot(Time,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

## Plot2
with(SubsetPowerConsumption,plot(Time,Voltage,type="l",xlab="datetime",ylab="Voltage"))

## Plot3

with(SubsetPowerConsumption,plot(Time,Sub_metering_1,xlab="",ylab="Energy sub metering",type = "n"))
with(SubsetPowerConsumption,lines(Time,Sub_metering_1, col = "black"))
with(SubsetPowerConsumption,lines(Time,Sub_metering_2, col = "red"))
with(SubsetPowerConsumption,lines(Time,Sub_metering_3, col = "blue"))
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

## Plot4
with(SubsetPowerConsumption,plot(Time,Global_reactive_power,xlab="datetime", ylab="Global_reactive_power",type = "n"))
with(SubsetPowerConsumption,lines(Time,Global_reactive_power))

dev.off()

