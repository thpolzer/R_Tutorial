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

# 3. repeat Loops
# repeat Loops are possible, too
# however, there is no real need for that so this will not be covered in this tutorial


# 4. Loop-functions
# In R loop functions have been implemented in the various forms of apply() functions.
# Pls note: In contrast to many contradictory rumours apply() functions ARE IN GENERAL NOT FASTER than any other loops.
# The reason to use them is
# -> CLARITY and
# -> NO SIDE EFFECTS

# 4.1 lapply()
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

# 4.2 sapply()
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

# 4.3 split (dataframe)
# see point 8 in the 04_Dataframes.R file within this tutorial
partitionedCardata <- split(cardata1,cardata1$brand)
# split is frequently used alongside with lapply() or sapply()
maxSalaryPerBrand1 <- lapply(partitionedCardata,function(x){
  max(x$salary)
})
maxSalaryPerBrand2 <- sapply(partitionedCardata,function(x){
  max(x$salary)
})
# This sequence of operations is sometimes referred to as “map-reduce” in other contexts.

rm(list=ls())
