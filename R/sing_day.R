#' Takes a noun and makes it plural
#'
#' @param dataset A data frame containing information about gifts
#' @param line The number of the line for the day you want to sing about
#' @param phrase_col The variable name for the column in the dataset that
#' contains the gift phrases
#'
#' @return A string singing the line of the song with all gifts for the given day.
#'
#' @import stringr
#' @import dplyr
#' @import glue
#' @import purrr
#' @import english
#'
#' @export

# DEBUG
# library(tidyverse)
# library(english)
# dataset <- xmas
# phrases <- xmas$Lyric
# line <- 4


sing_day <- function(dataset, line, phrase_col){

  # Preamble lyrics
  out <- glue::glue("On the {english::ordinal(line)} day of Christmas, my true love gave to me: \n")

  # The list of gifts
  phrases <- dataset %>% pull({{phrase_col}})

  if(line > 1) {
    out <- paste(out,
            paste(phrases[line:2], sep="\n", collapse="\n"),
            sep="\n", collapse="")
    out <- paste(out, "and ", sep="\n")
  }
  out <- paste(out, phrases[1], ".")
  return(out)
}

# TEST

# Sing a day:
# sing_day(dataset=xmas, line=4, phrase_col=Lyric)
