# credit: https://github.com/timlichen

# --------------------------------------------------------------------------------
# Memoryless bar is tired of running out of inventory and
# missing a lot of potential sales. They have hired you to help them figure out
# what they need to do to have a probability of 60% or higher of 
# having 2 kegs on hand in the long run. There are several things 
# that you can change to attempt this task: changing the order rules,
# expanding the chain to allow for more inventory to accumulate.
# Experiment with a few of these and make a recommendation to the bar owners,
# your recommendation should include a diagram, a transition matrix,
# and the steady-state values
# --------------------------------------------------------------------------------

library(expm)

T <- matrix(c(0,0,0.7,0.3,
              0,0,0.7,0.3,
              0,0,0.7,0.3,
              0,0,0.7,0.3
              ), nrow = 4, byrow = TRUE)

colnames(T) = c(0,1,2,3)
rownames(T) = c(0,1,2,3)

T

T%^%2

T%^%5

T%^%20

#   0 1  2   3
# 0 0 0 0.7 0.3
# 1 0 0 0.7 0.3
# 2 0 0 0.7 0.3
# 3 0 0 0.7 0.3

# --------------------------------------------------------------------------------
# LP Brewery is coming up with a hot new brew called The Barrel-Aged Dantzig. 
# Because it is a special craft beer, it has a margin of $30, 
# It uses 10 pounds of corn, 4 oz of hops and 15 pounds of malt. 
# With the addition of this new brew, LP Brewery has to now think about 
# allocating its personnel to the different manufacturing processes. 
# Each of the kegs takes 5 (Hopatronic),
# 10 (All American), and 20 (Dantzig) hours of labor to make 
# and we have only 5 employees full-time. 
# If this is the production planning for a month of brewing, 
# what is the optimal amount of each beer that must be produced to maximize profit
# --------------------------------------------------------------------------------

install.packages("lpSolve")
library(lpSolve)

f.obj <- c(13,23,30) # add Barrel-Aged Dantzig's margin of 30

f.con <- matrix(c(5,15,10,       # corn needed
                  4,4,4,         # hops needed
                  35,20,15,      # malt needed
                  5,10,20        # hours needed
                  ), nrow = 4, byrow = TRUE)

f.dir <- c("<=",
           "<=",
           "<=",
           "<=")

f.rhs <- c(480,
           160,
           1190,
           650)

sol<-lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)
sol$objval
sol$solution
sol$duals

