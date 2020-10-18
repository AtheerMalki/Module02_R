# code credit: https://github.com/daniel-dc-cd


# random variables x and y and their sample space:
# x = {0,5,10}
# y = {0,5,10,15}

# their joint probability table:
#         p(y=0) p(y=5) p(y=10) p(y=15)
# p(x=0)  0.02   0.06   0.02    0.10
# p(x=5)  0.04   0.15   0.20    0.10
# p(x=10) 0.01   0.15   0.14    0.01

# create joint probability table as matrix
p <- matrix(c(.02,.04,.01,.06,.15,.15,.02,.20,.14,.10,.10,.01), ncol=4)
p


# ------------------------------------
# Compute marginal probability
# ------------------------------------
# hint: marginal probability of x=0 is:
# p(x=0) = p(x=0 ^ y=0) + p(x=0 ^ y=5) + p(x=0 ^ y=10) + p(x=0 ^ y=15)
# (which is the sum of all elements from first row or the above table)

# compute marginal prob for all x values
px <- apply(p, 1, sum) # 1 = by row
px

# compute marginal prob for all y values
py <- apply(p, 2, sum) # 2 = by col
py


# ------------------------------------
# Compute conditional probability 
# ------------------------------------
# hint: p(x=5|y=5) is:
# p(x=5 and y=5) / p(y=5)
# p[2,2] / py[2]
# 0.15/0.36 = 0.4166667

# Q. compute p(x=0|y=15)
# A. p(x=0 and y=15) / p(y=15)
p[1,4] / py[4]
