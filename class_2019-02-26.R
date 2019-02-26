library(dplyr)
library(tidyverse)
library(ggplot2)
library(janitor)
library(readxl)

enrollment_data_2019 <- read_excel("class_enrollment_summary_by_term_2.26.19.xlsx", skip = 3) %>% 
  clean_names() %>% 
  filter(! is.na(course_name))

enrollment_data_2018 <- read_excel("class_enrollment_summary_by_term_03.06.18.xlsx", skip = 3) %>% 
  clean_names() %>% 
  filter(! is.na(course_name))

View(enrollment_data_2019)
View(enrollment_data_2018)