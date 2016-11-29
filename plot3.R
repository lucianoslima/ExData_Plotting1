file<-read.csv("household_power_consumption.txt",na.string="?",sep=";") ## read the file 
df<-file[(file$Date=="1/2/2007"|file$Date=="2/2/2007"),] ## create a data frame with the data wanted
rm(file) ## remove the file

dateTime<-strptime(paste(df$Date,df$Time),"%e/%m/%Y %H:%M:%S") ## create a DateTime vector
df$dateTime<-dateTime ## insert a DateTime columm ninto the data frame

## Plot3
png("plot3.png",  width = 480, height = 480, units = "px") ## set the resolution and name file

with(df,plot(dateTime,Sub_metering_1,type="l",
             ylab="Energy sub metering",xlab="")) ## plot submetering1
with(df,points(dateTime,Sub_metering_2,
               type="l",col="red")) ## add submetering2
with(df,points(dateTime,Sub_metering_3,
               type="l",col="blue")) ## add submetering3
legend("topright",lty="solid",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       xjust=0,yjust=0) ## add legend

dev.off() ## close the PNG device!

