# read the data set
Data = read.table("household_power_consumption.txt",
                  header = TRUE,
                  sep = ";",
                  na.strings = "?",
                  colClasses = c("character", "character", rep("real", 7)))

# re-format the date and segregated interested date interval
Data$Date = as.Date(Data$Date, "%d/%m/%Y")
Data_sub = subset(Data, Data$Date %in% as.Date(c("2007-02-01", "2007-02-02")))
Data$DateTime <- as.POSIXct(paste(Data$Date, Data$Time), format = "%Y-%m-%d %H:%M:%S")

# set the time system to the standard English local time
Sys.setlocale("LC_TIME", "English")
png("plot4.png")
# created a 2x2 blank canvas and plot down 4 data sets
par(mfcol = c(2, 2))
plot(Data_sub$DateTime,
     Data_sub$Global_active_power,
     type = "l",
     xlab = " ",
     ylab = "Global Active Power")

plot(Data_sub$DateTime,
     Data_sub$Sub_metering_1,
     type = "l",
     xlab = " ",
     ylab = "Energy sub metering")
lines(Data_sub$DateTime,
      Data_sub$Sub_metering_2,
      col = "Red")
lines(Data_sub$DateTime,
      Data_sub$Sub_metering_3,
      col = "Blue")
legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("Black", "Red", "Blue"),
       lwd = 1, pt.cex = 0.6, cex = 0.6, bty = "n")

plot(Data_sub$DateTime,
     Data_sub$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

plot(Data_sub$DateTime,
     Data_sub$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
