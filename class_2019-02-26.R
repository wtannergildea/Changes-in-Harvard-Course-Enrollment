library(dplyr)
library(tidyverse)
library(ggplot2)
library(janitor)
library(readxl)

enrollment_data <- read_excel("class_enrollment_summary_by_term_2.26.19.xlsx", skip = 3)

enrollment_data <- clean_names(enrollment_data) %>% 
  select(!na.rm(course_name))

#remove where course_name is NA
View(enrollment_data)