#The health index the first try?
#I have no idea what is going on and how to caculate it but lets try sommething first 

#try to using the scale method to do it?
#make it try

#load the package
#this world is a lie  
weht0QPEenr pKQWrmn PQWM 
# WH风起牛肉汤哦iwporQ =mio不会如我么0-】哦，
asdasd

#create a new file for all the generated by the graphy
dir.create("Data")

#Step one Lode the all package that necessary. 
library (lubridate)    
library (cansim)       
library (WDI)          
library (fredr)        
library (tsbox)
library (RColorBrewer)
library(wesanderson)
library(writexl)
library(dplyr)

#setwd("~/Documents/GitHub/Sata_Can_intership")

########
#new idea, money spend on food shelter and energy percentage of 
#Household final consumption expenditure

rm(list = ls())

start_time <- "2000-01-01"
end_time <-"2023-01-01"

##########
#v61988959 food
#v61988967 Housing, water, electricity, gas and other fuels 
#v61988968 Paid rental fees for housing 
#v61988972 Electricity, gas and other fuels
#v116885921 Household final consumption expenditure (HFCE)

######
#https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3610010701

HFCE_raw <- "v61989012" #the series number for the statstic canada 
HFCE.st <- get_cansim_vector(HFCE_raw, start_time, end_time)
HFCE_year.st <- year(HFCE.st$REF_DATE[1])
HFCE_month.st <- month(HFCE.st$REF_DATE[1])

#transfer data to the time series time
c(HFCE_year.st, HFCE_month.st)
HFCE.ts<- ts(HFCE.st$VALUE, start = c(HFCE_year.st,HFCE_month.st), freq = 1)
#now its time series data!


##########
food_spending_raw <- "v61988959" #the series number for the statstic canada 
food_spending.st <- get_cansim_vector(food_spending_raw, start_time = start_time, end_time = end_time)
food_spending_year.st <- year(food_spending.st$REF_DATE[1])
food_spending_month.st <- month(food_spending.st$REF_DATE[1])

#transfer data to the time series time
c(food_spending_year.st, food_spending_month.st)
food_spending.ts<- ts(food_spending.st$VALUE, start = c(food_spending_year.st, food_spending_month.st), freq = 4)
#now its time series data!

######### housing and energy
housing_and_energy_raw <- "v61988967" #the series number for the statstic canada 
housing_and_energy.st <- get_cansim_vector(housing_and_energy_raw, start_time = start_time, end_time = end_time)
housing_and_energy_year.st <- year(housing_and_energy.st$REF_DATE[1])
housing_and_energy_month.st <- month(housing_and_energy.st$REF_DATE[1])

#transfer data to the time series time
c(housing_and_energy_year.st, housing_and_energy_month.st)
housing_and_energy.ts<- ts(housing_and_energy.st$VALUE, start = c(housing_and_energy_year.st, housing_and_energy_month.st), freq = 4)
#now its time series data!

######### rental_Payment
rental_payment_raw <- "v61988968" #the series number for the statstic canada 
rental_payment.st <- get_cansim_vector(rental_payment_raw, start_time = start_time, end_time = end_time)
rental_payment_year.st <- year(rental_payment.st$REF_DATE[1])
rental_payment_month.st <- month(rental_payment.st$REF_DATE[1])

#transfer data to the time series time
c(rental_payment_year.st, rental_payment_month.st)
rental_payment.ts<- ts(rental_payment.st$VALUE, start = c(rental_payment_year.st, rental_payment_month.st), freq = 4)
#now its time series data!

######enegy
#v61988972
enegy_raw <- "v61988972" #the series number for the statstic canada 
enegy.st <- get_cansim_vector(enegy_raw, start_time = start_time, end_time = end_time)
enegy_year.st <- year(enegy.st$REF_DATE[1])
enegy_month.st <- month(enegy.st$REF_DATE[1])

#transfer data to the time series time
c(enegy_year.st, enegy_month.st)
enegy.ts<- ts(enegy.st$VALUE, start = c(enegy_year.st, enegy_month.st), freq = 4)
#now its time series data!

###### 
#Water supply and sanitation services 
#v61988971
water_cost_raw <- "v61988971" #the series number for the statstic canada 
water_cost.st <- get_cansim_vector(water_cost_raw, start_time = start_time, end_time = end_time)
water_cost_year.st <- year(water_cost.st$REF_DATE[1])
water_cost_month.st <- month(water_cost.st$REF_DATE[1])

#transfer data to the time series time
c(water_cost_year.st, water_cost_month.st)
water_cost.ts<- ts(water_cost.st$VALUE, start = c(water_cost_year.st, water_cost_month.st), freq = 4)
#######

###### Imputed rental fees for housing 
#v61988969
Imputed_rental_fees_raw <- "v61988969" #the series number for the statstic canada 
Imputed_rental_fees.st <- get_cansim_vector(Imputed_rental_fees_raw, start_time = start_time, end_time = end_time)
Imputed_rental_fees_year.st <- year(Imputed_rental_fees.st $REF_DATE[1])
Imputed_rental_fees_month.st <- month(Imputed_rental_fees.st $REF_DATE[1])

#transfer data to the time series time
c(Imputed_rental_fees_year.st, Imputed_rental_fees_month.st)
Imputed_rental_fees.ts<- ts(Imputed_rental_fees.st$VALUE, start = c(Imputed_rental_fees_year.st, Imputed_rental_fees_month.st), freq = 4)
######
The_housing_cost <-  water_cost.ts + enegy.ts + rental_payment.ts + Imputed_rental_fees.ts

plot((diff(log(The_housing_cost),4))*100)


####### 
#v61989012 Household final consumption expenditure 

final_consumption_raw <- "v61989012" #the series number for the statstic canada 
final_consumption.st <- get_cansim_vector(final_consumption_raw, start_time = start_time, end_time = end_time)
final_consumption_year.st <- year(final_consumption.st$REF_DATE[1])
final_consumption_month.st <- month(final_consumption.st$REF_DATE[1])

#transfer data to the time series time
c(final_consumption_year.st, final_consumption_month.st)
final_consumption.ts<- ts(final_consumption.st$VALUE, start = c(final_consumption_year.st, final_consumption_month.st), freq = 4)
#now its time series data!

#the percentage of the necessity of the spending in family. 

the_percentage <- ((food_spending.ts +water_cost.ts + enegy.ts + rental_payment.ts + Imputed_rental_fees.ts)/final_consumption.ts)*100
plot(the_percentage,ylim = c(30, 40))

##### the affortability index
the_percentage.df <- data.frame(
  Time = time(the_percentage),    # Create a time column from the time series index
  Value = as.numeric(the_percentage)  # Extract values from the time series
)

plot(the_percentage, ylim = c(30, 40))

# Apply mutate to scale the 'Value' within the data frame
the_percentage.df <- the_percentage.df %>%
  mutate(Scaled_Value = (Value - min(Value)) / (max(Value) - min(Value)))

affortability_index <-  the_percentage.df$Scaled_Value

plot(affortability_index, type = "l" ,ylim = c(0, 1))

#####




