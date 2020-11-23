#load the librarys 
library(tidyverse)
library(nycflights13)
library(gapminder)
library(Lahman)
library(maps)
library(mapproj)

#Set and check the working directories
setwd("C:/Users/Owner/Desktop/R Projects/Chapter 4 - Workflow Basics")
getwd()

1/200 * 30

sin(pi / 2)

x <- 2 + 2

x

this_is_a_really_long_name <- 2.5

this_is_a_really_long_name

r_rocks <- 2 ^ 3

seq(1,10)

x <- "hello world"

y <- seq(1 ,10 , length.out = 5)

library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

filter(mpg, cyl == 8)
filter(diamonds, carat > 3)

my_variable <- 10
my_variable

