library(tidyverse)
library(nycflights13)

flights

view(flights)

#comparisons

1/49 * 49 == 1

?near
near(1/49 * 49 , 1)

#filter

filter(flights, month == 1 , day == 1)

filter(flights, month == 11 | month == 12)

filter(flights , month %in% c(11,12))

df <- tibble(x = c(1 , NA , 3))
filter(df, x > 1)

?flights

filter(flights , arr_delay >= 120)
filter(flights , dest == "IAH" | dest == "HOU")
filter(flights, carrier %in% c("UA","DL","AA"))
filter(flights , month %in% c(7,8,9))
filter(flights , arr_delay > 120 & dep_delay == 0)
filter(flights , dep_delay > 60 & arr_delay < 30)
filter(flights , sched_dep_time >= 000 & sched_dep_time <= 600)

?between

filter(flights, between(sched_dep_time , 000 , 600))

view(filter(flights , is.na(dep_time)))

#arrange

arrange(flights , year , month , day)

select(arrange(flights , desc(arr_delay)) , arr_delay)

arrange(flights , !is.na(dep_time))

arrange(flights , desc(dep_delay))

arrange(flights , dep_time)

arrange(flights , air_time)

#select

select(flights , year , month , day)

select(flights , -year)

#starts_with() , ends_with() , contains(), matches() , num_range()

rename(flights , tail_num = tailnum)
rename(flights , arrtime = arr_time)

?one_of

select(flights , contains("TIME"))

#mutate

flights_sml <- select(flights , year:day , ends_with("delay") , distance , air_time)
flights_sml

mutate(flights_sml , gain = arr_delay - dep_delay , speed = distance / air_time * 60)

mutate(flights_sml , gain = arr_delay - dep_delay , hours = air_time / 60 , gain_per_hour = gain / hours)

transmute(flights , gain = arr_delay - dep_delay , hours = air_time / 60 , gain_per_hour = gain / hours)

transmute(flights , dep_time , hour = dep_time %/% 100 , minute = dep_time %% 100)

x <- 1:10

lag(x)
lead(x)

x
cumsum(x)
cummean(x)
mean(x)

y <- c(1 , 2, 2 , 2 , 4 , 5)
min_rank(y)
percent_rank(y)
cume_dist(y)

#exercise 3 

transmute(flights, dep_time , sched_dep_time)
transmute(flights , dep_time_hours = dep_time %/% 100 , 
                    dep_time_minutes = dep_time %% 100 ,
                    dep_time_minuts_midnight = dep_time_hours * 60 + dep_time_minutes ,
                    arr_time_hours = arr_time %/% 100 ,
                    arr_time_minutes = arr_time %% 100 ,
                    arr_time_minutes_midnight = arr_time_hours * 60 + arr_time_minutes)

select(flights , air_time , arr_time , dep_time)

mutate(select(flights , air_time , arr_time , dep_time) , diff = arr_time - dep_time)

mutate(select(flights , dep_time , sched_dep_time , dep_delay) , diff = dep_time - sched_dep_time)

min_rank(select(flights , dep_delay))

1:3 + 1:10


#summarize

summarize(flights , delay = mean(dep_delay , na.rm = TRUE))

by_day <- group_by(flights , year , month , day)
summarize(by_day , delay = mean(dep_delay , na.rm = TRUE))

by_dest <- group_by(flights , dest)
summar <- summarize(by_dest , count = n() , dist = mean(distance , na.rm = TRUE) ,
                                             delay = mean(arr_delay, na.rm = TRUE))

ggplot(data = summar , mapping = aes(x = dist , y = delay)) + 
      geom_point(aes(size = count) , alpha = 1/3) +
      geom_smooth(se = FALSE)

ggplot(data = summar , mapping = aes(x = dist , y = delay)) + 
        geom_point(position = "jitter")

#using the pipe
delays <- flights %>%
          group_by(dest) %>%
          summarize(count = n() , dist = mean(distance ,na.rm = TRUE) , delay = mean(arr_delay , na.rm = TRUE)) %>%
          filter(count > 20 , dest != "HNL")

not_cancelled <- flights %>% filter(!is.na(dep_delay) , !is.na(arr_delay))

not_cancelled %>% group_by(year , month , day) %>%
                  summarize(mean = mean(dep_delay))

delays <- not_cancelled %>% 
          group_by(tailnum) %>%
          summarize(delay = mean(arr_delay))

ggplot(data = delays , mapping = aes(x = delay)) +
         geom_freqpoly(binwidth = 10) + 
         geom_histogram(binwidth = 10)
?geom_freqpoly

delays <- not_cancelled %>%
         group_by(tailnum) %>%
         summarize(delay = mean(arr_delay , na.rm = TRUE) , n = n())

ggplot(data = delays , mapping = aes(x = n , y = delay)) +
        geom_point(alpha = 1/10)

delays %>% filter(n > 30) %>%
           ggplot(mapping = aes(x = n, y = delay)) +
           geom_point(alpha = 1/10)

batting <- as_tibble(Lahman::Batting)

batters <- batting %>% 
           group_by(playerID) %>%
           summarize(
             ba = sum(H , na.rm = TRUE) / sum(AB , na.rm = TRUE) ,
             ab = sum(AB , na.rm = TRUE))
           
batters %>% 
        filter(ab > 100) %>%
        ggplot(mapping = aes(x = ab , y = ba)) +
        geom_smooth(se = FALSE) +
        geom_point()

batters %>% arrange(desc(ba))

not_cancelled %>% count(dest)
not_cancelled %>% group_by(dest) %>% summarize(n = n())

not_cancelled %>% count(tailnum , wt = distance)

not_cancelled %>% group_by(tailnum) %>% summarize(dist = sum(distance))


