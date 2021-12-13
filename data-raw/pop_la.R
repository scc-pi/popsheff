# HEADER ---------------------
# Description: Get the Local Authority population estimates for Sheffield
#               from 2001 to 2020
# Author: Laurie Platt

# SETUP -------------------------
library(tidyverse)
library(readxl)

## Local variables --------------

# Location of data we're reading
data_in_folder <- "data-raw"

# Name of the file with population estimates at LA level
pop_la_file <- "ukpopestimatesmid2020on2021geography.xls"

# Name of the sheet with LA population from 2001 to 2020
pop_yrs_sheet <- "MYE4"

# Name of the sheet with LA median ages from 2001 to 2020
pop_median_age_sheet <- "MYE 6"

# Name of the sheet with latest LA population by year of age
pop_age_sheet <- "MYE2 - Persons"

# Name of the sheet with latest LA male population by year of age
pop_age_male_sheet <- "MYE2 - Males"

# Name of the sheet with latest LA female population by year of age
pop_age_female_sheet <- "MYE2 - Females"

# Name of the file with detailed population estimates at LA level for 2000-20
pop_la_ts_file <- 
  "MYEB1_detailed_population_estimates_series_UK_(2020_geog21).csv"

# READ -------------------------
# Note: Manually downloaded from ONS for now

pop_la_yrs <- read_xls(
  path = str_c(data_in_folder, "/", pop_la_file),
  sheet = pop_yrs_sheet,
  skip = 7)

pop_la_median_age <- read_xls(
  path = str_c(data_in_folder, "/", pop_la_file),
  sheet = pop_median_age_sheet,
  skip = 7)

pop_la_age <- read_xls(
  path = str_c(data_in_folder, "/", pop_la_file),
  sheet = pop_age_sheet,
  skip = 7)

pop_la_age_male <- read_xls(
  path = str_c(data_in_folder, "/", pop_la_file),
  sheet = pop_age_male_sheet,
  skip = 7)

pop_la_age_female <- read_xls(
  path = str_c(data_in_folder, "/", pop_la_file),
  sheet = pop_age_female_sheet,
  skip = 7)

pop_la_yrs_age_gender <- read_csv(
  str_c(data_in_folder, "/", pop_la_ts_file))

# TRANSFORM ---------------------

pop_la_yrs <-  pop_la_yrs %>%
  filter(Name == "Sheffield") %>%
  pivot_longer(cols = starts_with("Mid-"),
               names_to = "Year",
               values_to = "Population") %>%
  select(Year, Population) %>%
  mutate(Year = str_replace(Year, "Mid-", "")) %>%
  mutate(Year = as.numeric(Year)) # or type year?

pop_la_median_age <- pop_la_median_age %>%
  filter(Name == "Sheffield") %>%
  pivot_longer(cols = starts_with("Mid-"),
               names_to = "Year",
               values_to = "Median age") %>%
  select(Year, `Median age`) %>%
  mutate(Year = str_replace(Year, "Mid-", "")) %>%
  mutate(Year = as.numeric(Year)) # or type year?

pop_la_age <- pop_la_age %>%
  filter(Name == "Sheffield") %>%
  select(-Code, -Name, -Geography) %>%
  pivot_longer(cols = everything(),
               names_to = "Age",
               values_to = "Persons")

pop_la_age_male <- pop_la_age_male %>%
  filter(Name == "Sheffield") %>%
  select(-Code, -Name, -Geography) %>%
  pivot_longer(cols = everything(),
               names_to = "Age",
               values_to = "Males")

pop_la_age_female <- pop_la_age_female %>%
  filter(Name == "Sheffield") %>%
  select(-Code, -Name, -Geography) %>%
  pivot_longer(cols = everything(),
               names_to = "Age",
               values_to = "Females")

pop_la_yrs_age_gender <- pop_la_yrs_age_gender %>% 
  filter(laname21 == "Sheffield") %>% 
  select(-starts_with("la"), -country) %>% 
  rename(Gender = sex, Age = age) %>% 
  mutate(Gender = ifelse(Gender == 1, "M", "F")) %>% 
  rename_with(~str_replace(.,"^population_","")) %>% 
  pivot_longer(cols = starts_with("2"),
               names_to = "Year",
               values_to = "Persons")

# WRITE --------------------------

usethis::use_data(pop_la_yrs, compress = "xz", overwrite = T)

usethis::use_data(pop_la_median_age, compress = "xz", overwrite = T)

usethis::use_data(pop_la_age, compress = "xz", overwrite = T)

usethis::use_data(pop_la_age_male, compress = "xz", overwrite = T)

usethis::use_data(pop_la_age_female, compress = "xz", overwrite = T)

usethis::use_data(pop_la_yrs_age_gender, compress = "xz", overwrite = T)
