library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)

data <- read.csv("~/S086 PRAC 10 TO 12/AI_Impact_on_Jobs_2030.csv")

ai_trend <- data %>%
  head(10) %>%
  select(Job_Title, AI_Exposure_Index, Automation_Probability_2030) %>%
  pivot_longer(cols = c("AI_Exposure_Index", "Automation_Probability_2030"), 
               names_to = "Metric", 
               values_to = "Score")

ggplot(ai_trend, aes(x = Job_Title, y = Score, color = Metric, group = Metric)) +
  geom_line(size = 1.5) +
  geom_point(size = 4) +
  theme_minimal() +
  scale_color_manual(values = c("AI_Exposure_Index" = "#3498db", "Automation_Probability_2030" = "#e74c3c")) +
  labs(title = "AI Exposure vs Automation Probability (First 10 Jobs)",
       subtitle = "Comparison of Risk Indices across Job Titles",
       y = "Index Score (0.0 - 1.0)",
       x = "Job Title") +
  theme(legend.position = "bottom", axis.text.x = element_text(angle = 45, hjust = 1))