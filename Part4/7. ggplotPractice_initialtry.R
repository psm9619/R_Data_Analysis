install.packages("dplyr")
install.packages("ggplot2")
install.packages("sqldf")
library (ggplot2)
library (dplyr)
mpg

#--------------------------------------------------------------------------
## 1.
ggplot(mpg, aes(x=cty, y=hwy)) +
  geom_point(colour = 'blue') + 
  labs(title = "Hwy vs. Cty") +
  theme_bw () +
  theme(panel.grid.major.x = element_line(colour='grey'),
        panel.grid.major.y = element_line(colour='grey'),
        panel.grid.minor.x = element_blank())

#--------------------------------------------------------------------------
## 2.
midwest
midwest_1 <- midwest %>%
  filter (poptotal <= 500000 ) %>%
  filter(popasian <= 10000) ;  midwest_1

ggplot(midwest_1, aes(x=poptotal, y=popasian)) +
  geom_point(colour = 'blue') + 
  labs(title = "Asian Population vs. Total Population") +
  theme_bw () +
  theme(panel.grid.major.x = element_line(colour='grey'),
        panel.grid.major.y = element_line(colour='grey'),
        panel.grid.minor.x = element_blank())


#--------------------------------------------------------------------------
## 3.
mpg
suv <- mpg %>%
  group_by(manufacturer)  %>%
  filter (class == 'suv') %>%
  summarise (mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>%
  head(5)
suv

rm(list=ls())

library(sqldf)
suv_1 <- sqldf("select manufacturer, avg(cty) as Avg_cty from mpg
      group by manufacturer
      order by avg(cty) desc
      limit 0,5")
suv_1


ggplot(suv_1, aes(x= reorder(manufacturer, -Avg_cty), y=Avg_cty, fill = manufacturer)) +
  geom_bar(stat='identity') + 
  ylim (0, 30) +
  ggtitle("Avg cty of suv comparison for top 5 manufacturers ")



#--------------------------------------------------------------------------
## 4. 
class_fq <- sqldf("select class, count(*) as frequency from mpg
      group by class
      order by count(class) desc")
class_fq

ggplot(class_fq, aes(x= reorder(class, -frequency), y=frequency)) +
  geom_bar(stat='identity', fill = 'cyan', alpha = 0.6) + 
  ggtitle("Avg cty of suv comparison for top 5 manufacturers ") +
  theme(axis.text.x = element_text(angle=135, hjust=1, vjust=1,
                                   color='black', size=5))

#### actually, System gives you count automatically lol
ggplot(mpg, aes(x=class, fill=class)) + 
  geom_bar()

#--------------------------------------------------------------------------
## 5.  시계열 그래프란 y vs. 시간 으로 라인 으로 연결만 시켜주면 자동적으로 시계열 그래프가 만들어짐 
economics
ggplot (economics, aes(x=date, y=psavert)) + 
  geom_line()


#--------------------------------------------------------------------------
## 6.  

diamonds

















  














