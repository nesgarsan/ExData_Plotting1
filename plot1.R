## Read data from working directory
PowerConsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")

##Convert column Date as Date Type
PowerConsumption$Date <- as.Date(PowerConsumption$Date,format="%d/%m/%Y")

# Filter data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
SubsetPowerConsumption <- subset(PowerConsumption, Date %in% dates)

##Construct the plot 
png("plot1.png", width=480, height=480)

with(SubsetPowerConsumption,hist(Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red"))
dev.off()