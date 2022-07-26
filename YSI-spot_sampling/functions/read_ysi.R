read_ysi <- function(path = path, skip = 7){
  
  library(tidyverse)
  library(janitor)
  library(here)
  
  data_as_is <-  read.csv(path, fileEncoding="UTF-16LE", skip = skip, na.strings=c(""," ","NA"))
  
  colnames(data_as_is) <- data_as_is[1,] %>%  unlist() %>% as.vector()
  
  clean_data <- data_as_is %>% 
    clean_names() %>% 
    filter(!is.na(date_mm_dd_yyyy)) %>% 
    filter(date_mm_dd_yyyy != "Date (MM/DD/YYYY)")
  
  print(clean_data)
  
}