library('tidyverse')
library('lubridate')
#Convert a regular DF to a tibble
as_tibble(iris)

#Create a new Tibble
tibble(
  x = 1:5,
  y=1,
  z = x^2 + y
)

#Use special characters in the name of a column
tibble(
  ':)' = "Smile",
  ' ' = "space",
  '2000' = "number"
)

#Useing tribble (Transposed tibble)

tribble(
  ~x,~y,~z,
#---/--/--
  "a",2,3.6,
  "b",1,8.5
)

#Printing Tibbles

tibble(
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::now() + runif(1e3) *30,
  c = 1:1e3,
  d = runif(1e3),
  e =sample(letters, 1e3, replace = TRUE)
)

#Printing more data
nycflights13::flights %>%
    print(n = 10, width = Inf)

#Extracting Elements
df <- tibble(
  x = runif(5),
  y = runif(5)
)

df$x
df[["x"]]

df[[1]]

#Extracting using the Pipe
df %>% .$x
df %>% .[["x"]]

