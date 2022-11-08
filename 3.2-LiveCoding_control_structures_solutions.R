
## Conditional structures.

# if, else if, else statements:
## Define a random number and store it in a variable. 
## Determination of the sign of the number using conditionals: 
## positive, negative or null.

# Diapo 2 and 3:

x <- runif(1, -1, 1);x

if(x > 0) {
  "The number is positive."
} else if (x<0){
  "The number is negative."
} else {"The number is zero."}


# Diapo 3:

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
switch(2,media = mean(observations), mediana = median(observations))

barplot(table(observations))



# Diapo 4:

# The for loop
## What does the mean function return? Write a for loop that computes the mean
## of the given observations from the vector defined above. Steps: 
## 1) sum all elements. 
## 2) divide the result by the length of observations' vector. 
## 3) Print on screen a messages informing the mean.

length(observations)
seq_along(observations)
## Using seq_along for manipulating by index:
obs_sum <- 0
for (i in seq_along(observations)) {
    obs_sum <- observations[i] + obs_sum
    obs_mean <- obs_sum/length(observations)
}

obs_sum
obs_mean

print(paste("The sum of all observations is", obs_sum, "and the mean is", obs_mean))

## Iterating directly with the components of the vector:
obs_sum <- 0
for (i in observations) {
  obs_sum <- i + obs_sum
  obs_mean <- obs_sum/length(observations)
}
obs_mean



# Diapo 5:

# The while loop
## Print the positive numbers while they are lower than 7.
n = 1
while(n <= 7){
  print(n)
  n = n+1
}



# Diapo 6:

# The repeat loop
## Start from number 1 and print successive numbers up to 7 with a repeat loop.

n <- 1
repeat{
  if(n == 7){
    break
  }
  print(n)
  n <- n + 1
}
## As we can see, the loop terminates when it encounters the break statement.

## Check how the previous code behaves for an out of range value.
## For example 8:
n <- 8
repeat{
  if(n == 7){
    break
  }
  print(n)
  n <- n + 1
}

## Try this new way of doing the repeat loop:
n <- 1
repeat{
  if(n<=7){
    print(n)
    n = n+1
  }else{
    break
  }
}

## And check how it behaves for an out of range value:
n <- 8
repeat{
  if(n<=7){
    print(n)
    n = n+1
  }else{
    break
  }
}


# Diapo 7:

## Check the difference between the next and break statements:
x <- 1:5
for (val in x) {
  if (val == 3){
    next
  }
  print(val)
}
