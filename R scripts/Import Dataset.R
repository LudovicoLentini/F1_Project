##Import Data

library(readr)
DB <- read_delim("Desktop/FORMULA1/DB.csv", 
                 ";", escape_double = FALSE, trim_ws = TRUE)
View(DB)


