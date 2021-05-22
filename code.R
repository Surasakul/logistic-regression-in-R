# binary classification
# predict diabetes

## install packages
install.packages(c("caret", 
                   "rpart", 
                   "rpart.plot", 
                   "tidyverse"))

# load dataset
diabetes <- read.csv("diabetes.csv")

# preview dataset
head(diabetes)
tail(diabetes)

# review data types in our dataframe
str(diabetes)
diabetes$diabetes <- as.factor(diabetes$diabetes)

# table(count) frequency
table(diabetes$diabetes)
table(diabetes$diabetes) / nrow(diabetes)

# split data
set.seed(38)
n <- nrow(diabetes)
train_id <- sample(1:n, size = 0.8*n)
train_data <- diabetes[train_id, ]
test_data <- diabetes[-train_id, ]

# train model
logisticModel <- glm(diabetes ~ age + glucose + insulin, data = train_data, family = "binomial")

# test model
p <- predict(logisticModel, newdata = test_data, type = "response")

predictions <- ifelse(p>0.5, "pos", "neg")
predictions[1:20]

# prediction accuracy
# prediction == actual
mean(predictions == test_data$diabetes)

# matrix
(table(predictions, test_data$diabetes, dnn = c("predicted","actual"))
