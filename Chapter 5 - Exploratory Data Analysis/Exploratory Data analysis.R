install.packages("hexbin")
library(tidyverse)
library(nycflights13)
library(hexbin)
library(modelr)

ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut))

diamonds %>% count(cut)

ggplot(data = diamonds) + geom_histogram(mapping = aes(x = carat) , binwidth = 0.5)

diamonds %>% count(cut_width(carat , 0.5))

smaller <- diamonds %>% filter(carat < 3)

ggplot(data = smaller , mapping = aes(x = carat)) + geom_histogram(binwidth = 0.1)

ggplot(data = smaller , mapping = aes(x = carat , color = cut)) + geom_freqpoly(binwidth = 0.5)

ggplot(data = faithful , mapping = aes(x = eruptions)) + geom_histogram(binwidth = 0.25)

ggplot(data = diamonds , mapping = aes(x = price)) +
    geom_freqpoly(mapping = aes(color = cut) , binwidth = 500)

ggplot(diamonds) + geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds , mapping = aes( x = price , y = ..density..)) +
      geom_freqpoly(mapping = aes(color = cut) , binwidth = 500)

ggplot(data = diamonds , mapping = aes(x = cut , y = price)) +
      geom_boxplot()

ggplot(data = mpg , mapping = aes(x = class , y = hwy)) +
      geom_boxplot()

ggplot(data = mpg) + 
    geom_boxplot(mapping = aes(x = reorder(class , hwy , FUN = median) , y = hwy))

ggplot(data = mpg) + geom_boxplot(mapping = aes(x = reorder(class , hwy , FUN = median) , y = hwy)) +
      coord_flip()

flights %>% mutate(cancelled = is.na(dep_time) ,
                   sched_hour = sched_dep_time %/% 100,
                   sched_min = sched_dep_time %% 100 ,
                   sched_dep_time = sched_hour + sched_min/60) %>%
            ggplot(mapping = aes(sched_dep_time)) +
            geom_freqpoly(mapping = aes(color = cancelled , y = ..density..) , binwidth = 1/4)

diamonds %>% ggplot(mapping = aes(x = reorder(clarity , price , FUN = median), y =  price)) +
              geom_boxplot()


diamonds %>% ggplot(mapping = aes(x = reorder(cut , price , FUN = median), y =  price)) +
  geom_boxplot()


diamonds %>% ggplot(mapping = aes(x = reorder(color , price , FUN = median), y =  price)) +
  geom_boxplot()


ggplot(data = diamonds , mapping = aes( x = price)) +
  geom_freqpoly(mapping = aes(color = cut) , binwidth = 500)

ggplot(data = diamonds , mapping = aes(x = price , y = cut)) + geom_violin()

ggplot(diamonds , mapping = aes(x = x , y = y)) + geom_point()

ggplot(data = diamonds) + geom_count(mapping = aes(x = cut , y = color))

diamonds %>% count(color , cut) %>%
      ggplot(mapping = aes(x = color , y = cut)) + 
      geom_tile(mapping = aes(fill = n))

ggplot(data = diamonds) + geom_point(mapping = aes(x = carat , y = price))

ggplot(data = smaller) + geom_bin2d(mapping = aes(x = carat , y = price))

ggplot(data = smaller) + geom_hex(mapping = aes(x = carat , y = price))

ggplot(data = smaller, mapping = aes(x = price , y = carat)) +
    geom_boxplot(mapping = aes(group=(cut_width(carat,0.1)))) 

ggplot(data = faithful) + geom_point(mapping = aes(x = eruptions , y = waiting))

mod <- lm(log(price) ~ log(carat) , data = diamonds)

diamonds2 <- diamonds %>% 
            add_residuals(mod) %>%
            mutate(resid = exp(resid))

ggplot(diamonds2) + geom_point(mapping = aes(x = carat , y = resid))

ggplot(data = diamonds2) + geom_boxplot(mapping = aes(x = cut , y = resid))