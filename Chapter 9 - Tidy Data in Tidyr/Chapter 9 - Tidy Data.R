library(tidyverse)

#Example
table1
table2
table3
table4a
table4b

#Tidy data = 
#all variables have theior own column
#all observations have their own rows
#all values have their own cell

#Gather Function - When one Variable is spread across multiple columns
table4a
table4a %>%
    gather('1999','2000', key = "Year", value = "Cases")

#Spreading - When a variable is spread across multiple rows
table2
table2 %>% 
    spread(key = type, value = count)

#Gather makes Wide tables longer and thinner
#Spread makes long tables wider and shorter

#Seperate and unite
table3

#Seperate splits one column into two
table3 %>%
  separate(rate, into = c("cases","population"), convert = TRUE, sep = "/")

#Unite Combines Multiple Columns into one column
table5 
unite(table5, new, century, year)

#Case Study
case_data = who

#all variables after year are variables
case_data <- who %>%
                  gather(new_sp_m014:newrel_f65,
                         key = "key", 
                         value = "cases",
                         na.rm = TRUE)

case_data2 <- case_data %>% 
              mutate(key = str_replace(key,"newrel","new_rel"))

#Split the columns at the underscore
case_data3 <- case_data %>% separate(key, c("new","type","sexage"), sep = "_")

#Remove redundant columns
case_data4 <- case_data3 %>%
                select(-new,-iso2,-iso3)

#Split agesex into age and sex
case_data5 <- case_data4 %>%
                separate(sexage, c("sex","age"), sep = 1)

#All in one pipe
who %>% 
        gather(new_sp_m014:newrel_f65, key = "key", value = "cases", na.rm = TRUE) %>% 
        mutate(key = str_replace(key,"newrel","new_rel")) %>% 
        separate(key,c("new","type","sexage"), sep = "_") %>% 
        select(-new,-iso2,-iso3) %>%
        separate(sexage,c("sex","age"), sep = 1)
    