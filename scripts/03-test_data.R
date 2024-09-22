#### Preamble ####
# Purpose: Sanity check of the data
# Author: Yun Chu
# Date: 22 Septermber 2024
# Contact: yun.chu@mail.utoronto.ca
# License: 
# Pre-requisites: need to have simulated data
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Test data ####
data <- read_csv("data/raw_data/simulated.csv")

# Test for negative numbers
data$number_of_sales |> min() <= 0
data$number_of_redemptions |> min() <= 0

# Test for NAs
all(is.na(data$number_of_sales))
all(is.na(data$number_of_redemptions))