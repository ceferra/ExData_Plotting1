
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

#plot1
png("plot1.png")
gg<-as.numeric(as.character(nd[,3]))
hist(gg,main="Global Active Power",xlab="Global Active Power(Kilowatts)",col="red")
dev.off()