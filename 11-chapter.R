#Chapter 11

## Exercise 1
library(chillR)
library(tidyverse)
gut_raw <- read.csv("data_güttingen/Güttingen_raw_weather.csv")
gut <- read.csv("data_güttingen/Güttingen_chillR_weather.csv")
gut_qc <- fix_weather(gut)$QC
gut_qc

## Exercise 2
station_list <- handle_gsod(
  action = "list_stations",
  location = c(9.283, 47.600),
  time_interval = c(1990, 2024)
)

station_list[1:25,]

## Exercise 3
Good stations 
- Aadorf-Taenikon (Distance of 31,59km, Overlap 34.17 years, Interval coverage 98%)
- Konstanz (Distance 11,90km, Overlap 35 years, Interval coverage 100%)
- St. Gallen (Distance 20,57km, Overlap 35 years, Interval coverage 100%)
- Feldkirch (AU, Distance 44,80km, Overlap 35 years, Interval coverage 100%)station_list
- Bergenz (AU, Distance 36,81, Overlap 35 years, Interval coverage 100%)

## Exercise 4
patch_weather<-
  handle_gsod(action = "download_weather",
              location = as.character(station_list$chillR_code[c(4, 6, 8, 13, 14, 15)]),
              time_interval = c(1990,2024)) %>%
  handle_gsod()
patched <- patch_daily_temperatures(weather = gut,
                                    patch_weather = patch_weather)
patched$statistics[[1]]
patched$statistics[[2]]
patched$statistics[[3]]

patched <- patch_daily_temperatures(weather = gut,
                                    patch_weather = patch_weather,
                                    max_mean_bias = 1,
                                    max_stdev_bias = 2)

patched$statistics[[1]]
patched$statistics[[2]]
patched$statistics[[3]]

post_patch_stats <- fix_weather(patched)$QC

post_patch_stats


