# HEADER ---------------------
# Description: Get the neighbourhood population data for Sheffield
# Author: Laurie Platt

# SETUP -------------------------
library(tidyverse)
library(readxl)

## Local variables --------------

# Location of data we're reading
data_in_folder <- "data-raw"

# Name of file with latest population estimates at neighbourhood level
pop_nhood_2020_file <- "pop_estimates_sheffield_neighbourhoods_midy2020_db13102021.xlsx"

# Name of file with 2019 population estimates at neighbourhood level
pop_nhood_2019_file <- "pop_estimates_sheffield_neighbourhoods_midy2019_db16102020.xlsx"

# Name of file with 2018 population estimates at neighbourhood level
pop_nhood_2018_file <- "pop_estimates_sheffield_neighbourhoods_midy2018_db07112019.xlsx"

# Name of file with 2017 population estimates at neighbourhood level
pop_nhood_2017_file <- "pop_estimates_sheffield_neighbourhoods_midy2017_db01112018.xlsx"

# READ & TRANSFORM-------------------------
# Note: Manually downloaded from Dale

nhood_pop <- function(file, values, year){
  read_xlsx(
    path = str_c("data-raw/", file), 
    sheet = values, 
    skip = 5) %>% 
    rename(nhood_code = 1, nhood_name = 2, `All ages` = 3) %>% 
    pivot_longer(cols = `All ages`:`90+`,
                 names_to = "Age",
                 values_to = values) %>% 
    mutate(Year = year, .before = Age)
}

# 2020 estimates
pop_nhood_age_2020 <- nhood_pop(pop_nhood_2020_file, "Persons", 2020)
pop_nhood_age_male_2020 <- nhood_pop(pop_nhood_2020_file, "Males", 2020)
pop_nhood_age_female_2020 <- nhood_pop( pop_nhood_2020_file, "Females", 2020)

# Latest estimates
pop_nhood_age <- select(pop_nhood_age_2020, -Year)
pop_nhood_age_male <- select(pop_nhood_age_male_2020, -Year)
pop_nhood_age_female <- select(pop_nhood_age_female_2020, -Year)

# 2019 estimates
pop_nhood_age_2019 <- nhood_pop(pop_nhood_2019_file, "Persons", 2019)
pop_nhood_age_male_2019 <- nhood_pop(pop_nhood_2019_file, "Males", 2019)
pop_nhood_age_female_2019 <- nhood_pop(pop_nhood_2019_file, "Females", 2019)

# 2018 estimates
pop_nhood_age_2018 <- nhood_pop(pop_nhood_2018_file, "Persons", 2018)
pop_nhood_age_male_2018 <- nhood_pop(pop_nhood_2018_file, "Males", 2018)
pop_nhood_age_female_2018 <- nhood_pop(pop_nhood_2018_file, "Females", 2018)

# 2017 estimates
pop_nhood_age_2017 <- nhood_pop(pop_nhood_2017_file, "Persons", 2017)
pop_nhood_age_male_2017 <- nhood_pop(pop_nhood_2017_file, "Males", 2017)
pop_nhood_age_female_2017 <- nhood_pop(pop_nhood_2017_file, "Females", 2017)

# Combine data for 2017-2020
pop_nhood_yrs_age <- bind_rows(pop_nhood_age_2020, pop_nhood_age_2019,
                               pop_nhood_age_2018, pop_nhood_age_2017)

pop_nhood_yrs_age_gender <- bind_rows(pop_nhood_age_male_2020, 
                                      pop_nhood_age_female_2020,
                                      pop_nhood_age_male_2019, 
                                      pop_nhood_age_female_2019) %>% 
  mutate(Gender = ifelse(is.na(Males), "F", "M"),
         Persons = ifelse(is.na(Males), Females, Males)) %>% 
  select(-Males, -Females)

# WRITE --------------------------

usethis::use_data(pop_nhood_age, compress = "xz", overwrite = T)

usethis::use_data(pop_nhood_age_male, compress = "xz", overwrite = T)

usethis::use_data(pop_nhood_age_female, compress = "xz", overwrite = T)

usethis::use_data(pop_nhood_yrs_age, compress = "xz", overwrite = T)

usethis::use_data(pop_nhood_yrs_age_gender, compress = "xz", overwrite = T)
