### INTRODUCTION ###
# Factors are used to represent categorical data and can be unordered or ordered. Factors are important in statistical
# modeling and are treated specially by modelling functions like lm() and glm().

# 1. Creating a factor
# Factor objects can be created with the factor() function.
f <- factor(c("BMW","Audi","Volkswagen","Mercedes-Benz"))
# The table() function presents the count of each level
levelcount <- table(f)

# 2. Loading data
# Factors are automatically created when reading in data (in particular for character fields)
load("workspacedata/cardata_binaryFormat.rda")
# the table function offers an often useful overview of the absolute distribution of the different levels
t <- table(cardata1$brand)
# you'll get the result as a vector if you incorporate the table into the as.vector() function
as.vector(t)

# 3. Order of the levels
# The order of the levels of a factor can be set using the levels argument to factor(). This can be
# important in linear modelling because the first level is used as the baseline level.
orderedLevels <- factor(cardata1$brand,levels = c("Opel","Mercedes","BMW","Audi"))

