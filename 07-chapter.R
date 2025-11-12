library(chillR)
data(Winters_hours_gaps)
Chilling_Hours
library(chillR)
library(knitr)
library(pander)
library(kableExtra)

## function(HourTemp,summ=TRUE)
## {
##   CH_range<-which(HourTemp<=7.2&HourTemp>=0)
##   CH_weights<-rep(0,length(HourTemp))
##   CH_weights[CH_range]<-1
##   if(summ==TRUE) return(cumsum(CH_weights)) else
##     return(CH_weights)
## }
## <bytecode: 0x5570c3d78dd8>
## <environment: namespace:chillR>
Chilling_Hours(Winters_hours_gaps$Temp)[1:100]
Utah_Model
## function(HourTemp,summ=TRUE)
##   return(step_model(HourTemp,df=data.frame(lower=c(-1000,1.4,2.4,9.1,12.4,15.9,18),upper=c(1.4,2.4,9.1,12.4,15.9,18,1000),weight=c(0,0.5,1,0.5,0,-0.5,-1)),summ=summ))
## <bytecode: 0x5570c43b39e0>
## <environment: namespace:chillR>
Utah_Model(Winters_hours_gaps$Temp)[1:100]
df<-data.frame(
  lower= c(-1000, 1, 2, 3, 4, 5,    6),
  upper= c(    1, 2, 3, 4, 5, 6, 1000),
  weight=c(    0, 1, 2, 3, 2, 1,    0))
kable(df) %>%
  kable_styling("striped", position = "left", font_size = 10)
custom <- function(x) step_model(x, df)
custom(Winters_hours_gaps$Temp)[1:100]
Dynamic_Model(Winters_hours_gaps$Temp)[1:100]
output <- chilling(make_JDay(Winters_hours_gaps),
                   Start_JDay = 90,
                   End_JDay = 100)
kable(output) %>%
  kable_styling("striped",
                position = "left",
                font_size = 10)
custom <- function(x) step_model(x, df)
custom(Winters_hours_gaps$Temp)[1:100]
Dynamic_Model(Winters_hours_gaps$Temp)[1:100]
output <- chilling(make_JDay(Winters_hours_gaps),
                   Start_JDay = 90,
                   End_JDay = 100)
kable(output) %>%
  kable_styling("striped",
                position = "left",
                font_size = 10)
output <- tempResponse(make_JDay(Winters_hours_gaps),
                       Start_JDay = 90,
                       End_JDay = 100,
                       models = list(Chill_Portions = Dynamic_Model, 
                                     GDH = GDH))
kable(output) %>%
  kable_styling("striped", 
                position = "left",
                font_size = 10)

Exercise 1: Run the chilling() function on the dataset
library(chillR)
data("Winters_hours_gaps")
output_chilling <- chilling(make_JDay(Winters_hours_gaps),
                            Start_JDay = 90,  
                            End_JDay = 100)
print(output_chilling)


Exercise 2: Create your own temperature-weighted chill model
my_chill_model <- data.frame(
  lower = c(-1000, 0, 3, 6, 9, 12, 15),
  upper = c(0, 3, 6, 9, 12, 15, 1000),
  weight = c(0, 0.5, 1, 0.5, 0, -0.5, -1)
)
print(my_chill_model)
my_custom_chill <- function(x) step_model(x, my_chill_model)
my_custom_chill(Winters_hours_gaps$Temp)[1:20]


Exercise 3: Run this custom model with tempResponse()
output_custom <- tempResponse(make_JDay(Winters_hours_gaps),
                              Start_JDay = 90,
                              End_JDay = 100,
                              models = list(MyChill = my_custom_chill))
print(output_custom)
