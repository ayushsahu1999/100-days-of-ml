# Simple Linear Regression

# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#Fitting Simple linear regression to the training set
regressor = lm(formula = Salary~YearsExperience,
               data = training_set)

#Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)

# Visualising the training set Results
# install.packages('ggplot2')
ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             colour = 'red') +
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience') +
  xlab('Years of Experience') +
  ylab('Salary')

# Visualising the test set Results
ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             colour = 'red') +
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience(Test set)') +
  xlab('Years of Experience') +
  ylab('Salary')