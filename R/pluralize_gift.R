#' Takes a noun and makes it plural
#'
#' @param gift A string or vector of strings
#'
#' @return A string or vector of strings with the pluralized words
#'
#' @import stringr
#' @import dplyr
#' @import glue
#' @import purrr
#'
#' @export

# DEBUG
#library(tidyverse)
#xmas <- read.csv(here::here("../xmas.csv"))
#gift <- xmas$Gift.Item


pluralize_gift <- function(gift){

gift <- gift %>%
  str_replace("$", "s") %>%
  str_replace("ys$", "ies") %>%
  str_replace("gooses", "geese")

return(gift)

}

# Test function
#pluralize_gift(xmas$Gift.Item)


