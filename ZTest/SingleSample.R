# This code is for one sample z-test
# Takes a column of values as input and computes mean. Performs a two-tailed z test to test whether the sample mean is significantly different from a known standard. This code will work on a tab delimited file which has a column of a given number of measurements. The column header is "measurements".
# Note that in this case, the sample size is large
Data <- read.table(file.choose(), header=TRUE, sep="\t")   #reads the table which contains data
stdval <- 50						   #here the mean is being compared to a standard value of 50
SE = sd(Data$measurements)/sqrt(length(Data$measurements)) #computing standard error
d = (mean(Data$measurements)-stdval)/SE			   #computing test statistic - d
p = 2*pnorm(d, mean=0, sd=1, lower.tail=FALSE)		   #computing the p-value for the statistic
# Final conclusion of the statistical test
if (p < 0.05) { 
  print ("significantly different")
} else {
  print ("not significantly different")
}
