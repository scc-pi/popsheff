# HEADER ---------------------
# Description: Get the LSOA population estimates for Sheffield
# Author: Laurie Platt

# SETUP -------------------------
library(tidyverse);library(readxl)

## Local variables --------------

# Location of data we're reading
data_in_folder <- str_c(
  "ons-files")

# Location of data we're creating
data_out_folder <- str_c(
  "data")

# Name of the file with 2020 population estimates at LSOA level
pop_lsoa_20_file <- "sape23dt13mid2020lsoabroadagesestimatesunformatted.xlsx"

# READ -------------------------
# Note: Manually downloaded from ONS for now

df_pop_lsoa_20 <- read_xlsx(
  path = str_c(data_in_folder, "/", pop_lsoa_20_file),
  sheet = "Mid-2020 Persons",
  skip = 4)

# TRANSFORM ---------------------

df_pop_lsoa_20 <-  df_pop_lsoa_20 %>%
  filter(`LA name (2021 boundaries)` == "Sheffield") %>%
  select(-(3:6))

# WRITE --------------------------

# Write the data frame to a folder so we can quickly use them in R
write_rds(df_pop_lsoa_20, str_c(data_out_folder, "/df_pop_lsoa_20.rds"))
