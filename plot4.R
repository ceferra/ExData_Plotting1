
## read data
datos<-read.csv("household_power_consumption.txt",sep=";")

#filter data between ("2006-12-31") &&("2007-02-03"))
tam<-length(datos[,1])
k<-1
nd<-datos[1,]
for (i in 1:tam)
{
  fecha<-as.character(datos[i,1])
  print(i)
  fd<-as.Date(fecha, format="%d/%m/%Y")
  if (fd>as.Date("2007-01-31") && fd<as.Date("2007-02-03"))
  {
    nd[k,] <- datos[i,]
    k<-k+1
  }
}


save(nd,file="nd.Rdata")


png("plot4.png")


par(mfrow=c(2,2))
gg<-as.numeric(as.character(nd[,3]))

#plot1

plot(gg, type="l",ylab="Global Active Power(Kilowatts)",axes=FALSE, xlab="")
axis(2, at=c(0,2,4,6))
axis(1, at=c(0,1500,2880), labels=c("Thu", "Fri","Sat"))


#plot2

gg5<-as.numeric(as.character(nd[,5]))
plot(gg5, type="l",ylab="Voltage",xlab="datetime",axes=FALSE)
axis(2, at=c(234,238,242,246))
axis(1, at=c(0,1500,2880), labels=c("Thu", "Fri","Sat"))

#plot3

gg1<-as.numeric(as.character(nd[,7]))
gg2<-as.numeric(as.character(nd[,8]))
gg3<-as.numeric(as.character(nd[,9]))
plot(gg1, type="l",ylab="Energy sub metering",axes=FALSE, xlab="")
axis(2, at=c(0,10,20,30))
axis(1, at=c(0,1500,2880), labels=c("Thu", "Fri","Sat"))                
points(gg2,col="red", type="l")
points(gg3,col="blue", type="l")

methodsnames=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
colores<-c('black','red','blue')
legend('topright', methodsnames , lty=1, col=colores,cex=.75)

#plot4
gg4<-as.numeric(as.character(nd[,4]))
plot(gg4, type="l",ylab="Global_reactive_Power",xlab="datetime",axes=FALSE)
axis(2, at=c(0,0.1,0.2,0.3,0.4,0.5))
axis(1, at=c(0,1500,2880), labels=c("Thu", "Fri","Sat"))

dev.off()