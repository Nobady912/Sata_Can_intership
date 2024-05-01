
#For whoever read this in the fulture
#this R file is about the data collection and some data cleaning for the
#statstic intership project - quality of life index
#Tie 2024/05/01 

#this code including following topic data collection and cleaning 
#1 - (Numbeo) Climate Index
#2 - (Numbeo) Pollution Index
#3 - (Numbeo) Traffic Commute Time Index
#4- (QoL Hub) Environment
#5. the ratio between the amount of education and the wage


#Step one Lode the all package that necessary. 
library (lubridate)    #Simplifies date and time analysis in R.
library (cansim)       #Access and manipulate Canadian statistical data.
library (WDI)          #Fetches global development data from World Bank.
library (fredr)        #Interfaces with Federal Reserve Economic Data.
library (tsbox)        #Time series data conversion and visualization toolkit.
library (RColorBrewer) #: Provides color schemes for maps and charts.
library(wesanderson) #Color palettes inspired by Wes Anderson films.
library(writexl) #rite data frames to Excel without external dependencies.
library(dplyr) #Facilitates data manipulation and analysis.

setwd("~/Documents/GitHub/Sata_Can_intership") 

adasdasdasd