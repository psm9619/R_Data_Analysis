# Anscombe's Qurtet
# 기술통계량 (평균(x), 평균(y), 분산(x), 분산(y), 상관계수, 회귀식) 이 동일한 4개의 data set

anscombe
str(anscombe)
# mean -> 평균 
ans_x_mean <- anscombe %>%
  select(x1:x4) %>%
  summarise_each(list(mean), x1:x4) ; ans_x_mean
ans_y_mean<- anscombe %>%
  select(y1:y4) %>%
  summarise_each(list(mean), y1:y4) ; ans_y_mean
# var -> 분산
ans_x_var <- anscombe %>%
  select(x1:x4) %>%
  summarise_each(list(var), x1:x4) ; ans_x_var
ans_y_var <- anscombe %>%
  select(y1:y4) %>%
  summarise_each(list(var), y1:y4) ; ans_y_var
# cor -> 상관계수
ans_1_cor <- round(cor(anscombe),2) 
ans_1_cor

p1 <- ggplot (anscombe) +
  geom_point(aes(x1, y1), color= 'darkorange', size=3) +
  theme_bw( ) +
  scale_x_continuous(breaks=seq(0,20,2)) +    # 다시 볼 것
  scale_y_continuous(breaks=seq(2,14,2)) + 
  geom_abline(intercept=3, slope = 0.5,       # why & how do we give the slope of correlation lines without calculating correlations??
              color='cornflowerblue') +
  expand_limits(x=0, y=0) +
  labs(title = 'dataset 1')
p1


























