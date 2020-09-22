#Create a 10 sided dice and a 20 sided dice.
die10 <- 1:10
die20 <- 1:20

#Create a function to roll 6 of these dice at a time and calculate the sum and
roll <- function(){
  roll10 <<- sample(die10, 6, replace=TRUE)
  cat("\nrolling a 10 sided dice 6 times:", roll10, "sum =", sum(roll10))
  
  roll20 <<- sample(die20, 6, replace=TRUE)
  cat("\nrolling a 20 sided dice 6 times:", roll20, "sum =", sum(roll20))
  
  cat("\nsum of all rolled values: ", sum(roll10+roll20))
}
  roll()
  
#Create a function to calculate how many dice rolled more than 6 (for the 10 sided) or 16 (for the 20 sided).
findGreater <- function(){
  cat("\n# of rolled values > 6 (10 sides dice):", sum(roll10 > 6))
  cat("\n# of rolled values > 16 (20 sides dice):", sum(roll20 > 16))
}
  findGreater()