#1 + 2
library(chillR) 
data(Winters_hours_gaps)
hours_over_25 <- sum(Winters_hours_gaps$Temp > 25, na.rm = TRUE)
print(paste("Total hours over 25 degrees:", hours_over_25))
-> 1275

#3
hours_over_25 <- sum(Winters_hours_gaps$Temp > 25, na.rm = TRUE)
calculate_warm_hours_final_filter <- function(data, start_date_char, end_date_char) {
  start_date_obj <- as.Date(start_date_char)
  end_date_obj <- as.Date(end_date_char)
  data$Date <- as.Date(paste(data$Year, data$Month, data$Day, sep = "-"))
  filtered_data <- data[data$Date >= start_date_obj & data$Date <= end_date_obj, ]
  print(paste("Anzahl Stunden in gefilterten Daten:", nrow(filtered_data)))
  hours_over_25 <- sum(filtered_data$Temp > 25, na.rm = TRUE)
  return(hours_over_25)
}

start_date_input_user <- "2008-06-01"
end_date_input_user <- "2008-09-28"

total_warm_hours_user <- calculate_warm_hours_final_filter(Winters_hours_gaps, start_date_input_user, end_date_input_user)

print(paste("Gesamtstunden über 25 Grad zwischen", start_date_input_user, "und", end_date_input_user, ":", total_warm_hours_user))

#oder# 

library(chillR)
data(Winters_hours_gaps)

# Calculate total hours above 25°C
hours_over_25 <- sum(Winters_hours_gaps$Temp > 25, na.rm = TRUE)
print(paste("Total hours over 25°C:", hours_over_25))
calculate_warm_hours <- function(data, start_date, end_date) {
  # Add a date column
  data$Date <- as.Date(paste(data$Year, data$Month, data$Day, sep = "-"))
  
  # Filter between chosen dates
  data_filtered <- data[data$Date >= as.Date(start_date) & data$Date <= as.Date(end_date), ]
  
  # Count hours above 25°C
  warm_hours <- sum(data_filtered$Temp > 25, na.rm = TRUE)
  return(warm_hours)
}

# Example use
start <- "2008-06-01"
end <- "2008-09-28"

result <- calculate_warm_hours(Winters_hours_gaps, start, end)
print(paste("Warm hours between", start, "and", end, ":", result))
