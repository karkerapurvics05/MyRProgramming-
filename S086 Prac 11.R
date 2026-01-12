library(ggplot2)
library(dplyr)
data <- read.csv("~/S086 PRAC 10 TO 12/AI_Impact_on_Jobs_2030.csv")
data_clean <- data %>% 
  filter(!is.na(Average_Salary), !is.na(Education_Level))
# histogram
plot_hist <- ggplot(data_clean, aes(x = Average_Salary)) +
  geom_histogram(bins = 20, fill = "#69b3a2", color = "white") +
  theme_minimal() +
  labs(title = "Histogram: Distribution of Average Salary--S086",
       x = "Average Salary",
       y = "Frequency (Count of Jobs)")
#box plot
plot_box <- ggplot(data_clean, aes(x = Education_Level, y = Average_Salary, fill = Education_Level)) +
  geom_boxplot(outlier.color = "red") +
  theme_light() +
  labs(title = "Box Plot-Salary by Education Level--S086",
       x = "Education Level",
       y = "Average Salary") +
  theme(legend.position = "none")
print(plot_hist)
print(plot_box)