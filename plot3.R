#Plot 3 Script

png("plot3.png", width=480, height=480)
par(mfrow=c(1,1),mar=c(4,4,4,2))
plot(hpconsumption$Time,hpconsumption$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(hpconsumption$Time,hpconsumption$Sub_metering_2, col="red", type="l")
points(hpconsumption$Time,hpconsumption$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(hpconsumption[,7:9]))
dev.off()