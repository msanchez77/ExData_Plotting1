# 2,075,259 rows * 9 columns * 8 bytes/num
# = 149,418,648 bytes
# 149,418,648 / 2^20 bytes/MB
# 142.50 MB

electric <- read.table("./data/household_power_consumption.txt", sep = ";", skip = grep("31/1/2007;23:59:00", readLines("./data/household_power_consumption.txt")), nrows = 2880, colClasses = c("character", "character", rep("numeric", 7)))

names(electric) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

electric <- replace(electric, electric == "?", NA)

electric$Date <- as.Date(electric$Date)
electric$Time <- strptime(electric$Time, format = "%H:%M:%S")

with(electric, points(electric$Sub_metering_1, col = "black", type = "l"))
with(electric, plot(electric$Sub_metering_1, xlab = "", ylab = "Energy sub metering", xaxt = "n", yaxt = "n", type = "n"))
with(electric, points(electric$Sub_metering_1, col = "black", type = "l"))
with(electric, points(electric$Sub_metering_2, col = "red", type = "l"))
with(electric, points(electric$Sub_metering_3, col = "blue", type = "l"))
legend("topright", lwd = 2, lty = c(1,1,1), pch = c(NA, NA, NA), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at = c(0, 10, 20, 30), labels = c(0, 10, 20, 30))

dev.copy(png, file = "./Course_Project1/ExData_Plotting1/plot3.png")
dev.off()