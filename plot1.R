# Check to see if source file exists
if(!file.exists('./household_power_consumption.txt')) {
  stop('Source file not found.')
}

# Read source file
data<-read.table('./household_power_consumption.txt', sep=';', header=T, na.strings='?')

# Convert date
data$Date<-strptime(data$Date,format='%d/%m/%Y')

# Subset data
data2<-data[(format(data$Date,'%d%m%Y')=='01022007' | format(data$Date,'%d%m%Y')=='02022007'), ]

# Open png device
png('./plot1.png')

# Plot histogram
hist(data2$Global_active_power, col='red', xlab='Global Active Power (kilowats)', main = 'Global Active Power')

# Close png device
dev.off()
