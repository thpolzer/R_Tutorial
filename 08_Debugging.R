## 1. browser()
# A call to the function browser causes R to halt execution at that point and to provide the user
# with a special prompt. Arguments to browser are ignored.
# Example
i <- 1
browser()
print(i)
# This a little bit boring, so let's place browser() into a function that incorporates a loop
f <- function (a){
  for (item in a){
    browser()
    if (item < 0) item = item*(-1)
    browser()
  }
}
set.seed(1)
f(rnorm(5,0,1))
# In the R studio the debug mode pops up in the console lets you navigate step-by-step through your code.
# On the Environment tab you can see the current values of your variables.

## debug/undebug
# The debugger can be invoked on any function by using the command debug(fun). Subsequently,
# each time that function is evaluated the debugger is invoked. The debugger allows you to control
# the evaluation of the statements in the body of the function. Before each statement is executed
# the statement is printed out and a special prompt provided. Any command can be given, those
# in the table above have special meaning.
# Debugging is turned off by a call to undebug with the function as an argument.
debug(mean.default)
mean(1:10)