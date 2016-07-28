##Read in full data set from specific location on my computer
data_URL <- paste("~/Coursera/Data Science JHU/004 Exploratory Data Analysis/",
                  "Week 1 Course Project/household_power_consumption.txt", sep = "")
full_data <- read.table(data_URL, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

##Subset this data to get the two days of interest
plot_data <- subset(full_data, Date=="1/2/2007" | Date=="2/2/2007")

##Convert the dates to proper R dates
plot_data$Date <- as.Date(plot_data$Date, "%d/%m/%Y")

##Create a new column which incorporates date and time
plot_data$rawDateTime <- paste(plot_data$Date, plot_data$Time, sep = " ")

##Convert this column from character to POSIXlt
plot_data$datetime <- strptime(plot_data$rawDateTime, "%Y-%m-%d %H:%M:%S")

##Convert the relevant data from character to numeric
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)
plot_data$Sub_metering_1 <- as.numeric(plot_data$Sub_metering_1)
plot_data$Sub_metering_2 <- as.numeric(plot_data$Sub_metering_2)
plot_data$Sub_metering_3 <- as.numeric(plot_data$Sub_metering_3)

##Plot a line graph and write it to a PNG file 

#Set up file and initialise plot with no lines
output_URL <- paste("~/Coursera/Data Science JHU/004 Exploratory Data Analysis/",
                    "Week 1 Course Project/ExData_Plotting1/plot3.PNG", sep = "")
png(output_URL, width = 480, height = 480, units = "px") 
with(plot_data, plot(datetime, Sub_metering_1, type = "n", lty = 1, lwd = 1,
       ylab = "Energy sub metering", xlab = ""))

#Draw lines on the plot
with(plot_data, lines(datetime, Sub_metering_1, lty=1, lwd=1))
with(plot_data, lines(datetime, Sub_metering_2, lty=1, lwd=1, col = "red"))
with(plot_data, lines(datetime, Sub_metering_3, lty=1, lwd=1, col = "blue"))

#Add the legend to the plot
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, col=c("black","red","blue"))

dev.off()


