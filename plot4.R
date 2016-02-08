source("loadData.r")
## Find indices which match Coal Combustion in SCC 
pattern = "comb.*coal"
i<-grep(pattern, SCC$EI.Sector, ignore.case=TRUE) 

##Get unique codes for Coal Combustion
uSCC<-unique(SCC[i,1])

##Get subset of NEI and aggregate Emissions by year
df<-aggregate(Emissions ~year, data=subset(NEI,SCC %in% uSCC),sum)

##Plot
plot(df$year,df$Emissions, type="l",main="Coal Combustion Emissions in United States",xlab="Year",ylab="Emissions (in tons)")
dev.copy(png,"plot4.png")
dev.off()