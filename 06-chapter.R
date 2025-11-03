#1 + 2
library(chillR)
data(Winters_hours_gaps)
hours_over_25 <- sum(Winters_hours_gaps$Temp > 25, na.rm = TRUE)
print(paste("Total hours over 25 degrees:", hours_over_25))
-> 1275

#3
hours_over_25 <- sum(Winters_hours_gaps$Temp > 25, na.rm = TRUE)
calculate_warm_hours <- function(data, start_date_char, end_date_char) {
  start_date <- as.Date(start_date_char)
  end_date <- as.Date(end_date_char)
  start_YEARMODA <- Date2YEARMODA(start_date)
  end_YEARMODA <- Date2YEARMODA(end_date)
  filtered_data <- data[data$YEARMODA >= start_YEARMODA & data$YEARMODA <= end_YEARMODA, ]
  hours_over_25 <- sum(filtered_data$Temp > 25, na.rm = TRUE)
  return(hours_over_25)
}
start_date_input <- "2007-01-01"
end_date_input <- "2007-12-31"
total_warm_hours <- calculate_warm_hours(Winters_hours_gaps, start_date_input, end_date_input)
print(paste("Total hours over 25 degrees between", start_date_input, "and", end_date_input, ":", total_warm_hours))
