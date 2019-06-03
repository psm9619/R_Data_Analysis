install.packages("ggplot2")
library(ggplot2)
library(dplyr)
mpg


#1
d_4 <- mpg %>%
  select(displ, hwy) %>%
  filter(displ <= 4) %>%
  summarise (average = mean(hwy, na.rm=T))  ; d_4  
d_5 <- mpg %>%
  select (displ, hwy) %>%
  filter(displ >= 5) %>%
  summarise (average = mean(hwy, na.rm=T))  ; d_5

higher <- function(a, b) {
  if (a>b) {result <- a}
  else {result<- b}
  return (result)
}
higher (d_4, d_5)
  
#2
audi <- mpg %>%
  select(manufacturer, cty) %>%
  filter(manufacturer %in% 'audi') %>%
  summarise (average = mean(cty, na.rm=T)) ; audi
toyota <- mpg %>%
  select(manufacturer, cty) %>%
  filter(manufacturer %in% 'toyota') %>%
  summarise (average = mean(cty, na.rm=T)) ; toyota
higher (audi, toyota)


#3
avg_hwy <- mpg %>%
  select(manufacturer, hwy) %>%
  summarise (average = mean(hwy, na.rm=T)) ; avg_hwy
  
#4
part_mpg <- select(mpg, class, cty) ; part_mpg
  
#5
suv <- part_mpg %>%
  filter(class == 'suv') %>%
  summarise(average = mean(cty, na.rm=T)) ; suv
compact <- part_mpg %>%
  filter(class == 'compact') %>%
  summarise(average = mean(cty, na.rm=T)) ; compact

#6
audi_5 <- mpg %>%
  select(manufacturer, hwy) %>%
  filter(manufacturer %in% 'audi') %>%
  arrange(desc(hwy)) %>%
  head(5) ; audi_5

#7
efficiency_avg_3 <- copy_mpg %>%
  mutate(합산연비변수 = hwy+cty) %>%
  mutate(평균연비변수 = 합산연비변수/2) %>%
  arrange(desc(평균연비변수)) %>%
  head(5) # head(n) 위에서부터 n개의 데이터를 출력하라
efficiency_avg_3

#8
cty_avg <- mpg %>%
  group_by(class) %>%
  summarise(avg = mean(cty, na.rm=T)) ; cty_avg

#9
cty_avg_rearranged <- cty_avg %>%
  arrange(desc(avg)) ; cty_avg_rearranged

#10
hwy_avg_3 <- mpg%>%
  group_by (manufacturer) %>%
  summarise(hwy_avg = mean(hwy, na.rm = T)) %>%
  head(3) ; hwy_avg_3

#11
compact_count <- mpg%>%
  filter(class == 'compact') %>%
  group_by (manufacturer) %>%
  summarise(cpt_number = n()) %>%
  arrange(desc(cpt_number))  ; compact_count 












 

  








  








