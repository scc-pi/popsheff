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

# READ -------------------------
# Note: Manually downloaded from ONS for now

df_pop_la <- read_xls(
  path = str_c(data_in_folder, "/", pop_la_file),
  sheet = "MYE4",
  skip = 7)

# TRANSFORM ---------------------

df_pop_la <-  df_pop_la %>% 
  filter(Name == "Sheffield") %>% 
  pivot_longer(cols = starts_with("Mid-"), 
               names_to = "Year",
               values_to = "Population") %>% 
  select(Year, Population) %>% 
  mutate(Year = str_replace(Year, "Mid-", "")) %>% 
  mutate(Year = as.numeric(Year)) # or type year?

# WRITE --------------------------

# Write the data frame to a folder so we can quickly use them in R
write_rds(df_pop_la, str_c(data_out_folder, "/df_pop_la.rds"))
