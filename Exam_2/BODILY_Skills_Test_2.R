library(tidyverse)
library(janitor)

# Number I

df <- read.csv("landdata-states.csv")

options(scipen = 999)  

ggplot(df, aes(x = Year, y = Land.Value, color = region))+
  geom_smooth(size = 1.4)+
  theme_minimal()+
  labs(x="Year",
       y="Land Value (USD)")+
  guides(color=guide_legend("Region"))

# Number II

df[is.na(df$region),"State"] %>% 
  unique()


#Number III

df_2 <- read.csv("unicef-u5mr.csv")

names(df_2) <- make_clean_names(names(df_2))

names(df_2) = gsub(pattern = "u5mr_", replacement = "", x = names(df_2))

df_2_tidy <- pivot_longer(df_2, cols = c(,2:67),
               names_to = "year",
               values_to = "mortalityrate")


# Number IV

ggplot(df_2_tidy, aes(x = year, y = mortalityrate, color = continent))+
  geom_jitter()+
  theme_minimal()+
      labs(x="Year",
       y="MortalityRate",
       color = "Continent")+
  coord_fixed(.2)+
  theme(axis.title = element_text(size = 12), 
       legend.title = element_text(size = 12))+
  scale_x_discrete(breaks = seq(1960, 2000, 20))


# Number IV part II

df_3 <- df_2_tidy %>%  group_by(continent, year, mortalityrate)


ggplot(df_3, aes(x = year, y = mortalityrate, color = continent))+
  geom_point()+
  theme_minimal()+
  stat_summary(fun=mean)
  labs(x="Year",
       y="Mean Mortality Rate (deaths per 1000 live births)",
       color = "Continent")+
  coord_fixed(.6)+
  theme(axis.title = element_text(size = 8), 
        legend.title = element_text(size = 12))+
  scale_x_discrete(breaks = seq(1960, 2000, 20))



# Number V






