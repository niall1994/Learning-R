#load the librarys 
library(tidyverse)
library(nycflights13)
library(gapminder)
library(Lahman)
library(maps)
library(mapproj)

install.packages("maps")
install.packages("mapproj")
#update to tidy verse
tidyverse_update()

#Set and check the working directories
setwd("C:/Users/Owner/Desktop/R Projects/Chapter 1")
getwd()

#mpg data frame
mpg
?mpg
vignette("ggplot2-specs")

#Make a scatter plot
ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy))
?geom_point

#Exercises 1
ggplot(mpg)

mtcars
nrow(mtcars)
ncol(mtcars)

ggplot(data = mpg) + geom_point(mapping = aes(x = cyl, y = hwy))
ggplot(data = mpg) + geom_point(mapping = aes(x = class, y = drv))

#Changing Aesthitic parts of the graph
ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy , color = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy , size = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy , alpha = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy , shape = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy),color = "green")

#Exercises 2
ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy , color = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = drv , color = hwy))

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy , size = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = drv , size = hwy))

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy , shape = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = drv , shape = hwy))

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy , color = cty))

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy , color = cty < 10))

#facets
ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy)) +
        facet_wrap(~class, nrow = 2)

?facet_wrap
?facet_grid

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy)) +
  facet_wrap(~class, nrow = 2)

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy)) +
  facet_grid(drv~cyl)

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy)) +
  facet_grid(.~cyl)

#Exercises 3
ggplot(data = mpg) + geom_point(mapping = aes(x = cty , y = hwy)) +
  facet_wrap(~displ, nrow = 2)

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy)) +
  facet_grid(drv~cyl)

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy))


#geometric objects

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy , linetype = drv))

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_wrap(~drv, nrow = 1)

ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy , linetype = drv , color = drv)) + 
                      geom_point(mapping = aes(x = displ, y = hwy , color = drv))

ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy , group = drv))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy , color = drv)) + 
           geom_point() + geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(aes(color = class)) + geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ , y = hwy)) +
            geom_point(aes(color = class)) +
            geom_smooth(data = filter(mpg, class == "subcompact"))


#Exercise 4

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + geom_line()

ggplot(data = mpg, mapping = aes(x = displ, y = drv)) + geom_boxplot()

?geom_histogram
ggplot(data = mpg, mapping = aes(x = displ)) + geom_histogram(bins = 10)


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + geom_area()

ggplot(data = mpg, aes(x = displ , y = hwy, color = drv)) + geom_point() + geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy) , show.legend = FALSE) + 
  geom_point(aes(color = class) , show.legend = FALSE) + geom_smooth()

#Code to recreate graphs
ggplot(data = mpg , aes(x = displ , y = hwy)) + geom_smooth(se = FALSE) + geom_point()

ggplot(data = mpg , aes(x = displ , y = hwy)) + geom_smooth(aes(group = drv),se = FALSE) + geom_point()

ggplot(data = mpg , aes(x = displ , y = hwy , color = drv)) + geom_smooth(,se = FALSE) + geom_point()

ggplot(data = mpg , aes(x = displ , y = hwy)) + geom_smooth(se = FALSE) + geom_point(aes(color = drv))

ggplot(data = mpg , aes(x = displ , y = hwy)) + geom_smooth(aes(linetype = drv) , se = FALSE) + geom_point(aes(color = drv))

ggplot(data = mpg , aes(x = displ , y = hwy)) + geom_point(aes(color = drv) , shape = 1)


#Statistical Transformations
diamonds
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut))
?geom_bar

ggplot(data = diamonds) + stat_count(mapping = aes(x = cut))

demo<- tribble(~a, ~b , "bar1" , 20 , "bar2" , 30 , "bar3" , 40)
ggplot(data = demo) + geom_bar(mapping = aes(x = a, y = b) , stat = "identity")

ggplot(data = demo) + geom_bar(mapping = aes(x = a))

ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, y = ..prop.. , group = 1))

ggplot(data = diamonds) + stat_summary(mapping = aes(x = cut, y = depth), fun.ymin = min, fun.ymax = max, fun.y = median)

?stat_summary
?geom_pointrange

ggplot(data = diamonds, mapping = aes(x = cut, y = depth)) + geom_pointrange(mapping = aes(ymin = depth , ymax = depth))

#Position Adjustments
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut , color = cut))

ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = cut))

ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity) , alpha = 1/5 , position = "identity")

ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut , color = clarity) , fill = NA , alpha = 1/5 , position = "identity")

ggplot(data = diamonds , mapping = aes(x = cut , fill = clarity)) + geom_bar(position = "fill")

ggplot(data = diamonds , mapping = aes(x = cut , fill = clarity)) + geom_bar(position = "dodge")

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy) , position = "jitter")

#Exercises 4 
ggplot(data = mpg , mapping = aes(x = cty, y = hwy)) + geom_point()

ggplot(data = mpg, mapping = aes(x = cty , y = hwy)) + geom_jitter(width = 0.2)

?geom_jitter

ggplot(data = mpg , mapping = aes(x = cty , y = hwy)) + geom_count()

?geom_count

?geom_boxplot

ggplot(data = mpg) + geom_boxplot(aes(x = cty , hwy , color = class) , position = "dodge2")

ggplot(data = mpg, mapping = aes(x = class , y = hwy)) + geom_boxplot() + coord_flip()

nz <- map_data("nz")
ggplot(data = nz , aes(long , lat , group = group)) + geom_polygon(fill = "white" , color = "black") + 
        coord_quickmap()

ggplot(data = diamonds , mapping = aes(x = cut , fill = cut)) + geom_bar() +
           coord_flip() + 
           coord_polar()

#Exercises number 5

ggplot(data = diamonds , mapping = aes(x = cut)) + geom_bar(aes(fill = clarity) , position = "fill") + 
       coord_polar()

?labs

#map of new zealand
nz <- map_data("nz")
ggplot(data = nz , aes(long , lat , group = group)) + geom_polygon(fill = "white" , color = "black") + 
  coord_quickmap()


ggplot(data = nz , aes(long , lat , group = group)) + geom_polygon(fill = "white" , color = "black") + 
  coord_map()

?coord_map

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
          geom_point() + 
          geom_abline() + 
          coord_fixed()

?geom_abline
?coord_fixed


#the layered gramer of graphics
ggplot(data = diamonds) + stat_count(mapping = aes(x = cut))


#code layout for grpahs
ggplot(data = diamonds) + geom_point(mapping = aes(x = cut, y = clarity) , stat = "identity" , position = "identity") + 
    coord_fixed() + 
    facet_null()
