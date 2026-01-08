library(tidyverse)

data <- read.csv("~/S086 R Prac 7 to 9/AI_Impact_on_Jobs_2030.csv")

median_salary <- median(data$Average_Salary, na.rm = TRUE)
median_exposure <- median(data$AI_Exposure_Index, na.rm = TRUE)

data$Salary_Cat <- ifelse(data$Average_Salary >= median_salary, "High", "Low")
data$Exposure_Cat <- ifelse(data$AI_Exposure_Index >= median_exposure, "High", "Low")

contingency_table <- table(data$Salary_Cat, data$Exposure_Cat)

print("Contingency Table:")
print(contingency_table)

test_result <- chisq.test(contingency_table)

print(test_result)