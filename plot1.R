file<-read.csv("household_power_consumption.txt",na.string="?",sep=";") ## read the file 
df<-file[(file$Date=="1/2/2007"|file$Date=="2/2/2007"),] ## create a data frame with the data wanted
rm(file) ## remove the file

dateTime<-strptime(paste(df$Date,df$Time),"%e/%m/%Y %H:%M:%S") ## create a DateTime vector
df$dateTime<-dateTime ## insert a DateTime column into the data frame

## Plot1
png("plot1.png",  width = 480, height = 480, units = "px") ## set the resolution and name file

with(df,hist(Global_active_power,col="red",main="Global Active Power",  
             xlab="Global Active Power (kilowatts)",
             ylim=c(0,1200))) ## Plot to the png file 

dev.off() ## close the PNG device!