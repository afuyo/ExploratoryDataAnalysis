source("loadData.r")
## Find indices which match Motor vehicle Emissions in SCC 
pattern = "mobile - on-road"
i<-grep(pattern, SCC$EI.Sector, ignore.case=TRUE) 

##Get unique codes for  Vehicle Emissions
uSCC<-unique(SCC[i,1])
counties<-as.factor(c("24510","06037"))

##Get subset of NEI and aggregate Emissions by year in Baltimore City and Los Angeles County
df<-aggregate(Emissions ~year+fips, data=subset(NEI,SCC %in% uSCC & fips %in% counties) ,sum)
df$county<-ifelse(df$fips=="24510","Baltimore","LosAngeles")
df$county<-as.factor(df$county)

##Plot

g<-ggplot(df,aes(x=year,y=Emissions,col=county),xlab="Year", ylab="Emissions")
plot6<-g+geom_point()+geom_line()+ggtitle("Motor Vehicle Emissions Comparison")

ggsave(plot=plot6,file="plot6.png",width = 5,height = 4)