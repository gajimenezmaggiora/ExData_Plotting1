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
png('./plot2.png')

# Plot chart
with(data2, plot(DateTime, Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)'))

# Close png device
dev.off()
