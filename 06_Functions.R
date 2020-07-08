### INTRODUCTION ###
# Similar to JavaScript or Scala, functions in R are FIRST CLASS OBJECTS (=objects that can be dynamcially created and that can 
# be passed to functions and get returned by functions, also they can be assigned to variables).

# 1. Functions are objects
f <- function(x,y) return ((x-y)/2)
# if you type "f" in  the console the entire function definition gets returned; this is actually the object
f
# also, pls note: The return type of a function is always an object, it can be a function, too:
g <- function(a,b,c) return (a(b,c))
g(f,5,6)
# return() does not need to be explicitely called. If it the call lacks, the last value within the function body will be returned-
h <- function(x,y) x + y
h(1,2)
# if you want to return more than one variable place them into a list or another container
j <- function(x,y) {
  res <- list()
  res[["Sum"]]<-x+y
  res[["Product"]]<-x*y
  return (res)
}
result <- j(10,4)


# 2. Avoiding side effects
# Functions in R do not have any side effects. This means that variables that get passed to a function and modified herein do not change 
# the original state of the variable
# Example:
x <- 10
k <- function(x) x <- x*2
print(k(x))
print(x)
# even though x is modified within k the original value still remains the same

# 2.1 Superassignment operator
# If you want you can allow side effects by using the Superassignment operator <<-
k1 <- function(x) x <<- x*2
print(k1(x))
print(x)

# 3. Arguments

# 3.1 Default values
# you can set arguments as default values (here:b), if this argument is ignored in the function call, the default value will be used,
# otherwise the default value gets overwritten
z <- function (a,b=100) return (a+b)
print(z(200))
print(z(200,1))

# 3.2 Lazy Evaluation
# If an arguments is not used in the function body you can ignore it in the function call
f <- function(a,b) return(a^2)
f(3)

# 3.3 The R ... three dots ellipsis argument
# if you want to have an undefined number of arguments within your function you use the ... placeholder
# inside the function you can grab the variables by converting the ... to a list
# Example:
f <- function(...,op){
  args <- list(...)
  if (!is.numeric(unlist(args))) return ("Error: All arguments in front of the operator need to be numeric")
  else if(op=="+") return (sum(unlist(args)))
  else if (op == "*") return (prod(unlist(args)))
  else return ("Error: You did not pass a valid operator. Only + or * are allowed")
}
f(1,2,13,14,op="+")
f(1,2,13,op="*")
f(1,2,op="%")
f(1,2,3,4,"Thomas",op="+")


# 4. Functions within functions
# One can create and execute functions within functions. This makes sense if the nested functions are needed in an isolated function 
# environment only
# Example
f <- function(a,b){
  if (any(c(a,b) < 0)){
    g <- function(vec) return (abs(vec)*2)
    return (g(c(a,b)))
  }
  return (c(a,b) * 10)
}
f(1,2)
f(-1,2)



