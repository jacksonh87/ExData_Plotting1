##Read in full data set from specific location on my computer
data_URL <- paste("~/Coursera/Data Science JHU/004 Exploratory Data Analysis/",
                  "Week 1 Course Project/household_power_consumption.txt", sep = "")
full_data <- read.table(data_URL, header = TRUE, sep = ";")

##Subset this data to get the two days of interest
plot_data <- subset(full_data, Date=="1/2/2007" | Date=="2/2/2007")

##Convert the dates to proper R dates
plot_data$Date <- as.Date(plot_data$Date, "%d/%m/%Y")

##Create a new column which incorporates date and time
plot_data$rawDateTime <- paste(plot_data$Date, plot_data$Time, sep = " ")

##Convert this column from character to POSIXlt
plot_data$datetime <- strptime(plot_data$rawDateTime, "%Y-%m-%d %H:%M:%S")

##Convert the power data from character to numeric
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)

##Plot a line graph and write it to a PNG file 
output_URL <- paste("~/Coursera/Data Science JHU/004 Exploratory Data Analysis/",
                    "Week 1 Course Project/ExData_Plotting1/plot2.PNG", sep = "")
png(output_URL, width = 480, height = 480, units = "px") 
with(plot_data, plot(datetime, Global_active_power, type="l", 
                     ylab = "Global Active Power (kilowatts)",
                     xlab = ""))
dev.off()


