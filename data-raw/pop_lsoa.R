# HEADER ---------------------
# Description: Get the latest LSOA population data for Sheffield
# Author: Laurie Platt

# SETUP -------------------------
library(tidyverse)
library(readxl)

## Local variables --------------

# Location of data we're reading
data_in_folder <- "data-raw"

# Location of data we're creating
data_out_folder <- "data"

# Name of file with population estimates at LA level
pop_lsoa_file <- "sape23dt13mid2020lsoabroadagesestimatesunformatted.xlsx"

# Name of sheet with latest LSOA population by 15 year age bands
pop_lsoa_age_band_sheet <- "Mid-2020 Persons"

# READ -------------------------
# Note: Manually downloaded from ONS for now

pop_lsoa_age_band <- read_xlsx(
  path = str_c(data_in_folder, "/", pop_lsoa_file), 
  sheet = pop_lsoa_age_band_sheet, 
  skip = 4)

# TRANSFORM ---------------------

pop_lsoa_age_band <- pop_lsoa_age_band %>% 
  filter(`LA name (2021 boundaries)` == "Sheffield") %>% 
  select(-starts_with("LA")) %>% 
  pivot_longer(cols = -starts_with("LSOA"),
               names_to = "Age band",
               values_to = "Population")

# WRITE --------------------------

usethis::use_data(pop_lsoa_age_band, compress = "xz", overwrite = T)