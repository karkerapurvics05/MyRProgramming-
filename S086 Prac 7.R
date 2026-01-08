library(tidyverse)

data <- read.csv("~/S086 R Prac 7 to 9/AI_Impact_on_Jobs_2030.csv")

data <- data %>%
  filter(!is.na(Average_Salary), !is.na(Education_Level))

grand_mean <- mean(data$Average_Salary)
n_total <- nrow(data)
k <- length(unique(data$Education_Level))

ss_between_df <- data %>%
  group_by(Education_Level) %>%
  summarise(
    n_g = n(),
    mean_g = mean(Average_Salary)
  ) %>%
  mutate(sq_diff = n_g * (mean_g - grand_mean)^2)

ss_between <- sum(ss_between_df$sq_diff)
ss_total <- sum((data$Average_Salary - grand_mean)^2)
ss_within <- ss_total - ss_between

df_between <- k - 1
df_within <- n_total - k

ms_between <- ss_between / df_between
ms_within <- ss_within / df_within

f_stat <- ms_between / ms_within
p_value <- pf(f_stat, df_between, df_within, lower.tail = FALSE)

cat("--- Manual ANOVA Results: Salary by Education Level ---\n")
cat("F-statistic: ", f_stat, "\n")
cat("p-value:     ", p_value, "\n")
cat("DF Between:  ", df_between, "\n")
cat("DF Within:   ", df_within, "\n")