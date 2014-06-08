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
# plot data
png("plot2.png")
par(mfcol = c(1, 1))
plot(Data_sub$DateTime,
     Data_sub$Global_active_power,
     type = "l",
     xlab = " ",
     ylab = "Global Active Power (kilowatts)")
dev.off()
