##Read in full data set from specific location on my computer
full_data <- read.table("~/Coursera/Data Science JHU/004 Exploratory Data Analysis/Week 1 Course Project/household_power_consumption.txt", 
                        header = TRUE, sep = ";")

##Subset this data to get the two days of interest
plot_data <- subset(full_data, Date=="1/2/2007" | Date=="2/2/2007")

##Convert the dates/times to proper R dates/times
plot_data$Date <- as.Date(plot_data$Date, "%d/%m/%Y")
plot_data$rawDateTime <- paste(plot_data$Date, plot_data$Time, sep = " ")
plot_data$datetime <- strptime(plot_data$rawDateTime, "%Y-%m-%d %H:%M:%S")

##Convert the power data from character to numeric
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)

##Create a histogram and write it to a PNG file 
png(filename = "~/Coursera/Data Science JHU/004 Exploratory Data Analysis/Week 1 Course Project/ExData_Plotting1/plot1.PNG", width = 480, height = 480, units = "px") 
hist(plot_data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()