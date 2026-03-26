here::i_am("code/02_make_table.R")

data_metro <- readRDS(
  file = here::here("output/data_metro.rds"))

#Create table with summary statistics by county
library(gtsummary)
table1 <- data_metro |>
  select(State_County_FIPS, pc_park) |>
  tbl_summary(
    label = list(
      pc_park ~ "Park Percentage"
    ),
    by = State_County_FIPS
  )
table1

saveRDS(
  table1,
  file = here::here("output/table1.rds"))