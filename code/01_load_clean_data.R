here::i_am("code/01_load_clean_data.R")
absolute_path_to_data <- here::here("data/padus_ar_cov_trct.csv")
data <- read.csv(absolute_path_to_data, header=TRUE)
head(data)

library(dplyr)
#Create metro5 vector of counties of interest
metro5 <- c(13063, 13067, 13089, 13121, 13135)

#Convert data$GEOID from numeric to string and preserve leading 0s.
str(data$GEOID)
data$GEOID <- sprintf("%011s", data$GEOID)
str(data$GEOID)

#Truncate GEOID to State/County FIPS
data$st_co <- substr(data$GEOID, 1, 5)
str(data$st_co)

#Filter data to only include counties of interest
data_metro <- data |>
  filter(
    st_co %in% metro5
  )
table(data_metro$st_co)

#Rename and move State_County_FIPS to front
data_metro <- data_metro |>
  rename(State_County_FIPS = st_co)
data_metro <- data_metro |> relocate(State_County_FIPS)

#Label metro counties
data_metro$State_County_FIPS <- factor(data_metro$State_County_FIPS,
                                       levels = c(13063, 13067, 13089, 13121, 13135),      
                                       labels = c("Clayton", "Cobb", "DeKalb", "Fulton", "Gwinnett"))

#Save cleaned data as object
saveRDS(
  data_metro,
  file = here::here("output", "data_metro.rds")
)