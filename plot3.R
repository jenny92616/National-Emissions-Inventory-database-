setwd("C:/Users/John/Desktop/National-Emissions-Inventory-database-")
library("ggplot2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimoreNEI <- subset(NEI, NEI$fips == "24510")
baltimore <- aggregate(Emissions ~ year + type, baltimoreNEI, sum)

ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)

dev.copy(png, "plot3.png",
         width  = 480,
         height = 480)

dev.off()

rm(list = ls())