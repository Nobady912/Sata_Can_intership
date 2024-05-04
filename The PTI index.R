#this code is try to calcuate the Traffic Indexes from the following websit
#https://www.numbeo.com/traffic/indices_explained.jsp
#its work as the sub-index of quality of life index we been working on
#for the statstic canada intership project
#Tie Ma 2024/05/03 21:35


###############################################################
#change log
###############################################################
#0.1 improve the method
  #using population density (the higher the population density the better the public transit as a option?)
  #the time needed to take for work (15-24)
  #the public transportation angry index (increase exponentiasl for every 5min after the first 25min)
  #The accessibility of the public transportation within 500m
  #the presentation of population use the alternative transport (public_transport + active transporatation)
    #which measure the goodness of local proforcess?
#0.2 update the calculation method
  #use average weight method



###############################################################
# Function to calculate angry index
calculate_angry_index <- function(commute_time, scale_factor = 5) {
  excess_time <- (commute_time - 25)/5
  if (excess_time >= 0) {
    return(exp(excess_time / scale_factor))
  } else {
    return(1)
  }}

###############################################################
# Print indices
print(paste("Bus Angry Index:", bus_angry_index))
print(paste("Subway Angry Index:", subway_angry_index))
print(paste("Light Rail Angry Index:", light_rail_angry_index))
print(paste("Ferry Angry Index:", ferry_angry_index))
###############################################################


###############################################################
#using Edmonton(YEG) and Tornoto(YYZ) as example
###############################################################
YEG_public_transit <- 40.6
YEG_active_transportation <- 15
YEG_public_transit_angry_index <- calculate_angry_index(YEG_public_transit)


YYZ_public_transit <- 44.1
YYZ_active_transportation <- 15.3
YYZ_public_transit_angry_index <- calculate_angry_index(YYZ_public_transit)


###############################################################
#how many percentage people have the access to the bus withhin the 500m
###############################################################
YEG_access_transport <- 78.7
YYZ_access_transport <- 85.3

###############################################################
#Commuters using sustainable transportation in census metropolitan areas(2016)
###############################################################
YEG_public_usage <- 24.7 
YYZ_public_usage <- 12.4

###############################################################
#The public transportation index calcuation
###############################################################
#weight time! 
weight_transit_time <- 0.2
weight_active_time  <- 0.2
weight_access <- 0.2
weight_usage <- 0.2
weight_angry <-0.2 

###############################################################
#normalize the data 
normalize_time <- function(time){
  return(100 - time)
}

#normalize the percentaged based metrics

normalize_percentage <- function(percentage) {
  return(percentage)
}
###############################################################
#calcuation the data
###############################################################
YEG_transit_score <- normalize_time(YEG_public_transit)
YYZ_transit_score <- normalize_time(YYZ_public_transit)
YEG_active_score <- normalize_time(YEG_active_transportation)
YYZ_active_score <- normalize_time(YYZ_active_transportation)
YEG_access_score <- normalize_percentage(YEG_access_transport)
YYZ_access_score <- normalize_percentage(YYZ_access_transport)
YEG_usage_score <- normalize_percentage(YEG_public_usage)
YYZ_usage_score <- normalize_percentage(YYZ_public_usage)
###############################################################
#Function
calculate_PTI <- function(transit_score, active_score, access_score, usage_score, transit_angry_index) {
  transit_score * weight_transit_time +
    active_score * weight_active_time +
    access_score * weight_access +
    usage_score * weight_usage +
      transit_angry_index * weight_angry}
###############################################################

YEG_PTI <- calculate_PTI(YEG_transit_score, YEG_active_score, YEG_access_score, YEG_usage_score, YEG_public_transit_angry_index)
YYZ_PTI <- calculate_PTI(YYZ_transit_score, YYZ_active_score, YYZ_access_score, YYZ_usage_score, YYZ_public_transit_angry_index)

###############################################################
print(paste("Edmonton PTI with Angry Index:", YEG_PTI))
print(paste("Toronto PTI with Angry Index:", YYZ_PTI))




