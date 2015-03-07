library(sqldf)
library(plyr)
library(dplyr)

print("cleanup variables before starting")
rm(list = ls())
print("Reading data file")
file <- c("household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

##Close all open connections
closeAllConnections()
print(showConnections(all = TRUE))

## Paste date and time columns in one column 
print("Transform date and time columns ")
d_dt <- as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%d/%m/%Y %H:%M:%S")
d1 <- cbind(d_dt, data_subset[3:9])
colnames(d1)[1] <- "Date"
print(names(d1))

##print plot 3
## open device to write to png file
print("Opening device for printing")
png(filename = "plot3.png", width = 480, height = 480, units = "px")

print("Plotting frequency graph")
plot(d1$Date, d1$Sub_metering_1, xlab ="", ylab = "Energy sub metering", type = "n",)
legend('topright', legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty=1, col=c('black', 'red', 'blue'), bty='n', cex=.75)
points(d1$Date, d1$Sub_metering_1, type = "l", col = "black")
points(d1$Date, d1$Sub_metering_2, type = "l", col = "red")
points(d1$Date, d1$Sub_metering_3, type = "l", col = "blue")
print("closing device")
dev.off()