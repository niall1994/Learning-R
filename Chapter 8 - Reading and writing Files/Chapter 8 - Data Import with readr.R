library(tidyverse)

#Read function summaries
#read_csv (Csv FIles)
#Read_csv2 (Csv files seperated by ;)
#read_tsv (Tab seperated)
#read_delim (delimeter set in function)
#read_fwf(fixed width files)
#read_log(Apache Style log files)

#Example (Can also give it a location)
read_csv("a,b,c
         1,2,3
         4,5,6")

#Skipping Meta Data
read_csv("The first line of meta data
         The second line of meta data
         x,y,z
         1,2,3", skip = 2)

read_csv("# A comment in the input file
         x,y,z
         1,2,3", comment = "#")

#No Column names in the data
read_csv("1,2,3\n4,5,6", col_names = FALSE)

read_csv("1,2,3\n4,5,6", col_names = c("x","y","z"))

#Character that represents Missing Values
read_csv("a,b,c\n1,2,.", na = ".")

#Parsing a Vector
str(parse_logical(c("TRUE","FALSE","NA")))

str(parse_integer(c("1","2","3")))

str(parse_date(c("2010-01-01", "1979-10-14")))

#Challenges with Parsing Files
#Parsing is effectively casting
#Read_* gueses the parser based on the first 1000 rows

#Example of a challenging file to parse
challenge <- read_csv(readr_example("challenge.csv"))
problems(challenge)

challenge<-read_csv(readr_example("challenge.csv"),
                    col_types = cols( x = col_double(),
                                      y = col_character()))

challenge
tail(challenge)

#Writing Files
write_csv(challenge, "challenge.csv")

#Feather implements a fast binary data format that can be implemented across the boards