library(chillR)
library(tidyverse)

# Exercise 1
# a
Winters_tib <- as_tibble(Winters_hours_gaps)
#b
Winters_tib10 <- Winters_tib %>% slice(1:10)
#c
Winters_long <- Winters_tib10 %>%
  pivot_longer(cols = c(Temp_gaps, Temp),
               names_to = "measurement",
               values_to = "value")
#d
ggplot(Winters_long, aes(x = Hour, y = value)) +
  geom_point(color = "steelblue") +
  facet_wrap(~measurement, ncol = 1) +
  theme_bw(base_size = 11) +
  labs(title = "Temperature values (Temp vs Temp_gaps)",
       x = "Hour of Day", y = "Temperature (°C)")
#e
Winters_wide <- Winters_long %>% pivot_wider(names_from = measurement, values_from = value)
#f
Winters_select <- Winters_wide %>% select(Year, Month, Day, Temp)
#g
Winters_sorted <- Winters_select %>%
  arrange(desc(Temp))

head(Winters_sorted)

#Exercise 2
Winters_for <- Winters_hours_gaps
for (i in 1:nrow(Winters_for)) {
  Winters_for$Temp[i] <- (Winters_for$Temp[i] * 9/5) + 32
}
head(Winters_for$Temp)

#Exercise 3
Winters_apply <- Winters_hours_gaps
Winters_apply$Temp_F <- sapply(Winters_apply$Temp, function(x) (x * 9/5) + 32)
head(Winters_apply$Temp_F)

#Exercise 4
Winters_mutate <- Winters_hours_gaps %>%
  mutate(Temp_F = (Temp * 9/5) + 32)

head(Winters_mutate$Temp_F)
