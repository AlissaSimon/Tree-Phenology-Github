library(chillR)

station_list<-handle_gsod(action="list_stations",
                          location=c( 8.77, 47.73),
                          time_interval=c(1990,2024))
head(station_list)
weather<-handle_gsod(action="download_weather",
                     location=station_list$chillR_code[14],
                     time_interval=c(1990,2024))
head(weather[[1]])

cleaned_weather<-handle_gsod(weather)

güttingen_weather <- cleaned_weather[[1]]

dir.create('data_güttingen')

write.csv(station_list,"data_güttingen/station_list.csv",row.names=FALSE)
write.csv(weather[[1]],"data_güttingen/Güttingen_raw_weather.csv",row.names=FALSE)
write.csv(cleaned_weather[[1]],"data_güttingen/Güttingen_chillR_weather.csv",row.names=FALSE)
