# Check to see if source file exists
if(!file.exists('./household_power_consumption.txt')) {
  stop('Source file not found.')
}

# Read source file
data<-read.table('./household_power_consumption.txt', sep=';', header=T, na.strings='?')

# Convert date and time to timestamp
data$DateTime<-as.POSIXlt(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S')

# Subset data
data2<-data[(format(data$DateTime,'%d%m%Y')=='01022007' | format(data$DateTime,'%d%m%Y')=='02022007'), ]

# Open png device
png('./plot1.png')

# Plot histogram
hist(data2$Global_active_power, col='red', xlab='Global Active Power (kilowats)', main = 'Global Active Power')

# Close png device
dev.off()
