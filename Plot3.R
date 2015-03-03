### title: "Plot3.R"
### author: "JCFrench"
### date: "Monday, March 2, 2015"
### Course: exdata-012
### CourseName: Exploratory Data Analysis

### lubridate is the easiest way to handle dates.
library(lubridate)

### Read the data file
hpc <- read.csv("~/data/ExData/exdata-data-household_power_consumption/household_power_consumption.txt", 
                sep=";", na.strings="?", stringsAsFactors=F)

### Select only observations from 2007-02-01 or 2007-02-02
hpcs <- hpc[dmy(hpc$Date) %in% c(ymd("2007-02-01"), ymd("2007-02-02")),]

###calculate datetime
hpcs$datetime <- dmy(hpcs$Date)+hms(hpcs$Time)

### Establish a png graphics device for export. Defaults match assignment spec.
png("~/data/ExData/ExData_Plotting1/Plot3.png")

### Plot Linear model of Energy sub metering over time.
plot(hpcs$datetime,hpcs$Sub_metering_1,
     type="l",
     main="",
     xlab="",
     ylab="Energy sub metering" 
     )
lines(hpcs$datetime,hpcs$Sub_metering_2,
      col="red")
lines(hpcs$datetime,hpcs$Sub_metering_3,
      col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))

### Close graphics device.
dev.off()