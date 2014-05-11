
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

gg<-as.numeric(as.character(nd[,3]))

#plot2
png("plot2.png")
plot(gg, type="l",ylab="Global Active Power(Kilowatts)",axes=FALSE, xlab="")
axis(2, at=c(0,2,4,6))
axis(1, at=c(0,1500,2880), labels=c("Thu", "Fri","Sat"))
dev.off()