# HEADER ---------------------
# Description:  Copy output files from a local folder to a network folder
#               to  share with the rest of the team
# Author: Laurie Platt


# share df_pop_lsoa_20.rds ----
fs::file_copy(
  "data-out/df_pop_lsoa_20.rds",
  stringr::str_c(
    "S:/Public Health/Policy Performance Communications/",
    "Business Intelligence/Projects/AdultSocialCare/ASC_SNA/data/",
    "df_pop_lsoa_20.rds"),
  overwrite = TRUE)

# local ASC_SNA df_pop_lsoa_20.rds ----
fs::file_copy(
  "data-out/df_pop_lsoa_20.rds",
  stringr::str_c(
    "C:/Users/lp41455/OneDrive - Sheffield City Council/Repo/ASC_SNA/data/",
    "df_pop_lsoa_20.rds"),
  overwrite = TRUE)