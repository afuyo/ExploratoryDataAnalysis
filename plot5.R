source("loadData.r")
## Find indices which match Motor vehicle Emissions in SCC 
pattern = "mobile - on-road"
i<-grep(pattern, SCC$EI.Sector, ignore.case=TRUE) 

##Get unique codes for  Vehicle Emissions
uSCC<-unique(SCC[i,1])

##Get subset of NEI and aggregate Emissions by year in Baltimore City
df<-aggregate(Emissions ~year, data=subset(NEI,SCC %in% uSCC & fips=="24510"),sum)

##Plot
plot(df$year,df$Emissions, type="l",main="Motor Vehicle Emissions in Baltimore City",xlab="Year",ylab="Emissions (in tons)")
dev.copy(png,"plot5.png")
dev.off()