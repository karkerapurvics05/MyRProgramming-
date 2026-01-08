library(ggplot2)
library(dplyr)
library(readr)

data <- read.csv("~/S086 PRAC 10 TO 12/AI_Impact_on_Jobs_2030.csv")

data_clean <- data %>% 
  filter(!is.na(Average_Salary), !is.na(Education_Level), !is.na(Risk_Category))

plot_hist <- ggplot(data_clean, aes(x = Average_Salary)) +
  geom_histogram(bins = 30, fill = "#69b3a2", color = "#e9ecef", alpha = 0.9) +
  theme_minimal() +
  labs(title = "Distribution of Average Salary",
       subtitle = "Frequency of jobs by salary range",
       x = "Average Salary",
       y = "Count of Jobs")

plot_box_edu <- ggplot(data_clean, aes(x = Education_Level, y = Average_Salary, fill = Education_Level)) +
  geom_boxplot(outlier.colour = "red", outlier.shape = 1, outlier.size = 3) +
  theme_light() +
  labs(title = "Salary Distribution by Education Level",
       subtitle = "Comparison of salary ranges across education levels",
       x = "Education Level",
       y = "Average Salary") +
  theme(legend.position = "none")

plot_box_risk <- ggplot(data_clean, aes(x = Risk_Category, y = Average_Salary, fill = Risk_Category)) +
  geom_boxplot() +
  scale_fill_brewer(palette = "Pastel1") +
  theme_minimal() +
  labs(title = "Salary vs. Risk Category",
       x = "Risk Category",
       y = "Average Salary")

print(plot_hist)
print(plot_box_edu)
print(plot_box_risk)