setwd("C:/Users/John/Desktop/National-Emissions-Inventory-database-")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimoreNEI <- NEI[NEI$fips=="24510",]
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)
barplot(
  aggTotalsBaltimore$Emissions,
  names.arg=aggTotalsBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",col="Light Blue",
  main="Total PM2.5 Emissions From All Baltimore City Sources"
)

dev.copy(png, "plot2.png",
         width  = 480,
         height = 480)

dev.off()

rm(list = ls())