# Exercise 1
library(chillR)
library(ggplot2)
library(tidyr)
latitude <- 55.95
Days <- daylength(latitude = 55.95, JDay = 1:365)
Days_df <- data.frame(
  JDay = 1:365,
  Sunrise = Days$Sunrise,
  Sunset  = Days$Sunset,
  Daylength = Days$Daylength
)
Days_long <- pivot_longer(Days_df, cols = Sunrise:Daylength)
ggplot(Days_long, aes(JDay, value)) +
  geom_line(lwd = 1.3, colour = "darkgreen") +
  facet_grid(cols = vars(name)) +
  ylab("Time of Day / Daylength (hours)") +
  xlab("Julian Day") +
  ggtitle("Sunrise, Sunset, and Daylength in Edinburgh") +
  theme_bw(base_size = 14)

#Exercise 2
latitude <- 55.95
KA_hourly <- stack_hourly_temps(KA_weather, latitude = latitude)$hourtemps
head(KA_hourly, 24)

#Exercise 3
empi_curve <- Empirical_daily_temperature_curve(Winters_hours_gaps)
ggplot(data = empi_curve[1:96, ], aes(Hour, Prediction_coefficient)) +
  geom_line(lwd = 1.3, col = "red") +
  facet_grid(rows = vars(Month)) +
  xlab("Hour of the Day") +
  ylab("Prediction Coefficient") +
  theme_bw(base_size = 10)
Winters_daily <- make_all_day_table(Winters_hours_gaps, input_timestep = "hour")
Winters_emp_hourly <- Empirical_hourly_temperatures(Winters_daily, empi_curve)
head(Winters_emp_hourly, 24)
