library(dplyr)
library(lubridate)
library(jsonlite)
if (getwd() != "/Users/mermer/Self-work/misc/DataAnalysis") {
  setwd("/Users/mermer/Self-Work/misc/DataAnalysis/")
}
jr = read.csv("jerusalem.csv")
hebdates = readLines(file("hebdates-jerusalem"))

names(jr) = c("stationname","stationnumber","date","maxtemp","mintemp","daylightdur")
jr$date=dmy(jr$date)
jr$maxtemp = as.numeric(as.character(jr$maxtemp))
jr$mintemp = as.numeric(as.character(jr$mintemp))
jr$hebdate = hebdates
by_date = group_by(jr, year = year(date), month = month(date))
by_hebdate = group_by(jr, year = year(date), month = hebdate)
sumbydate=summarize(by_hebdate, minmean = mean(mintemp, na.rm=T), maxmean = mean(maxtemp, na.rm=T))
sumbydate=mutate(sumbydate, avgtemp = (maxmean+minmean)/2)


main = function(month) {
	if (month == "all") {
		old.par = par(mfrow=c(4,4))
		for (x in 1:14) {
			processmonth(x)
		}
		par(mfrow=c(1,1))
	}
	else {
		processmonth(month)
	}
}

processmonth = function(m) {
	if (m == "today") {
		m = month(today())
	}
	months = c("Tishrei","Cheshvan","Kislev","Tevet","Sh'vat","Adar I","Adar","Adar II","Nisan","Iyyar","Sivan","Tamuz","Av","Elul")
	monthmean=select(filter(sumbydate, month == months[m]), mymean = avgtemp)
	monthmean = mutate(monthmean, tmean=mean(monthmean$mymean))
	monthmean = mutate(monthmean, diff=abs(tmean-mymean))

	plotdata(monthmean,months[m])
}

plotdata = function(monthmean, monthname){
	heading = paste("Average Tempratures of ",monthname,",",min(monthmean$year),"-",max(monthmean$year))
	plot(monthmean$year,monthmean$mymean,type="o", col="green", main=heading, ylab="Temp in �C", xlab="Year")
	lines(monthmean$year, monthmean$tmean, type="l", col="orange")
	par(new = T)
	plot(monthmean$year, monthmean$diff, col="red", type="h", axes = FALSE, bty = "n", xlab = "", ylab = "")
	
}

main("all")

calcheb = function(mydate) {
	myurl = paste("http://www.hebcal.com/converter/?cfg=json&gy=",year(mydate),"&gm=",month(mydate),"&gd=",day(mydate),"&g2h=1",sep="")
	fromJSON(myurl)$hm
}


