# Load necessary libraries
library(ggplot2)
df<-read.csv("C:/Users/chall/Downloads/data_YesBank_StockPrices.csv")
# Assuming 'df' is your dataframe and contains 'High' and 'Low' columns
# Extract 'High' and 'Low' columns
X <- df$High
y <- df$Low

# Create and fit the linear regression model
model <- lm(y ~ X)

# Predict the 'Low' values using the fitted model
y_pred <- predict(model, newdata = df)

# Create a data frame for plotting
plot_data <- data.frame(High = X, Low = y, Predicted_Low = y_pred)

# Plot the data points and the regression line
ggplot(plot_data, aes(x = High, y = Low)) +
  geom_point(color = 'blue', size = 2, aes(label = "Data Points")) +
  geom_line(aes(y = Predicted_Low), color = 'red') +
  labs(x = 'High', y = 'Low', title = 'Linear Regression: High vs Low') +
  theme_minimal() +
  theme(legend.position = "none")
