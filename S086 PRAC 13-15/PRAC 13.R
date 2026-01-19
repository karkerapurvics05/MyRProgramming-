full_data <- read.csv("S086 PRAC 10 TO 12/AI_Impact_on_Jobs_2030.csv")
data <- head(full_data, 10)
model <- lm(Average_Salary ~ Years_Experience, data = data)
summary(model)
plot(data$Years_Experience, data$Average_Salary, 
     main = "First 10 Rows: Experience vs Salary",
     xlab = "Years of Experience", 
     ylab = "Average Salary", 
     pch = 19, 
     col = "steelblue",
     cex = 1.5)
abline(model, col = "darkred", lwd = 3)
cat("Intercept:", coef(model)[1], "\n")
cat("Slope:", coef(model)[2], "\n")