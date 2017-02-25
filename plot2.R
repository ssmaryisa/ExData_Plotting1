#reading archive
hpc = read.table("hpc.txt",header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#merge Date and Time
hpc$DateTime = strptime(paste(hpc$Date, hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#filter two days
hpc = subset(hpc, DateTime >= "2007-02-01 00:00:00" & DateTime <= "2007-02-02 23:59:59")

#plot
png("plot2.png", width=480, height=480)
plot(hpc$DateTime, hpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#close device
dev.off()
