##Read in full data set from specific location on my computer
full_data <- read.table("~/Coursera/Data Science JHU/004 Exploratory Data Analysis/Week 1 Course Project/household_power_consumption.txt", header = TRUE, sep = ";")

##Subset this data to get the two dates of interest
plot_data <- subset(full_data, Date=="1/2/2007" | Date=="2/2/2007")
plot_data$Date <- as.Date(plot_data$Date, "%d/%m/%Y")
plot_data