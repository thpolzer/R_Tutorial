### INTRODUCTION ###
# Simulation is an important (and big) topic for both statistics and for a variety of other areas where
# there is a need to introduce randomness.
# R comes with a set of pseuodo-random number generators that allow you simulating from multiple
# probability distributions like the Normal, Poisson, and binomial.

# For each probability distribution there are typically four functions available that start with a "r",
# "d", "p", and "q". The "r" function is the one that actually simulates randon numbers from that
# distribution. The other functions are prefixed with a
# d for density
# r for random number generation
# p for cumulative distribution
# q for quantile function (inverse cumulative distribution)

# the most common probability distribution to work with the is the Normal distribution (also
# known as the Gaussian). Working with the Normal distributions requires using these four functions
# dnorm(x, mean = 0, sd = 1, log = FALSE)
# pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
# qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
# rnorm(n, mean = 0, sd = 1)


## 1. General use of rnorm()
# In this tutorial we will be covering rnorm() only
x <- rnorm(12)
# We can modify the default parameters to simulate numbers with mean 20 and standard deviation 2.
x <- rnorm(12,20,2)
summary(x)

# Setting the random number seed
# When simulating any random numbers it is essential to set the random number seed. Setting the
# random number seed with set.seed() ensures reproducibility of the sequence of random numbers.
set.seed(3)
x <- rnorm(5)
# if you call rnorm() again you will get a different set of numbers
y <- rnorm(5)
# But if you set seed as before and call rnorm with the same argument you will get the same result
set.seed(3)
z <- rnorm(5)

## 2. Random sampling
# The sample() function draws randomly from a specified set of (scalar) objects allowing you to
# sample from arbitrary distributions of numbers.
set.seed(1)
sample(1:20,3)

sample(letters,10)

rm(list=ls())
