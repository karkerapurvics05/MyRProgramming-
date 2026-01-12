library(ggplot2)
library(dplyr)
library(tidyr)
data_subset <- read.csv("~/S086 PRAC 10 TO 12/AI_Impact_on_Jobs_2030.csv") %>%
  head(10)
# scatter plot
scatter_plot <- ggplot(data_subset, aes(x = AI_Exposure_Index, y = Automation_Probability_2030)) +
  geom_point(size = 4, color = "#3498db") +
  geom_smooth(method = "lm", se = FALSE, color = "lightgrey", linetype = "dashed") +
  labs(title = "Scatter Plot: Exposure vs Automation", x = "AI Exposure", y = "Automation Prob.") +
  theme_minimal()
#pie chart
pie_chart <- ggplot(data_subset, aes(x = "", y = AI_Exposure_Index, fill = Job_Title)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  theme_void() +
  labs(title = "Pie Chart")
#high low chart
high_low_plot <- ggplot(data_subset, aes(x = Job_Title)) +
  geom_linerange(aes(ymin = pmin(AI_Exposure_Index, Automation_Probability_2030), 
                     ymax = pmax(AI_Exposure_Index, Automation_Probability_2030)), 
                 color = "grey", size = 1) +
  geom_point(aes(y = AI_Exposure_Index), color = "#3498db", size = 3) + # "Low" or Index 1
  geom_point(aes(y = Automation_Probability_2030), color = "#e74c3c", size = 3) + # "High" or Index 2
  coord_flip() +
  labs(title = "High-Low Chart--Gap between Exposure[blue] & Automation[red]",
       x = "Job Title", y = "Index Range") +
  theme_minimal()
print(scatter_plot)
print(pie_chart)
print(high_low_plot)