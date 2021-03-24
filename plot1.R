setwd("C:/Users/John/Desktop/National-Emissions-Inventory-database-")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
aggTotals <- aggregate(Emissions ~ year,NEI, sum)
barplot(
  (aggTotals$Emissions)/10^6,
  names.arg=aggTotals$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)", col="Green",
  main="Total PM2.5 Emissions From All US Sources"
)
dev.copy(png, "plot1.png",
         width  = 480,
         height = 480)

dev.off()

rm(list = ls())

