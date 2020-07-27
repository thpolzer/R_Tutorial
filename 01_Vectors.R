### INTRODUCTION ###
# In R there is no such thing as a scalar. Even a single value is stored as an object, and the basic data structure for an object is a vector.
# A variable with one single value is a one-dimensional-vector.
# Example:
a <- 1.3
# Retrieving the first element:
show(a[1])
length(a)
# Each element within a vector needs to come with the same data type (in R a data type is called "mode"). Data type can be checked using the 
# mode() function:
mode(a)
# atomic modes in R (same as "primitive data types" in other languages: integer, numeric (floating-point number), character (string), 
# logical (boolean), complex

## 1. create a vector
v1 <- c(1,2,3)
v2 <- vector(mode = "integer",length = 2)
v2[1] <- 12
v2[2] <- 89

## 2. Dynamically fill up an initially empty vector
# sometimes you need to create an empty vector and then fill it up in a loop
i <- 1
v3 <- c()
while (i < 11){
  v3 <- c(v3,i)
  i <- i+1
}

## 3. Special vectors
# 3.1 Sequence using seq(<first element included>:<last element included>)
seq (5,8)
# 3.2 Repetition using rep(element, number of repetitions)
rep("Thomas",12)

## 4. Arithmetic Operations
# IMPORTANT: All arithmetic operations are ELEMENTWISE and therefore VECTORIZED !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# 4.1 Standard operations
c1 <- c(1,2,3)
c2 <- c(4,5,6)
c1 + c2 # 5,7,9
c1 * c2 # 4 10 18
# 4.2 Recycling
# If the length of one vector is not in line with the length of the other one, the shorter vector gets filled up starting with 
# its first element
# Examples
c3 <- c(3,2)
c4 <- c(5,3,2)
c3 + c4 # (3+5) (2+3) (3+2) = 8 5 5
c3 * c4 # (3*5) (2*3) (3*2) = 15 6 6

## 5. Special functions
# 5.1 any()
c5 <- seq(1011,1782)
if (any(c5 %% 3 == 0)) print ("The vector includes elements that are multiples of 3")
# 5.2 all()
if (all(c5 %% 3 == 0)) print ("The vector exclusively includes elements that are multiples of 3") else print ("Shit")

## 6. Indexing
# There a multiple ways to index a vector
c5[12]
c5[12:19]
c5 [17:length(c5)]
c5[c(1,201,579,715)]
c5[c(1,1,18)] # Duplicates are allowed
# Negative sign means that the element will be excluded from the result list
c5[-19] # 1029 will be removed from the result list
c5[c(-1,-3,-5)]

## 7. Assigning names
c6 <- c(4,6,8)
names(c6) <- c("a","b","c")
c6["a"]
# Note: if values of a vector have assigned names, they are still callable with its indexes, for example
# c6["a"] will return the same result as c6[1]
# Removing names
names(c6) <- NULL

## 8. Converting vector to matrix
# Sometimes it is useful to transform a vector into a matrix, e.g. when it comes to run the "apply" function (it expects a matrix 
# as an argument).
M <- as.matrix(c6)

rm(list=ls())
