library(ggplot2)
library(gridExtra)
library(dplyr)

data <- read.csv("연도별요양기관별보험청구금액_2004_2013_세로.csv")

f <- function(x) {
  x/1000000
}
data <- cbind(data[1], apply(data[2:10], 2, func))
data <- as.data.frame(data)
data

ad_lines <- function(plot, df, ...) {
  plot+
  geom_line(aes(x=df[,1], y=df[,2], color='red'), data=df) +
  geom_line(aes(x=df[,1], y=df[,4]), data=df) +
  geom_line(aes(x=df[,1], y=df[,3]), data=df) +
  geom_line(aes(x=df[,1], y=df[,4]), data=df) +
  geom_line(aes(x=df[,1], y=df[,5]), data=df) +
  geom_line(aes(x=df[,1], y=df[,6]), data=df) +
  geom_line(aes(x=df[,1], y=df[,7]), data=df) +
  geom_line(aes(x=df[,1], y=df[,8]), data=df) +
  geom_line(aes(x=df[,1], y=df[,9]), data=df) 
}
ad_points <- function(plot, df, ...) {
  plot+
    geom_point(aes(x=df[,1], y=df[,2]), data=df) +
    geom_point(aes(x=df[,1], y=df[,4]), data=df) +
    geom_point(aes(x=df[,1], y=df[,3]), data=df) +
    geom_point(aes(x=df[,1], y=df[,4]), data=df) +
    geom_point(aes(x=df[,1], y=df[,5]), data=df) +
    geom_point(aes(x=df[,1], y=df[,6]), data=df) +
    geom_point(aes(x=df[,1], y=df[,7]), data=df) +
    geom_point(aes(x=df[,1], y=df[,8]), data=df) +
    geom_point(aes(x=df[,1], y=df[,9]), data=df) 
}
plot2 <- ggplot(data) %>%
  ad_points(color='red')
plot2

plot1 <- ggplot(data) %>%
  ad_lines(color='red') + 
  ad_points(fill='red',color='red') +
  theme_classic()

plot1















