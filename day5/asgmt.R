library(ggplot2)
library(dplyr)
mpg <- data.frame(ggplot2::mpg)
mpg %>% group_by(manufacturer) %>% filter(class == "suv") %>%
  mutate(fueleffi = (cty + hwy)/2) %>% 
  summarise(mean_fueleffi = mean(fueleffi)) %>%
  arrange(desc(mean_fueleffi)) %>% head(5)