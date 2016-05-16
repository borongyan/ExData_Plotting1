# # download and unzip data
setwd('C:/Users/meng/ExData_Plotting1')
fileUrl <-
        'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './household_power_consumption.zip')
unzip('./household_power_consumption.zip', exdir = './')

# read data into R
files <- file('./household_power_consumption.txt')
data <-
        read.table(
                text = grep("^[1,2]/2/2007",readLines(files),value = TRUE), sep = ';', col.names = c(
                        "Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
                ), na.strings = '?'
        )

# Plot 1
# open device
if (!file.exists('plot1_figures'))
        dir.create('plot1_figures')
png(
        filename = './plot1_figures/plot1.png', width = 480, height = 480, units = 'px'
)
# plot figure
with(
        data, hist(
                Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'
        )
)
# close device
dev.off()

