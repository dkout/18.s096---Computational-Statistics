# File Pset1_problem2.r
# 18.S096 Problem Set 1, Problem 2
# Create a summary function which computes
#     specific summary statistics as detailed below
#

# Name:   fcn.dqa1
# Input:  x  (numeric vector)
# Output: one-row matrix of statistics with named columns
fcn.dqa1<-function(x){
  x.n=length(x)
  x.mean=mean(x)
  x.sd=sqrt(var(x))
  x.skew=mean((x-x.mean)^3)/x.sd^3
  x.kurtosis=mean((x-x.mean)^4)/x.sd^4
  
  stats=cbind(
    n=x.n,
    mean=x.mean,
    sd=x.sd,
    skew=x.skew,
    kurtosis=x.kurtosis)
  # cbind creates a 1-row numeric matrix with columns so-named
  return(stats)
}
#
# Test the function on the diabetes data:
# 1.  Read data into R ----
diabetes= read.csv(file="EfronData/diabetes.csv", sep=",", header=TRUE)

#
diabetes.dqa1<-apply(diabetes,2,fcn.dqa1)
str(diabetes.dqa1)
# Note that the R object 
#   diabetes.dqa1 is
#         a 5-row by 11-column numeric matrix
#         column names equal to same 
#           column (margin=2) names of diabetes
#
# We need to explictly assign row-names to the object
#       we use the names of the statistics computed from
#       fcn.dqa1() as applied to the first column of diabetes
dimnames(diabetes.dqa1)[[1]]<-dimnames(fcn.dqa1(diabetes[,1]))[[2]]
#   This R expression uses the dimnames() function
#       which is used to extract or set dimension names of
#       an R object

# We print out the R object, using the R function t()
#   to transpose a rectangular matrix; this format
#   facilitates comparing statistics across variables 
#   of the dataset.
t(diabetes.dqa1)

#  The above r code for creating the table of statistics using
#   the summary function fcn.dqa1 is a bit cumbersome.
#  All the manipulations can be wrapped into
#   one function that can be applied to a numeric data matrix

fcn.dqa1.matrix<-function(diabetes){
  diabetes.dqa1<-apply(diabetes,2,fcn.dqa1)
  dimnames(diabetes.dqa1)[[1]]<-dimnames(
    fcn.dqa1(diabetes[,1]))[[2]]
  result<-(diabetes.dqa1)
  return(result)
}

# We test the new function and get the same results

round(fcn.dqa1.matrix(diabetes),digits=2)


# As an extra check/test for the new function we 
# apply the function to a 500 x 10 matrix of iid 
# Gaussian(0,1) values, generated by the R function rnorm()
round(fcn.dqa1.matrix(matrix(rnorm(5000),nrow=500,ncol=10)),
      digits=2)