#reading archive
hpc = read.table("hpc.txt",header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#merge Date and Time
hpc$DateTime = strptime(paste(hpc$Date, hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#filter two days
hpc = subset(hpc, DateTime >= "2007-02-01 00:00:00" & DateTime <= "2007-02-02 23:59:59")

#table - 4 plots
par(mfrow= c(2,2))

png("plot4.png", width=480, height=480)

#plot1
plot(hpc$DateTime, hpc$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

#plot2
plot(hpc$DateTime, hpc$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#plot3
plot(hpc$DateTime, hpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(hpc$DateTime, hpc$Sub_metering_2, type = "l", col = "red")
points(hpc$DateTime, hpc$Sub_metering_3, type = "l", col = "blue")
lg = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
cl = c("black", "red", "blue")
legend("topright", col = cl, legend = lg, lty='solid', bty = "n")

#plot4
plot(hpc$DateTime, hpc$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

#close device
dev.off()
