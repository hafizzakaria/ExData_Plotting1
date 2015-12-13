setwd("D:/Data Science/4. Exploratory Data Analysis/Week 1")
if(!file.exists('exdata_data_household_power_consumption.zip')){
  url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  
  download.file(url,destfile = "exdata_data_household_power_consumption.zip")
}
unzip("exdata_data_household_power_consumption.zip")
data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")
names(data)
lapply(data, class)

#Concatenating Date and Time
data$DateTime<-paste(data$Date, data$Time) 

#Change DateTime to yyyy-mm-dd hh:mm:ss
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

#Select needed data
start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
focuseddata<-data[start:end,]

#Creating histogram
hist(as.numeric(as.character(focuseddata$Global_active_power)), main="Global Active Power",
     xlab="Global Active Power (in kilowatts)", col="red")

#Creating PNG file
dev.copy(png, file = "Plot1.png")
dev.off()