# read the data from row 66638 which is the date 2007-02-01
# the number of observers per day are 1440 which is why we are going to read on ahead the next 2880 rows of data
# use na,string to sets na to ?
Data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880,sep = ";", na.strings="?",col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))
# convert Data$Date and Data$Time to characters
Data$Date <- as.character(Data$Date)
Data$Time <- as.character(Data$Time)
# join date and time by paste function and use strptime function to arranged the desired format
Data$DateTime <- strptime(paste(Data$Date, Data$Time),format="%d/%m/%Y %H:%M:%S")
# plot histogram and save the picture in png format
hist(Data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",breaks=12)
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
                   