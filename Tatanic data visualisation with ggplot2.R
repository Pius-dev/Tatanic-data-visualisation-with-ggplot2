library(ggplot2)

# load titanic dataset
titanic <- read_excel("titanic.xls", stringsAsFactors = FALSE)
View(titanic)


#Set up factors
titanic$pclass <- as.factor(titanic$pclass)
titanic$survived <- as.factor(titanic$survived)
titanic$sex <- as.factor(titanic$sex)
titanic$embarked <- as.factor(titanic$embarked)

# First question - What was the survival rate?
ggplot(titanic, aes(x = survived)) + geom_bar()

# if you really want percentages
prop.table(table(titanic$survived))

# Add some customization for labels and theme.

ggplot(titanic, aes(x = survived)) +
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates")
# Question 2
# What was the survival rate by gender?
## We look at two aspects using color (ie, dimensions) of the data simultaneously


ggplot(titanic, aes(x = sex, fill = survived)) +
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival by sex")


?fill

# Question 3
# What was the survival rate by class of ticket?

ggplot(titanic, aes(x = pclass, fill = survived)) +
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Pclass")

# Question 4
# What was the survival rate by class of ticket and geder
# 

# we can leverage facets to further segment the data
# and enable visul drill-down  into the data. 

ggplot(titanic, aes(x = sex, fill = survived)) +
  theme_bw() +
  facet_wrap(~ pclass) +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Pclass and sex")

# Question 5
# What is the distribution of passenger ages?

# The Histogram is a staple of visualizing numeric data as its
# very powerfully communicates the distribution of a variable (i.e., column)

ggplot(titanic, aes(x = age, fill = survived)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)",
       title = "Titanic Age Distribution")

# Using boxplot

ggplot(titanic, aes(y = age, x = survived, fill = survived)) +
  theme_bw() +
  geom_boxplot() +
  labs(y = "Passenger Count",
       x = "Age )",
       title = "Titanic Age Distribution")

# Question 7

#What is the survival rates by age when segmented 
# by gender and class of tickets
# Density plot is used 
# also facets is used to allow for visual drill-down via density plots.

ggplot(titanic, aes(x = age, fill = survived)) +
  theme_bw() +
  facet_wrap(sex ~ pclass) +
  geom_density(alpha = 0.5)+
  labs(y = "Age",
       x = "Survived",
       title = "Titanic Survival Rates by Age, Pclass and Sex")

# using histogram instead
ggplot(titanic, aes(x = age, fill = survived)) +
  theme_bw() +
  facet_wrap(sex ~ pclass) +
  geom_histogram(binwidth = 5)+
  labs(y = "Age",
       x = "Survived",
       title = "Titanic Survival Rates by Age, Pclass and Sex")
































