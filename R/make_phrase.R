#' Takes a noun and makes it plural
#'
#' @param num An integer
#' @param num_word A string corresponding to the integer
#' @param item A string
#' @param verb A string
#' @param adjective A string
#' @param location A string
#'
#' @return A string containing the words in grammatical order.
#'
#' @import stringr
#' @import glue
#' @import dplyr
#' @import purrr
#'
#' @export

# DEBUG
# library(tidyverse)
# num <- xmas$Day
# num_word <- xmas$Day.in.Words
# item <- xmas$Gift.Item
# verb <- xmas$Verb
# adjective <- xmas$Adjective
# location <- xmas$Location


make_phrase <- function(num, num_word, item, verb, adjective, location){

  # Pluralize nouns
  multiple <- ifelse(num > 1, TRUE, FALSE)
  item[which(multiple)] <- pluralize_gift(item[which(multiple)])

  # Replace NAs with blanks
  verb <- str_replace_na(verb, "")
  adjective <- str_replace_na(adjective, "")
  location <- str_replace_na(location, "")

  # Glue words
  glue::glue("{num} {adjective} {item} {verb}{location}")

}

# Test

#xmas <- xmas %>%
#  bind_cols(.,
#            phrase_col = make_phrase(xmas$Day, xmas$Day.in.Words, xmas$Gift.Item, xmas$Verb, xmas$Adjective, xmas$Location))
