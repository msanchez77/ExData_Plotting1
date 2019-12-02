# 2,075,259 rows * 9 columns * 8 bytes/num
# = 149,418,648 bytes
# 149,418,648 / 2^20 bytes/MB
# 142.50 MB

electric <- read.table("./data/household_power_consumption.txt", sep = ";", skip = grep("31/1/2007;23:59:00", readLines("./data/household_power_consumption.txt")), nrows = 2880, colClasses = c("character", "character", rep("numeric", 7)))

names(electric) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

electric <- replace(electric, electric == "?", NA)

electric$Date <- as.Date(electric$Date)
electric$Time <- strptime(electric$Time, format = "%H:%M:%S")


plot(electric$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

dev.copy(png, file = "./Course_Project1/ExData_Plotting1/plot2.png")
dev.off()