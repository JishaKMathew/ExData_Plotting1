#Plot 3 Script

# Read Data
# Download and prepare the dataset

fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile=paste0(getwd(),"/Power_consumption.zip"),method = "curl")
unzip("Power_consumption.zip",exdir="C:/Users/Jisha Kalayil/Documents/R/Exercises/ExData_Plotting1")

# Read the headers

rawdataheaders<-read.table("household_power_consumption.txt", header=TRUE,sep=";", nrows=5)

#Read the required data
consumption<-read.table("household_power_consumption.txt", header=TRUE,sep=";", skip=66630, 
                        nrows=2900, col.names=names(rawdataheaders), na.strings=c("?"),
                        colClasses=c("character", "character","numeric","numeric","numeric","numeric",
                                     "numeric","numeric","numeric"))

# Convert Date Time Variables

consumption$Date<-as.Date(consumption$Date, format = "%d/%m/%Y")
consumption$Time<-strptime(paste(consumption$Date,consumption$Time),"%F %T")

#Get the data for 2007-02-01 and 2007-02-02
hpconsumption<-subset(consumption,consumption$Date %in% as.Date(c("2007-02-01","2007-02-02")))

# Generate the plot and create the png

png("plot3.png", width=480, height=480)
par(mfrow=c(1,1),mar=c(4,4,4,2))
plot(hpconsumption$Time,hpconsumption$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(hpconsumption$Time,hpconsumption$Sub_metering_2, col="red", type="l")
points(hpconsumption$Time,hpconsumption$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(hpconsumption[,7:9]))
dev.off()