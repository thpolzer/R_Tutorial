### INTRODUCTION ###
# In R lists can take elements of any mode, and lists can be recursive (lists within lists)

## 1. Creating a list
x <- list()
# assigning values to a list
x[1] <- 195
x[2] <- "football"
# In R a list is a mutable data structure. This means that a list can be modified at runtime.
# However, in contrast to Python, the runtime model is different: Copies of a list do not adjust once the original list gets modified.
# Example
y <- x
x[3] <- 5 # y does not get the last x[3] element
# creating a list with named elements
z <- list(firstname="Thomas",age=51,gender="male")
names(z)


## 2. List Tags and Values
# if you have assigned names within your list elements you can get its values with the $-operator
z$firstname
# if you want to get all values within your list use the unlist() function. If there are nested lists or vectors within your list all 
# values get reurned in a FLATTENED vector
w <- unlist(x)
# if there are different modes within all elements of the unlist() result vector, the least common denominator will be used.
# In our case, this is character mode.
class(w) # character
v <- list (-2,1.1,6,102)
u <- unlist(v)
class(u) # numeric


## 3. Accessing list elements

# 3.1 Accessing a single element
# 3.1.1 Named Elements
# Just use the $ operator => returns a vector of length 1
first_name <- z$firstname
# or [[]] operator => returns a vector of length 1
z[["firstname"]] 
z[[1]]
# 3.1.2 Unnamed elements => returns a vector of length 1
# Use the [[<index of the element>]] operator
z[[2]]

# 3.2 Accessing a group of elements => returns a sublist
# Use the [] operator 
t1 <- z[1:3]
t2 <- z[1]
class(t1)
class(t2) # pls note: t2 is a list as well!

## 4. Adding/removing list elements

# 4.1 Add a list element: Multiple ways
z[2] <- 7
z$city <- "Bottrop"
z[[4]] <- TRUE
z[5:10] <- 1.3

# 4.2 Remove a list element
length(z) # 10
z[5] <- NULL
length(z) # 9
z[1:5] <- NULL
length(z) # 4

## 5. Loops
# Applying the same function to all elements of a list will be covered in detail in file 05_Lopps_Apply.R

rm(list=ls())
