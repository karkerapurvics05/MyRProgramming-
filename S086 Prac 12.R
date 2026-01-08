library(ggplot2)
library(dplyr)
library(readr)

ai_data <- read.csv("~/S086 PRAC 10 TO 12/AI_Impact_on_Jobs_2030.csv")
ai_subset <- head(ai_data, 20)

correlation_data <- ai_subset[, c("Average_Salary", "Automation_Probability_2030")]

cor_matrix <- cor(correlation_data, use = "complete.obs")

print("Correlation Matrix:")
print(cor_matrix)

plot_scatter <- ggplot(ai_subset, aes(x = Average_Salary, y = Automation_Probability_2030)) +
  geom_point(color = "darkblue", size = 3) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  theme_minimal() +
  labs(title = "Relationship: Average Salary vs Automation Probability",
       subtitle = "Analysis of the first 20 rows",
       x = "Average Salary",
       y = "Automation Probability (2030)")

heatmap(cor_matrix, 
        main = "Correlation Matrix Heatmap",
        col = colorRampPalette(c("blue", "white", "red"))(20),
        symm = TRUE)

print(plot_scatter)