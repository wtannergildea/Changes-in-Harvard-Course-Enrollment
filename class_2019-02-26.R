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

# number, name, 2018 enrollment, 2019 enrollment, arrange(desc(change))

joined_enrollment <- left_join(enrollment_data_2018, enrollment_data_2019, by = "course_id", suffix = c(".2018", ".2019")) %>% 
  filter(! is.na(total.2019)) %>% 
  mutate(enrollment_difference = (u_grad.2019 - u_grad.2018)) %>% 
  select(course_title.2018, course_name.2018, u_grad.2018, u_grad.2019, enrollment_difference) %>% 
  arrange(enrollment_difference) %>% 
  slice(1:10)

View(joined_enrollment)