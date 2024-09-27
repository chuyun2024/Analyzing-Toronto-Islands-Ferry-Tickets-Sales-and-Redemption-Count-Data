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
data_simulated <- read_csv("data/raw_data/simulated.csv")
data_actual <- read.csv("data/analysis_data/cleaned_data.csv")

# Test for negative numbers
tn1 <- data_simulated$number_of_sales |> min() <= 0
tn2 <- data_simulated$number_of_redemptions |> min() <= 0

tn3 <- data_actual$daily_sales_count |> min() <= 0
tn4 <- data_actual$daily_redemption_count |> min() <= 0 

if (!tn1 & !tn2 & !tn3 & !tn4) {
  print("Negative number test passed.")
} else {
  print("Negative number test failed.")
}
  
# Test for NAs

tna1 <- all(is.na(data_simulated$number_of_sales))
tna2 <- all(is.na(data_simulated$number_of_redemptions))

tna3 <- all(is.na(data_actual$daily_sales_count))
tna4 <- all(is.na(data_actual$daily_redemption_count))

if (!tna1 & !tna2 & !tna3 & !tna4) {
  print("NA test passed.")
} else {
  print("NA test failed.")
}
