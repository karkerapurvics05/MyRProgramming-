library(ggplot2)
library(dplyr)

ai_data <- read.csv("~/S086 PRAC 10 TO 12/AI_Impact_on_Jobs_2030.csv")

numeric_cols <- ai_data %>%
  select(Average_Salary, AI_Exposure_Index, Automation_Probability_2030) %>%
  na.omit()

cor_matrix <- cor(numeric_cols)

print("Correlation_Matrix")
print(round(cor_matrix, 2)) 

col_palette <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))(200)

heatmap(cor_matrix, 
        col = col_palette, 
        main = "Correlation Heatmap-S086",
        Rowv = NA, Colv = NA, 
        symm = TRUE,
        margins = c(12, 12), 
        cexRow = 1.2, cexCol = 1.2)