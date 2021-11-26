#' @export
#' @importFrom readr read_rds
#' @importFrom stringr str_c
get_pop_df <- function(df_name){
  read_rds(str_c("data/", df_name, ".rds"))
}

#' @export
load_pop_df <- function(df_name){
  assign(df_name, get_pop_df(df_name), envir = .GlobalEnv)
}

#' @export
#' @importFrom fs dir_ls
#' @importFrom magrittr %>%
#' @importFrom stringr str_sub
list_all_pop_dfs <- function(){
  dir_ls("data", glob = "*.rds") %>% 
    basename() %>% 
    str_sub(1, -5)
}

#' @export
#' @importFrom purrr walk
load_all_pop_dfs <- function(){
  walk(list_all_pop_dfs(), load_pop_df)    
}