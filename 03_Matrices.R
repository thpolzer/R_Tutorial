### INTRODUCTION ###
# A matrix is actually a multidimensional vector. In general, multidimensional vectors in R are called arrays. As such, a two-dimensional-
# array is also called a matrix.
# Matrix row and column subscripts begin with 1, so for instance the upper-left corner of the matrix a is
# denoted a[1,1]. The internal linear storage of a matrix is in column-major order, meaning that first all of
# column 1 is stored, then all of column 2, etc.
# ATTENTION: In contrast to a vector, a list or a dataframe all elements of a matrix need to come with a NUMERIC DATATYPE (=mode)

# 1. Create a matrix

# 1.1 Manually
M1 <- matrix(1:10,nrow = 2, ncol = 5) # specifying ncol is actually not necessary
M2 <- matrix(1:10,nrow = 2) # specifying ncol is actually not necessary
# Though internal storage of a matrix is in column-major order, we can use the byrow argument in matrix()
# to TRUE in order to specify that the data we are using to fill a matrix be interpreted as being in row-major
# order. Pls check:
M3 <- matrix(1:10,nrow = 2, byrow = T) 
# in addition, we can just specify the number of rows and columns and add the elements specifically
M4 <- matrix(nrow = 20,ncol = 12)
cols <- 1
while (cols <= ncol(M4)){
  rows <- 1
  while (rows <= nrow(M4)) {
    if (rows %% 2 == 0 || rows %% 3 == 0) M4[rows,cols]=1.2 else M4[rows,cols]=-1.5
    rows <- rows +1
  }
  cols <- cols +1 
}
rm(list = ls())
# 1.2 Converting a dataframe or a vector into s matrix using the as.matrix() function
load("workspacedata/householddata.rda")
M1 <- as.matrix(householddata)
simpleVector <- 1:22
M2 <- as.matrix(simpleVector)

# 2. Matrix Indexing
# Use the bracket operator
M1[, c(1,3)] # all rows, columns 1 and 3
M1[1:5,] # rows 1 to 5, all columns
M1[2,3] # the element in the second row and the 3rd column

# 3. Matrix Row and Column functions
# 3.1 mean functions
# mean(<M>) returns the mean of all elements. Sometimes it is useful to get the mean per row or/ and per column
mean(M1)
meanRows <- rowMeans(M1)
meanColumns <- colMeans(M1)
# names
# If required, one can assign names to both rows and columns of a matrix
M2 <- M1[1:4,]
rownames(M2) <- c("Person1","Person2","Person3","Person4")

# 4. Enhancing a matrix/ Removing elements of a matrix

# 4.1 removing elements from a matrix
# use indexing as described in 2. to create a new scaled down matrix (use same variable name as before if you want to overwrite)
M3 <- M1[1:6,]
M4 <- M3[c(-(1:3)),]
# 4.2 Adding elements to a matrix
# use cbind() or rbind() function
# 4.2.1 adding a column
newColumn <- c(0,1,1)
M4 <- cbind(M4,newColumn)
# adding new name for 4th column
M4names <- colnames(M4)
M4names[4] <- "number_pets"
colnames(M4) <- M4names
# adding a row
M4 <- rbind(c(1,91122.10,1,0),M4)
M4 <- rbind(M4, c(2,111226,2,2))
rm(M1,M2,M3)

# 4.3 Filtering
# When it comes to matrices filtering aims to retrieve all rows that match a certain criteria.
# This can be done using the following syntax:
househoulds_with_more_than_one_person <- M4[(M4[,1] >1),]
househoulds_with_more_than_one_person_that_have_a_pet  <- M4[(M4[,1] >1 & M4[,4] >0),]


# 5. Matrix Operations
M1 <- matrix(data=c(1,2,3,4,5,6),nrow=2,ncol=3)
M2 <- matrix(data=c(7,8,9,10,11,12),nrow=2,ncol=3)
M3 <- matrix(data=c(-1,-2,-3,1,2,3),nrow=3,ncol = 2)

# 5.1. Matrix Addition/Subtraction
# you can only add matrices that all havae the same dimension (# of rows x # of columns)
M_sum <- M1 + M2
M_Sub <- M1 - M2


# 5.2. Scalar Multiplication/Division
M1_scalarMult <- 3 * M1
M2_scalarDiv <- M2/4


# 5.3. Matrix-Vector-Multiplication
# number of columns must be equal to the length of the vector!
vect <- c(1,2,3)
M1_vectMult <- M1 %*% vect
# example; we have the following equation: h(x) = -40 + 0.25x
# and the follwing values for x: 2104,1416,1534,852
# we can evaluate all these four sample values simultaneously with the following trick:
vals <- matrix(c(rep(1,4),c(2104,1416,1534,852)),nrow=4,ncol = 2)
result <- vals %*% c(-40,0.25)


# 5.4 Matrix-Matrix-Multiplication
# the number of columns n of the left matrix must be equal to the number of rows m of the right matrix
M_matrixMult <- M1 %*% M3
# example; we have the following equations: 
# h1(x) = -40 + 0.25x
# h1(x) = 200 + 0.1x
# h1(x) = -150 + 0.4xrm(M1,M2)
Equations <- matrix(c(-40,0.25,200,0.1,-150,0.4),nrow=2,ncol=3)
new_result <- vals %*% Equations
# Attention: Matrix multiplication is not communtative!!!
# But: Matrix multiplication is associative: (A x B) x c = A x (B x C)


# 5.6 Inverse
# can only be applied for quare matrices
# If you multiply a matrix A with its inverse A^-1 you get the identity matrix (diagonall filled with 1s, all
# the rest zero)
M4 <- matrix(c(1,2,3,4),nrow = 2, ncol = 2)
det(M4)
# if det exists you can compute the inverse
solve(M4)


# 5.7 Transpose
# converts a row from the left side to a column on the right side
M_transpose <- t(M1)

rm(list=ls())