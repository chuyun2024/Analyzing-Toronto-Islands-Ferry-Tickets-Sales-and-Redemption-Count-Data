#### Preamble ####
# Purpose: Cleans the raw sales data into analysis
# Author: Yun Chu
# Date: 21 September 2024
# Contact: yun.chu@mail.utoronto.ca
# License:
# Pre-requisites: Need to download the data
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(lubridate)
library(dplyr)

#### Clean data ####
raw_data <- read_csv("data/raw_data/unedited_sales_data.csv")

# remove the hour and minute timestamp, and transform it to year-month-date format
cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  mutate(formatted_date = format(ymd_hms(timestamp), "%Y-%m-%d")) |>
  group_by(formatted_date) |>
  summarize(
    daily_sales_count = sum(sales_count, na.rm = TRUE),
    daily_redemption_count = sum(redemption_count, na.rm = TRUE)
  )


#### Save data ####
write_csv(cleaned_data, "data/analysis_data/cleaned_data.csv")
