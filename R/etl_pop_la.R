# HEADER ---------------------
# Description: Get the Local Authority population estimates for Sheffield
#               from 2001 to 2020
# Author: Laurie Platt

# SETUP -------------------------
library(tidyverse);library(readxl)

## Local variables --------------

# Location of data we're reading
data_in_folder <- str_c(
  "data-in")

# Location of data we're creating
data_out_folder <- str_c(
  "data-out")

# Name of the file with population estimates at LA level
pop_la_file <- "ukpopestimatesmid2020on2021geography.xls"

# Name of the sheet with LA population estimates from 2001 to 2020
pop_yrs_sheet <- "MYE4"

# Name of the sheet with LA median ages from 2001 to 2020
pop_median_age_sheet <- "MYE 6"

# READ -------------------------
# Note: Manually downloaded from ONS for now

df_pop_yrs <- read_xls(
  path = str_c(data_in_folder, "/", pop_la_file),
  sheet = pop_yrs_sheet,
  skip = 7)

df_pop_median_age <- read_xls(
  path = str_c(data_in_folder, "/", pop_la_file),
  sheet = pop_median_age_sheet,
  skip = 7)

# TRANSFORM ---------------------

df_pop_yrs <-  df_pop_yrs %>% 
  filter(Name == "Sheffield") %>% 
  pivot_longer(cols = starts_with("Mid-"), 
               names_to = "Year",
               values_to = "Population") %>% 
  select(Year, Population) %>% 
  mutate(Year = str_replace(Year, "Mid-", "")) %>% 
  mutate(Year = as.numeric(Year)) # or type year?

df_pop_median_age <- df_pop_median_age %>% 
  filter(Name == "Sheffield") %>% 
  pivot_longer(cols = starts_with("Mid-"), 
               names_to = "Year",
               values_to = "Median age") %>% 
  select(Year, `Median age`) %>% 
  mutate(Year = str_replace(Year, "Mid-", "")) %>% 
  mutate(Year = as.numeric(Year)) # or type year?

# WRITE --------------------------

# Write the data frame to a folder so we can quickly use them in R
write_rds(df_pop_yrs, str_c(data_out_folder, "/df_pop_la_yrs.rds"))

write_rds(df_pop_median_age, str_c(data_out_folder, "/df_pop_la_median_age.rds"))
