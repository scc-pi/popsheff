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

# Location of data we're creating
data_out_folder <- "data"

# Name of the file with population estimates at Ward level
pop_ward_file <- "sape23dt8amid2020ward2020on2021lasyoaestimatesunformattedcorrection.xlsx"

# Name of the sheet with latest ward population by year of age
pop_age_sheet <- "Mid-2020 Persons"

# Name of the sheet with latest ward male population by year of age
pop_age_male_sheet <- "Mid-2020 Males"

# Name of the sheet with latest ward female population by year of age
pop_age_female_sheet <- "Mid-2020 Females"

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

# TRANSFORM ---------------------

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

# WRITE --------------------------

usethis::use_data(pop_ward_age, compress = "xz", overwrite = T)

usethis::use_data(pop_ward_age_male, compress = "xz", overwrite = T)

usethis::use_data(pop_ward_age_female, compress = "xz", overwrite = T)
