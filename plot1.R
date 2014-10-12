#I have already downloaded the data set file and changed its name into "Project1.txt"
#Read the data set
power <- read.table("project1.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#We will only be using data from the dates 2007-02-01 and 2007-02-02.
power$Date <- as.Date(power$Date, format = "%d/%m/%y")
data <- subset(power, Date >= "1/2/2007" | Date <= "2/2/2007")

#Convert the Date and Time variables to Date/Time classes
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##Draw the plot1
png("plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power, type = "1", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col = "red")
dev.off()
