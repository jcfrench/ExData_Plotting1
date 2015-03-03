### title: "Plot1.R"
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

###datetime not needed for plot 1
###hpcs$datetime <- dmy(hpcs$Date)+hms(hpcs$Time)

### Establish a png graphics device for export. Defaults match assignment spec.
png("~/data/ExData/ExData_Plotting1/Plot1.png")

### Generate the "Global Active Power" Histogram
hist(hpcs$Global_active_power,
     freq=T,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency",
     ylim=c(0,1200))

### Close graphics device
dev.off()