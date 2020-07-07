testdata <- airquality
### INTRODUCTION ###
# Removing NA values from an R object is an important topic, as it is a precondition for solid data analysis.
# NA stands for "missing value", in contrast to "NaN" which stands for "not a number"

## 1. Explore and summarize NA cases

# 1.1 head() and/or tail() show the first/last six lines of the object. It gives some rough insight
head(testdata) # object = dataframe
tail(testdata) # object = dataframe
head(as.matrix(testdata)) # object = matrix
tail(as.vector(testdata[,1])) # object = vector
head(as.list(testdata[,2])) # object = list
# 1.2 is.na() function
# detect all NA cases within an R object => returns the object populated with Boolean values
is.na(testdata)
# check whether an object has one or more NA values => returns a Boolean value
any(is.na(testdata))
# 1.3 check how many NA values actually occur in the specific object
sum(is.na(testdata))
# 1.4 check the number of NA values within a column
sum(is.na(testdata[,1]))
sum(is.na(testdata$Solar.R))
# 1.5 Check for NA values for each column => This is a very handy R functionality
colSums(is.na(testdata))
# 1.6 Check for clean datasets (= rows) within an object
complete.cases(testdata)



## 2. Remove/strip NA values

# 2.1 Remove entire columns or rows
testdata[154,] <- NA
testdata[,7] <- NA
testdata <- testdata[-154,]
testdata <- testdata[,-7]

# 2.2 Removing all NA values within an object = removing all relevant rows of that object
# option 1: na.omit => returns the same obect as before (dataframe)
testdata1 <- na.omit(testdata)
nrow(testdata1)
# option 2: complete.cases() => returns the same obect as before (dataframe)
testdata2 <- testdata[complete.cases(testdata),]
nrow(testdata2)
# option 3 => returns a vector populated with all non-NA values of the passed object (column by column) => fits best for a vector
testdata3 <- testdata[!is.na(testdata)]


# 3. Best practise
#Let's take a look again at the airquality data and check the NA summary by column:
colSums(is.na(testdata))
# as we can see, the Ozone column comes with 37 NA values. If we apply the na.omit() function to the entire dataframe we will lose 
# all these 37 columns. If we do not need the Ozone attribute for our data analysis it would be better to apply the na.omit() function
# to dataframe that comes without this Ozone column
analysisData <- na.omit(testdata[,-1])
nrow(analysisData)

rm(list=ls())
