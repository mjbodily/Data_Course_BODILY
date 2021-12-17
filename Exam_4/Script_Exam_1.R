library(tidyverse)
library(ggplot2)

df <- read.csv("cleaned_covid_data.csv")


A <- grepl("A", df[,1])

A_States <- filter(df, A)

Last_Update <- A_States[,2]
Active <- A_States[,6]

Province_State <- df[1,]

options(scipen=999)

ggplot(A_States, aes(x = Last_Update, y= Active, color= Province_State))+
  geom_point()+
  geom_smooth(method = "loess", se = FALSE)+
  facet_wrap(facets= Active, scales = "free")



Case_Fatality_Ratio <- df[,7]


df[,7]

state_max_fatality_rate <- max(Case_Fatality_Ratio, na.rm=T)  

