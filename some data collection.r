
#For whoever read this in the fulture
#this R file is about the data collection and some data cleaning for the
#statstic intership project - quality of life index
#Tie 2024/05/01 

###
#this code including following topic data collection and cleaning 
#1 - (Numbeo) Climate Index (useable)
#2 - (Numbeo) Pollution Index
#3 - (Numbeo) Traffic Commute Time Index (useable)
#4- (QoL Hub) Environment
#5. the ratio between the amount of education and the wage

##############################################################################
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
##############################################################################

setwd("~/Documents/GitHub/Sata_Can_intership") 

##############################################################################
#1 - (Numbeo) Climate Index (https://www.numbeo.com/climate/indices_explained.jsp)
  #1.1 using the package access the data
  #n
#1.1 using the package access the data##########################################
  #I need some time to calcuate the majo
  #the issue: still working on getting the EECC data and run it



##############################################################################


##############################################################################
#2 - (Numbeo) Pollution Index
#Canadian air pollution is relative low
#https://www160.statcan.gc.ca/environment-environnement/index-eng.htm
#https://www.canada.ca/en/environment-climate-change/services/environmental-indicators/population-exposure-outdoor-air-pollutants.html
##############################################################################

##############################################################################
#3 - (Numbeo) Traffic Commute Time Index
#https://www150.statcan.gc.ca/t1/tbl1/en/cv.action?pid=9810045701



#Main mode of commuting by commuting duration, time leaving for work, industry sectors, 
#occupation broad category and gender: Canada, provinces and territories, census metropolitan 
#areas and census agglomerations with parts
#https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=9810046301

##############################################################################
#Student debt from all sources, by province of study and level of study
#https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3710003601

##############################################################################

#4- (QoL Hub) Environment
#

##############################################################################
#https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=9810045701&pickMembers%5B0%5D=1.1&pickMembers%5B1%5D=2.1&pickMembers%5B2%5D=3.2&pickMembers%5B3%5D=4.1&pickMembers%5B4%5D=5.1
#Main mode of commuting by commuting duration, time leaving for work, age and gender: Canada, provinces and territories, census metropolitan areas and census agglomerations with parts
      #


#Percentage of 15-to 29-year-olds in education and not in education by labour force status, highest level of education attained, age group and sex
#https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3710019601


#Convenient access to public transport by geography
#https://www150.statcan.gc.ca/t1/tbl1/en/cv.action?pid=2310030901

#Satisfaction with local environment, by gender and province 1, 2, 3, 4, 5, 6
#https://www150.statcan.gc.ca/t1/tbl1/en/cv.action?pid=4510006901

#Satisfaction with local environment, by gender and other selected sociodemographic characteristics 1, 2, 3, 4, 5, 6
#https://www150.statcan.gc.ca/t1/tbl1/en/cv.action?pid=4510007001


