setwd("C:/Users/John/Desktop/National-Emissions-Inventory-database-")
library("ggplot2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


baltimoreNEI <- subset(NEI, NEI$fips == "24510" & NEI$type=="ON-ROAD")
balmore_annual <- aggregate(Emissions ~ year, baltimoreNEI, sum)
years <- unique(baltimoreNEI$year)
ggp <- ggplot(balmore_annual, aes(factor(year), Emissions)) +
  geom_bar(aes(fill=year), stat="identity",width=0.75) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="Year", y=expression("Total emission of PM2.5 (Tons)")) + 
  labs(title=expression("PM2.5 emissions from Motor Vehicle Source in the Baltimore City, Maryland"))

print(ggp)


dev.copy(png, "plot5.png",
         width  = 480,
         height = 480)

dev.off()

rm(list = ls())