load("workspacedata/cardata_binaryFormat.rda")
### INTRODUCTION ###
## Graphics is quite a complex topic in R, this section covers fundamental plotting only. More advanced features within this area 
## will be covered in an extra course which will be part of the Advanced R Tutorial.

## 1. The plot() and abline() function
# plot() is a generic function, i.e. a placeholder for a family of functions. The function that actually gets called 
# will depend on the class of the object on which it is called: The same concept exists in Java (Generics) and Scala as well.
# 1.1 The simplest plot
# The below plot actually does not make any sense. A 2-dimensional-plot reequires x- and y-values, we only have one vector here,
# representing the x-values. As a result, automatically takes the same vector as y-values.
x <- c(1,2,3)
plot(x)
y <- c(4,6,12)
plot(x,y)

# 1.2 abline()
lmout <- lm(y~x)
# The linear regression function lm() is a class instance containing the slope and intercept of the fitted line, as well as 
# various other quantities. We've assigned that class instance to lmout. The slope and intercept will now be in lmout$coefficients.
# What happens when we call abline()? This is simply a function that draws a straight line, with the
# function's arguments being treated as the intercept and slope of the line. For instance, the call abline(c(2,1))
# would draw the line y = 1 * x + 2 on whatever graph we've built up so far.
# But actually, even abline() is a generic function, and since we are invoking it on the output of lm(), this
# version of the function knows that the slope and intercept it needs will be in lmout$coefficients, and it plots
# that line. Note again that it superimposes this line onto the current graph-the one which currently graphs the three points.
abline(lmout)

# 2. connecting points to a line
plot(c(2,3,4),c(5,6,7),type="l")

# 3. points() function
# The points() function adds a set of (x,y)-points, with labels for each, to the currently displayed graph.
cardata <- cardata2[order(cardata2$age),]
plot(cardata$age,cardata$salary,col="blue",type="l",xlab="age",ylab="salary")
abline(lm(cardata$salary ~ cardata$age),col="orange")
age1 <- ifelse(cardata$age > 40,cardata$age-2,cardata$age+2)
salary1 <- ifelse(cardata$salary > 52000,cardata$salary - 5000,cardata$salary + 5600)
cardata_additional <- data.frame(age = age1,salary = salary1)
cardata_additional <- cardata_additional[order(cardata_additional$age),]
# For instance, the command superimpose onto the current graph the points of the new dataframe, 
# using "+" signs to mark them.
points(cardata_additional,col="green",pch="+")


# 4. legend()
# is used to add a legend to a multicurve graph. Define x- and y value of the graph where it should be located
legend(42,70000,legend="First Table",lty=1,col="blue")
legend(44,93000,legend="Second Table",lty=2,col="green")
# would place a legend at the point (47,70000) in the graph, with a little line of type 1 and label of "First Table".


# 5. text()
# text() function to place some text anywhere in the current graph. For example,
text(28,90000,"Plot Example",col="brown")
# would write the text "Plot Example" at the point (26,90000) in the graph. The first character of the string, 
# in this case "E", would go at that point.
# IMPORTANT: The given datapoints must be within the data values!

# 6. curve()
# If you have a function and want to plot its graph you can use the curve() function
# you need to define the allowed values for x and y
f <- function(x) return (x^2)
curve(f,-3,3,xlab="x-Werte",col="red",lwd=3,font=4)
text(-0.2,8,"Normalparabel")

# 7. Graphical parameters
# see here: https://www.statmethods.net/advgraphs/parameters.html

