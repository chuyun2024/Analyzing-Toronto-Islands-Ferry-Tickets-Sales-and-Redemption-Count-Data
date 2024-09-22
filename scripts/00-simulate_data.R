#### Preamble ####
# Purpose: Simulates Toronto Islands Ferry Tickets Sales Count Data
# Author: Yun Chu
# Date: 21 September 2024
# Contact: yun.chu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(200)

# Define the start and end time
start_date <- as.Date("2023-08-01")
end_date <- as.Date("2024-08-31")

#Set the number of Randoom dates
number_of_dates <- 200

data <- 
  tibble(
    dates = as.Date(
      runif(
        n = number_of_dates,
        min = as.numeric(start_date),
        max = as.numeric(end_date)
      ),
      origin = "1970-01-01"
    ),
    number_of_sales = rpois(n = number_of_dates, lambda = 15),
    number_of_redemptions = rpois(n = number_of_dates, lambda = 20)
  )

# Write_csv
write_csv(data, file = "data/raw_data/simulated.csv")