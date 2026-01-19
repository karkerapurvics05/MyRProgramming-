data <- read.csv("S086 PRAC 10 TO 12/AI_Impact_on_Jobs_2030.csv")
data_top10 <- head(data, 10)
data_top10$Is_High_Risk <- ifelse(data_top10$Risk_Category == "High", 1, 0)
model <- glm(Is_High_Risk ~ AI_Exposure_Index, data = data_top10, family = binomial)
summary(model)
plot(data_top10$AI_Exposure_Index, data_top10$Is_High_Risk,
     main = "Logistic Regression: AI Exposure vs High Risk",
     xlab = "AI Exposure Index",
     ylab = "Probability of High Risk (0 or 1)",
     pch = 16, col = "darkblue")
curve(predict(model, data.frame(AI_Exposure_Index = x), type = "response"), 
      add = TRUE, col = "red", lwd = 2)