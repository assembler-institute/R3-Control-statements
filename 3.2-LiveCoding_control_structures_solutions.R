
# if, else if, else statements:
## Define a random number and store it in a variable. 
## Determination of the sign of the number using conditionals: 
## positive, negative or null.


x <- runif(1, -1, 1);x

if(x > 0) {
  "The number is positive."
} else if (x<0){
  "The number is negative."
} else {"The number is zero."}



# Diapo 4

# Switch
## Create a sample of N=100 observations from 1 to 3, whose occurrence probabilities 
## are 0.3, 0.6 and 0.1% respectively. Use the sample function (see documentation).
## Choose with switch function between cases "mean" or "median"

observations <- sample(1:3, size=100, replace=TRUE, prob=c(.30,.60,.10)); observations

switch("media", media = mean(observations), mediana = median(observations))
switch("mediana", media = mean(observations), mediana = median(observations))

## If there are no coincidences or ways to compute, returns NULL
typeof(switch("Lucho", media = mean(observations), mediana = median(observations)))

## I can call numerically:
switch (2,media = mean(observations), mediana = median(observations))

barplot(table(observations))



# Diapo 5

# The for loop
## What does the mean function return? Write a for loop that computes the mean
## of the given observations from the vector defined above. Steps: 
## 1) sum all elements. 
## 2) divide the result by the length of observations' vector. 
## 3) Print on screen a messages informing the mean.

seq_along(observations)
## Using seq_along:
obs_sum <- 0
for (i in seq_along(observations)) {
    obs_sum <- observations[i] + obs_sum
    obs_mean <- obs_sum/length(observations)
}

obs_sum
obs_mean

print(paste("The sum of all observations is ", obs_sum, "and the mean is ", obs_mean))

## Iterating directly with the components of the vector:
obs_sum <- 0
for (i in observations) {
  obs_sum <- i + obs_sum
  obs_mean <- obs_sum/length(observations)
}
obs_mean



# Diapo 6

# The while loop
## Repeat the same as before but with a while loop.
n = 1
while(n <= 7){
  print(n)
  n = n+1
}



# Diapo 7

# The repeat loop
## Start from number one and print successive numbers up to 7 with a repeat loop.

n <- 1
repeat{
  if(n == 7){
    break
  }
  print(n)
  n <- n + 1
}

n <- 1
repeat{
  if(n<=7){
    print(n)
    n = n+1
  }else{
    break
  }
}
  
## As we can see, the loop terminates when it encounters the break statement.


# Diapo 8

## Check the difference with the next statement:
x <- 1:5
for (val in x) {
  if (val == 3){
    next
  }
  print(val)
}



# Diapo 9

# Functions

## Let's create a function that receives a random number as an input parameter 
## and returns it raised to the cube:
my.func <- function(number){
  result <- number ^ 3
  return (result)
}

## Call the function:
x1 = round(runif(1,1,10)); x1
a <- my.func(x1);a


## Slight modification to receive two numbers as input parameters of the function.
## Let's create a function that receives two random numbers as input parameters 
## and returns the first argument raised to the second:
my.func <- function(x,y){
  result <- x ^ y
  return (result)
}

## Call the function:
x2 = round(runif(1,1,3)); x2
## These 3 syntax produces the same output:
a <- my.func(x1,x2);a
a <- my.func(y=x2,x=x1);a
a <- my.func(x=x1,y=x2);a

## But is different from:
a <- my.func(y=x1,x=x2);a


## Slight modification: Add a default value for the previous function:
my.func <- function(x,y=2){
  result <- x ^ y
  return (result)
}
a <- my.func(x=x1);a
a <- my.func(x=x1,y=x2);a


## Slight modification: Return more than one value
my.func <- function(x,y=2){
  result <- x ^ y
  addition <- x+y
  return (result,addition)
}

## How would I get more than one return in a function?
## Create a function that extracts the maximum and the minimum from a list
min.max <- function(v){
  my.list <- list()
  
  my.list$min <- min(v)
  my.list$max <- max(v)
  
  return (my.list)
}

result <- min.max(c(100, 20, 34, 8))
result
my.list$min
result$min
result$max



# apply() function:
## Get the sum of the columns of a matrix
m <- matrix(5:14, nrow = 5, ncol = 2);m
apply(X=m, MARGIN=2, FUN=sum)

## Or the sum of the rows
apply(m, 1, sum)
## Which is equivalent to:
c(sum(m[,1]), sum(m[,2]))

# lapply()
## Special case iof apply() design for lists.
m.2 <- matrix(1:10, ncol = 2, nrow = 5)

my.list = list(m.2, m); my.list
## This output is not very different from what an array would return... 
## Task for you: So what is the difference between a list and an array?

prod_list = lapply(my.list, FUN = prod);prod_list

prod_list[[1]] == factorial (10)

## Check this!!! :O
## This data set provides measurements of the diameter, height and volume 
## of timber in 31 felled black cherry trees. Note that the diameter (in inches)
## is erroneously labelled Girth in the data.

trees
trees_mean <- lapply(X = trees, FUN = mean);trees_mean
class(trees_mean)

mean(trees$Height)*0.3048

# sapply()
## The output is a matrix of a vector.
my.list
sapply(my.list, sum)


# tapply()
## Check this manner of adding odd and even numbers separately:
v.num <- c(10:20)
v.fact <- c("PAR", "IMPAR", "PAR", "IMPAR", "PAR", "IMPAR",
            "PAR", "IMPAR", "PAR", "IMPAR", "PAR")

v.num
v.fact
tapply(v.num, v.fact, sqrt)
tapply(v.num, v.fact, sum)

# There is also mapply(), check how it works!