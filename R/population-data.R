#' Get a Sheffield population data frame
#'
#' \code{get_pop_df} returns the Sheffield population data frame specified in  
#' its argument.
#'
#' Call \code{list_all_pop_dfs} for a list of valid arguments. Call 
#' \code{load_all_pop_dfs} to load all Sheffield population data frames and 
#' browse for the data frame of interest. 
#'
#' @param df_name Data frame name (character string; e.g. "df_pop_la_age").
#' @return Data frame.
#'
#' @examples
#' df_age <- get_pop_df("df_pop_la_age")
#'
#' @export
#' @importFrom readr read_rds
#' @importFrom stringr str_c
get_pop_df <- function(df_name){
  read_rds(str_c("data/", df_name, ".rds"))
}

#' Load a Sheffield population data frame
#'
#' \code{load_pop_df} loads the Sheffield population data frame specified in  
#' its argument to a variable with the same name.
#'
#' Call \code{list_all_pop_dfs} for a list of valid arguments. Call 
#' \code{load_all_pop_dfs} to load all Sheffield population data frames and 
#' browse for the data frame of interest. 
#'
#' @inheritParams get_pop_df
#' @return none
#'
#' @examples
#' load_pop_df("df_pop_la_age")
#'
#' @export
load_pop_df <- function(df_name){
  assign(df_name, get_pop_df(df_name), envir = .GlobalEnv)
}

#' Get a list of the Sheffield population data frames available
#'
#' \code{list_all_pop_dfs} lists the Sheffield population data frames to 
#' predefined variable name.
#'
#' Call \code{load_all_pop_dfs} to load all Sheffield population data frames.
#'
#' @return Vector of characters.
#'
#' @examples
#' print(list_all_pop_dfs())
#'
#' @export
#' @importFrom fs dir_ls
#' @importFrom magrittr %>%
#' @importFrom stringr str_sub
list_all_pop_dfs <- function(){
  dir_ls("data", glob = "*.rds") %>% 
    basename() %>% 
    str_sub(1, -5)
}

#' Load all of the Sheffield population data frames
#'
#' \code{load_all_pop_dfs} loads all the Sheffield population data frames    
#' to predefined variable names.
#'
#' Call \code{list_all_pop_dfs} for a list of the variable names that will be 
#' created as sheffield population data frames.
#'
#' @return none
#'
#' @examples
#' print(list_all_pop_dfs())
#'
#' @export
#' @importFrom purrr walk
load_all_pop_dfs <- function(){
  walk(list_all_pop_dfs(), load_pop_df)    
}