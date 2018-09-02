# Rproject1_script1.r
# 
# Illustrate R functions relating to Normal and Chi-Square distributions
#   and built-in functions for linear algebra
#

# 1. R functions for Normal distribution ----

# random number generator of normal distribuion

# At the console type get help on the rnorm() function by typoing: help(rnorm)

# Family of functions
#   dnorm()   density function
#   pnorm()   cumulative distribution function
#   qnorm()   quantile function
#   rnorm()   random  number generator

#   Syntax of functions -- from help(rnorm) output
# dnorm(x, mean = 0, sd = 1, log = FALSE)
# pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
# qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
# rnorm(n, mean = 0, sd = 1)

#   1.1 rnorm() ----
#         random normals
#       Generate vector x of 1000 iid N(0,1)  random values 
x=rnorm(1000)

# NOTE: Top right panel of Rstudio, Environment tab lists  x

#   Plot the series of values in x
plot(x, main="1.1 1000 Random N(0,1) Values")


#   Plot a histogram of the values in x
hist(x, main="1.2a Histogram of 1000 Random N(0,1) Values")
#
# help(hist) #command to display help file on r function hist()
#   Replot histogram using probability density scale
hist(x,probability="TRUE", main="1.2b Histogram of 1000 Random N(0,1) Values\n (density scale)")

#   1.2 dnorm() #----
#       density function of Normal distribution

#   Create vector of x values
x.grid=seq(-3,3,.01)

#   Compute vector of corresponding density values
density.grid=dnorm(x.grid,mean=0, sd=1)

#   use R function lines() to add to current plot
lines(x.grid,density.grid,col='blue')

#   1.3 pnorm()  -----
#     cdf (cumulative distribution function) of Normal distribution

cdf.grid=pnorm(x.grid,mean=0,sd=1)

plot(x.grid,cdf.grid,type="l",col="blue",
     main="1.3 CDF Fof N(0,1)")

#   1.4 qnorm() ----
#     compute quantiles (percentiles)

qnorm(.95)
qnorm(.995)
qnorm(.9995)

qnorm(.05)
qnorm(.005)
qnorm(.0005)


# 2.  R functions for Chi-square distribution ----

# random number generator of chisquare  distribuion
# See:  help(rchisq)
#   Syntax of functions -- from help(qchisq) output
# dchisq(x, df, ncp = 0, log = FALSE)
# pchisq(q, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
# qchisq(p, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
# rchisq(n, df, ncp = 0)

#   2.1 rchisq() ----
#         random chisquare 
#       Generate vector v of 1000 chisquare (df=3) random values 
v=rchisq(1000,df=3)

# NOTE: Top right panel of Rstudio, Environment tab lists  v

#   Plot the series of values in v
plot(v, main="2.1 1000 Random Chisquare(df=3) Values")

#   Plot a histogram of the values in v
hist(v, main="2.2a Histogram of 1000 Random\n Chisquare(df=3) Values", nclass=50)

#
#   Replot histogram using probability density scale
#   Plot a histogram of the values in v
hist(v,probability="TRUE", nclass=50,
     main="2.2b Histogram of 1000 Random\n Chisquare(df=3) Values\n (density scale)")

#   2.2 dchisq() #----
#       density function of chisquared  distribution

#   Create vector of x values
v.grid=seq(0, max(v),.01)

#   Compute vector of corresponding density values
density.v.grid=dchisq(v.grid,df=3)

#   use R function lines() to add to current plot
lines(v.grid,density.v.grid,col='blue')

#   2.3 pchisq()  -----
#     cdf (cumulative distribution function) of chisquared distribution

cdf.v.grid=pchisq(v.grid,df=3)

plot(v.grid,cdf.v.grid,type="l",col="blue",
     main="2.3 CDF of Chisquare Dist (df=3)")

#   2.4 qchisq() ----
#     compute quantiles (percentiles)

qchisq(.95,df=3)
qchisq(.995,df=3)
qchisq(.9995,df=3)

qchisq(.05,df=3)
qchisq(.005 ,df=3)
qchisq(.0005,df=3)
#   

# 3. Basic Linear Algebra computations in R
 
#   3.1 Define a simple 2x2 matrix A  and 2x1 matrix X
#           print them and multiply them together

A=matrix(c(2,4,1,3),nrow=2)
X=as.matrix(c(10,1))
A
X
A%*%X

# Note:  For  matrix multiplication A%*%X in R,
#     the column dimension of A must equal the row dimension of x
#     This requires that X be defined explicitly as a matrix.
#     The matrix multiplication would fail if X were defined by
#         X=c(10,1)
#     because X would then be vector with one dimension (length) not
#     two.
#
#   3.2 Define b to be the product of  A  and X
#     and use  the function solve() to solve for X using A and b

b=A%*% X


solve(A,b)

#   The function solve() also computes the matrix inverse of A
A
A.inverse=solve(A)
A.inverse

A %*% A.inverse

#   3.3 Use built-in functions to compute row/column sums and means

colSums(A)
colMeans(A)

rowSums(A)
rowMeans(A)

#   3.4 Use built-in function to compute the eigen values/vectors of A

eigen(A)

#   3.5 Use built-in function qr() to compute the QR decomposition of A
#       and apply the related function qr.Q() and qr.R() to extract the components

A.qr=qr(A)
qr.Q(A.qr)
qr.R(A.qr)

#   Multiply the components together and compare with A
qr.Q(A.qr) %*% qr.R(A.qr)

A

