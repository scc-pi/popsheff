#' City population from 2001 to 2020.
#'
#' Sheffield population estimates provided by the ONS.
#'
#' @format A data frame with two variables: \code{Year} and \code{Population}.
"pop_la_yrs"

#' City median age from 2001 to 2020.
#'
#' Sheffield population estimates provided by the ONS.
#'
#' @format A data frame with two variables: \code{Year} and \code{Median age}.
"pop_la_median_age"

#' City population by age (2020).
#'
#' Sheffield population estimates provided by the ONS.
#'
#' @format A data frame with two variables: \code{Age} and \code{Persons}.
"pop_la_age"

#' City male population by age (2020).
#'
#' Sheffield population estimates provided by the ONS.
#'
#' @format A data frame with two variables: \code{Age} and \code{Males}.
"pop_la_age_male"

#' City female population by age (2020).
#'
#' Sheffield population estimates provided by the ONS.
#'
#' @format A data frame with two variables: \code{Age} and \code{Females}.
"pop_la_age_female"

#' City population by age and gender from 2000 to 2020.
#'
#' Sheffield population estimates provided by the ONS.
#'
#' @format A data frame with four variables: \code{Gender}, \code{Age},
#' \code{Year} and \code{Persons}.
"pop_la_yrs_age_gender"

#' LAC population by age (2020).
#'
#' Local Area Committee population aggregated from ONS Ward data. LACs have the
#' same boundaries as ASC (Adult Social Care) localities.
#'
#' @format A data frame with five variables: \code{ca_name}, 
#' \code{ca_number}, \code{asc_name}, \code{Age} and \code{Persons}.
"pop_lac_age"

#' LAC male population by age (2020).
#'
#' Local Area Committee male population aggregated from ONS Ward data. LACs have 
#' the same boundaries as ASC (Adult Social Care) localities.
#'
#' @format A data frame with five variables: \code{ca_name}, 
#' \code{ca_number}, \code{asc_name}, \code{Age} and \code{Males}.
"pop_lac_age_male"

#' LAC female population by age (2020).
#'
#' Local Area Committee female population aggregated from ONS Ward data. LACs  
#' have the same boundaries as ASC (Adult Social Care) localities.
#'
#' @format A data frame with five variables: \code{ca_name}, 
#' \code{ca_number}, \code{asc_name}, \code{Age} and \code{Females}.
"pop_lac_age_female"

#' LAC population between 2001 and 2020.
#'
#' Sheffield population estimates provided by the ONS.
#'
#' @format A data frame with five variables: \code{ca_name}, \code{ca_number}, 
#' \code{asc_name}, \code{Year} and \code{Persons}.
"pop_lac_yrs"

#' LAC population by age and gender between 2001 and 2020.
#'
#' Sheffield population estimates provided by the ONS.
#'
#' @format A data frame with seven variables: \code{ca_name}, \code{ca_number}, 
#' \code{asc_name}, \code{Year}, \code{Age}, \code{Gender} and \code{Persons}.
"pop_lac_yrs_age_gender"

#' Ward population by age (2020).
#'
#' Sheffield population estimates provided by the ONS.
#'
#' @format A data frame with four variables: \code{Ward Code}, 
#' \code{Ward Name}, \code{Age} and \code{Persons}.
"pop_ward_age"

#' Ward male population by age (2020).
#'
#' Sheffield population estimates provided by the ONS.
#'
#' @format A data frame with four variables: \code{Ward Code}, 
#' \code{Ward Name}, \code{Age} and \code{Males}.
"pop_ward_age_male"

#' Ward female population by age (2020).
#'
#' Sheffield population estimates provided by the ONS.
#'
#' @format A data frame with four variables: \code{Ward Code}, 
#' \code{Ward Name}, \code{Age} and \code{Females}.
"pop_ward_age_female"

#' Ward population between 2001 and 2020.
#'
#' Sheffield population estimates provided by the ONS.
#'
#' @format A data frame with four variables: \code{Ward Code}, 
#' \code{Ward Name}, \code{Year} and \code{Persons}.
"pop_ward_yrs"

#' Ward population by age and gender between 2001 and 2020.
#'
#' Sheffield population estimates provided by the ONS.
#'
#' @format A data frame with six variables: \code{Ward Code}, \code{Ward Name},  
#' \code{Year}, \code{Age}, \code{Gender} and \code{Persons}.
"pop_ward_yrs_age_gender"

#' Neighbourhood population by age (2020).
#'
#' Sheffield neighbourhood population estimates provided by Dale.
#'
#' @format A data frame with four variables: \code{nhood_code}, 
#' \code{nhood_name}, \code{Age} and \code{Persons}.
"pop_nhood_age"

#' Neighbourhood male population by age (2020).
#'
#' Sheffield neighbourhood population estimates provided by Dale.
#'
#' @format A data frame with four variables: \code{nhood_code}, 
#' \code{nhood_name}, \code{Age} and \code{Males}.
"pop_nhood_age_male"

#' Neighbourhood female population by age (2020).
#'
#' Sheffield neighbourhood population estimates provided by Dale.
#'
#' @format A data frame with four variables: \code{nhood_code}, 
#' \code{nhood_name}, \code{Age} and \code{Females}.
"pop_nhood_age_female"

#' Neighbourhood population by age between 2017 and 2020.
#'
#' Sheffield neighbourhood population estimates provided by Dale.
#'
#' @format A data frame with four variables: \code{nhood_code}, 
#' \code{nhood_name}, \code{Year}, \code{Age} and \code{Persons}.
"pop_nhood_yrs_age"

#' Neighbourhood population by age and gender between 2017 and 2020.
#'
#' Sheffield neighbourhood population estimates provided by Dale.
#'
#' @format A data frame with four variables: \code{nhood_code}, 
#' \code{nhood_name}, \code{Year}, \code{Age}, \code{Gender} and \code{Persons}.
"pop_nhood_yrs_age"

#' LSOA population by fifteen year age bands.
#'
#' Sheffield population provided by the ONS. 2020 mid-year estimates.
#'
#' @format A data frame with four variables: \code{LSOA Code}, \code{LSOA Name},
#'   \code{Age band} and \code{Population}.
"pop_lsoa_age_band"

#' Lookup for Wards and LACs
#'
#' Four Sheffield Wards in each LAC (same boundaries as ASC Localities)
#'
#' @format A data frame with four variables: \code{Ward Code}, \code{ca_name},
#'   \code{ca_number} and \code{asc_name}.
"lkup_ward_lac"