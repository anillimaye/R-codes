# One sample z-test
# Takes a column of values as input and computes mean. Performs a z test to test whether the sample mean is significantly different from a known standard.
Data <- read.table(file.choose(), header=TRUE, sep="\t")
stdval <- 50
SE = sd(Data$measurements)/sqrt(length(Data$measurements))
d = (mean(Data$measurements)-stdval)/SE
p = 2*pnorm(d, mean=0, sd=1, lower.tail=FALSE)
if (p < 0.05) { 
  print ("significantly different")
} else {
  print ("not significantly different")
}
