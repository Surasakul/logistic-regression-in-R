# logistic-regression-in-R

**train test split example**  
set.seed(42)  
n <- nrow(data)  
train_id <- sample(1:n, size = 0.8*n)  
train_data <- data[train_id, ]  
test_data <- data[-train_id, ]  

**train logistic regression**  
glm(y ~ x1 + x2 + x3, data = train_data, family = "binomial")
