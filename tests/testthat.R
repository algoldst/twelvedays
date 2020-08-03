#library(testthat)
#library(twelvedays)

#test_check("twelvedays")

library(tidyverse)
source(here::here("R/make_phrase.r"))
source(here::here("R/pluralize_gift.r"))
source(here::here("R/sing_day.r"))

# Read in the data for song lyrics
xmas <- read.csv(here::here("../xmas.csv"))

# Get the phrases into the df
xmas <- xmas %>%
  bind_cols(.,
            Lyric = make_phrase(
              num = xmas$Day,
              num_word = xmas$Day.in.Words,
              item = xmas$Gift.Item,
              verb = xmas$Verb,
              adjective = xmas$Adjective,
              location = xmas$Location
              )
            )

# Sing the song!
map(1:12, ~sing_day(dataset=xmas, line=., phrase_col=Lyric)) -> out


