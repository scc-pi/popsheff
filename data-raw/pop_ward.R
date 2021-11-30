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

# Name of the file with population estimates at Ward level
pop_ward_file <- "sape23dt8amid2020ward2020on2021lasyoaestimatesunformattedcorrection.xlsx"

# Name of the sheet with latest Ward population by year of age
pop_age_sheet <- "Mid-2020 Persons"

# Name of the sheet with latest Ward male population by year of age
pop_age_male_sheet <- "Mid-2020 Males"

# Name of the sheet with latest Ward female population by year of age
pop_age_female_sheet <- "Mid-2020 Females"

# Name of the file with the Wards  population estimates at Ward level
lkup_ward_lac_file <- "Wards_LACs.xlsx"

# READ -------------------------
# Note: Manually downloaded from ONS for now

pop_ward_age <- read_xlsx(
  path = str_c(data_in_folder, "/", pop_ward_file),
  sheet = pop_age_sheet,
  skip = 4)

pop_ward_age_male <- read_xlsx(
  path = str_c(data_in_folder, "/", pop_ward_file),
  sheet = pop_age_male_sheet,
  skip = 4)

pop_ward_age_female <- read_xlsx(
  path = str_c(data_in_folder, "/", pop_ward_file),
  sheet = pop_age_female_sheet,
  skip = 4)

# Lookup of Wards to LACs (& ASC localities)
# - created manually 
#   https://www.sheffield.gov.uk/home/your-city-council/local-area-committees
lkup_ward_lac <- read_xlsx(
  path = str_c(data_in_folder, "/", lkup_ward_lac_file)) %>% 
  select(-`Ward Name`)

# TRANSFORM ---------------------

## Wards ----

pop_ward_age <- pop_ward_age %>%
  filter(`LA name (2021 boundaries)` == "Sheffield") %>%
  select(-starts_with("LA")) %>% 
  rename(`Ward Code` = `Ward Code 1`,
         `Ward Name` = `Ward Name 1`) %>% 
  pivot_longer(cols = -starts_with("Ward"),
               names_to = "Age",
               values_to = "Persons")

pop_ward_age_male <- pop_ward_age_male %>%
  filter(`LA name (2021 boundaries)` == "Sheffield") %>%
  select(-starts_with("LA")) %>% 
  rename(`Ward Code` = `Ward Code 1`,
         `Ward Name` = `Ward Name 1`) %>% 
  pivot_longer(cols = -starts_with("Ward"),
               names_to = "Age",
               values_to = "Males")

pop_ward_age_female <- pop_ward_age_female %>%
  filter(`LA name (2021 boundaries)` == "Sheffield") %>%
  select(-starts_with("LA")) %>% 
  rename(`Ward Code` = `Ward Code 1`,
         `Ward Name` = `Ward Name 1`) %>% 
  pivot_longer(cols = -starts_with("Ward"),
               names_to = "Age",
               values_to = "Females")

## Aggregate Wards to LACs (which are the same as ASC localities)

pop_lac_age <- pop_ward_age %>%
  left_join(lkup_ward_lac, by = "Ward Code") %>% 
  select(-starts_with("Ward")) %>% 
  group_by(Age, ca_name, ca_number, asc_name) %>% 
  summarise(Persons = sum(Persons)) %>% 
  relocate(c(Age, Persons), .after = last_col())

pop_lac_age_male <- pop_ward_age_male %>%
  left_join(lkup_ward_lac, by = "Ward Code") %>% 
  select(-starts_with("Ward")) %>% 
  group_by(Age, ca_name, ca_number, asc_name) %>% 
  summarise(Males = sum(Males)) %>% 
  relocate(c(Age, Males), .after = last_col())

pop_lac_age_female <- pop_ward_age_female %>%
  left_join(lkup_ward_lac, by = "Ward Code") %>% 
  select(-starts_with("Ward")) %>% 
  group_by(Age, ca_name, ca_number, asc_name) %>% 
  summarise(Females = sum(Females)) %>% 
  relocate(c(Age, Females), .after = last_col())

# WRITE --------------------------

usethis::use_data(pop_ward_age, compress = "xz", overwrite = T)

usethis::use_data(pop_ward_age_male, compress = "xz", overwrite = T)

usethis::use_data(pop_ward_age_female, compress = "xz", overwrite = T)

usethis::use_data(pop_lac_age, compress = "xz", overwrite = T)

usethis::use_data(pop_lac_age_male, compress = "xz", overwrite = T)

usethis::use_data(pop_lac_age_female, compress = "xz", overwrite = T)
