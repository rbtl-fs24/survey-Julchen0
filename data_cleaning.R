library(tidyverse)
library(googlesheets4)
answers <- read_sheet("https://docs.google.com/spreadsheets/d/1vmt7BuO3CydcjQMOkMKO2Eh7HpEikcAUDehq-iFQHTY/edit?resourcekey#gid=735722782")
glimpse(answers)
answers |> 
  mutate(recycled_waste_personal = case_when(
    "If yes, select which type of waste you recycle" == "paper, glass, metal, plastic, electronics, organic waste" ~ "all",
    "If yes, select which type of waste you recycle" != "paper, glass, metal, plastic, electronics, organic waste" ~ "not all"
  ))


answers_processed <- answers
answers_processed[14] <- NULL

write.csv(answers_processed, "data/processed/answers-processed.csv")
write_rds(answers_processed, "data/processed/answers-processed.rds")


