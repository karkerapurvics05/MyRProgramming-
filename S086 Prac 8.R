library(readr)
library(dplyr)

df <- read.csv("~/S086 R Prac 7 to 9/AI_Impact_on_Jobs_2030.csv")

df <- df %>%
  filter(!is.na(Average_Salary), !is.na(Education_Level), !is.na(Risk_Category))

model <- aov(Average_Salary ~ Education_Level * Risk_Category, data = df)

summary(model)

aggregate(Average_Salary ~ Education_Level + Risk_Category, data = df, FUN = mean)