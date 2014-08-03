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
png('./plot3.png')

# Add plot
plot(data2$DateTime, data2$Sub_metering_1, type='l', title=NULL, xlab='', ylab='Energy sub metering')

# Add second time series
lines(data2$DateTime, data2$Sub_metering_2, type='l', col='red')

# Add third time series
lines(data2$DateTime, data2$Sub_metering_3, type='l', col='blue')

# Add legend
legend("topright",legend=colnames(data2)[7:9], lty=1, lwd=1, col=c('black','red','blue'))

# Close png device
dev.off()

