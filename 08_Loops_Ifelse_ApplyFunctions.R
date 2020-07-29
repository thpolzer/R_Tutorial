load("workspacedata/householddata.rda")
load("workspacedata/cardata.RData")
# 1. for Loops
# for Loops can be used in vectors, lists, matrices. Normally 
a <- list(1,2,30) # list
a1 <- 1
for (i in a){
  a1 = a1+i
  print(i)}

b <- cardata2[,1] # vector
for (j in b) print(j)

c <- as.matrix(householddata[,2],nrow = length(householddata[,2]))
for (k in c) print(k)

# 2. while Loops
# Sometimes to need to get access to the index of an object. In those cases, it is often useful to use a while loop
# do not forget to increment the iteration variable
i <- 1
while (i < length(b)+1) {
  print(b[i])
  i = i+1
}

# 3. ifelse()
# ifelse() is a very powerful function as it is VECTORIZED!!! It helps you a lot, to speed up your code.
# Use it whenever you can and try to avoid loops such as those in 1. or 2. whenever you can
example <- round(rnorm (20,50,20),0)
ifelse(example %% 2 == 0,example+20000,example-1000)

# 4. repeat Loops
# repeat Loops are possible, too
# however, there is no real need for that so this will not be covered in this tutorial


# 5. Loop-functions
# In R loop functions have been implemented in the various forms of apply() functions.
# Pls note: In contrast to many contradictory rumours apply() functions ARE IN GENERAL NOT FASTER than any other loops.
# The reason to use them is
# -> CLARITY and
# -> NO SIDE EFFECTS

# 5.1 lapply()
# The lapply() function does the following simple series of operations:
# 1. it loops over a list, iterating over each element in that list
# 2. it applies a function to each element of the list (a function that you specify)
# 3. and returns a list (the l is for “list”).
# This function takes three arguments: (1) a list X; (2) a function (or the name of a function) FUN; (3)
# other arguments via its ... argument. If X is not a list, it will be coerced to a list using as.list().
a <- list(1,2,30)
res <- lapply(a, function(x){
  if(x%%2 == 0)x=x+1 else x=-x
})
# Pls note that the global variable a remains the same after the function call
# res is a list
# Another note: In the above example we have used an anonymous function. You can also make it an explicit one:
f <- function(x){
  if(x%%2 == 0)x=x+1 else x=-x
}
# If you place a function as an argument into another function you do not need any parentheses:
res1 <- lapply(a,f)

# 5.2 sapply()
# The sapply() function behaves similarly to lapply(); the only real difference is in the return value.
# sapply() will try to simplify the result of lapply() if possible. Essentially, sapply() calls lapply()
# on its input and then applies the following algorithm:
#   - If the result is a list where every element is length 1, then a vector is returned
#   - If the result is a list where every element is a vector of the same length (> 1), a matrix is
#     returned.
#   - If it can’t figure things out, a list is returned
l <- list("a"=c(4,1,19),"b"=list(b1=list(c(9,8,3),b2=c(1,2,3))))
# Important: Nested lists need to be flattened first using the unlist() function (see 02_Lists.R).
# unlist() is automatically coerced to a list in this case (since lapply only accepty lists)
res_lapply <- lapply(unlist(l),function(x){
  if (x%%2 == 0)x=0 else x=1
})
res_sapply <- sapply(unlist(l),function(x){
  if (x%%2 == 0)x=0 else x=1
})
# The difference is that sapply converts the result into a one-dimensional vector which is often more handy.

# 5.3 split (dataframe)
# see point 8 in the 05_Dataframes.R file within this tutorial
partitionedCardata <- split(cardata1,cardata1$brand)
# split is frequently used alongside with lapply() or sapply()
maxSalaryPerBrand1 <- lapply(partitionedCardata,function(x){
  max(x$salary)
})
maxSalaryPerBrand2 <- sapply(partitionedCardata,function(x){
  max(x$salary)
})
# This sequence of operations is sometimes referred to as “map-reduce” in other contexts.

# 5.4 apply()
# The apply() function is used to a evaluate a function (often an anonymous one) over the margins
# of an array. It is most often used to apply a function to the rows or columns of a matrix (= two-dimensional array)
load("workspacedata/householddata.rda")
# The arguments to apply() are:
# - X is an array
# - MARGIN is an integer vector indicating which margins should be “retained”:
#   1 = rows (operation on the rows of a matrix)
#   2 = columns (operation on the columns of a matrix)
#   c(1,2) = operation on all elements of a matrix
# - FUN is a function to be applied
# - ... is for other arguments to be passed to FUN
apply(as.matrix(householddata),1, function(x){
  sum(x)
})

apply(as.matrix(householddata),1, function(x){
  sum(x)
})
# or even shorter
apply(as.matrix(householddata),1, sum)
apply(as.matrix(householddata),2, mean)
# a little bit more complex :-)
apply(as.matrix(householddata),c(1,2), function(x){
  ifelse(x %in% as.matrix(householddata)[,2], x+1, x-1)
})

## 5.4.1 function with extra args (...):
## the function below computes colsums of columns c1 and columns c2 for a given matrix x, multiplies the results by m
## and returns them as a vector
x <- matrix(c(1,2,3,4,5,6),nrow = 2)
f <- function(x, m,n) (x*m)+n
## in the apply function below you are passing the extra arguments m and n
apply(x, c(1,2), f,m=2,n=3)


# 5.5 tapply() and mapply()
# The above options exist as well, however, they are not that important and therefore not relevant for this tutorial
# if you are interested check the documentation at https://cran.r-project.org/doc/manuals/r-release/R-intro.html
  
  

rm(list=ls())
