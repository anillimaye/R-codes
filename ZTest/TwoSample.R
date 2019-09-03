# This code is for two sample z test. The sample sizes are large.
# Takes two columns of values as input and computes mean.
# Performs a two sample two-tailed z test to find whether means and significantly different
Data <- read.table(file.choose(), header=TRUE, sep="\t")
mG1 = mean(Data$Group1); mG2 = mean(Data$Group2)
vG1 = var(Data$Group1); vG2 = var(Data$Group2)
lG1 = length(Data$Group1); lG2 = length(Data$Group2)
d = (mG1-mG2)/sqrt((vG1/lG1)+(vG2/lG2))
p = 2*pnorm(d, mean=0, sd=1, lower.tail=FALSE)

# Final conclusion
if (p < 0.05) {
    print ("significantly different")
} else {
    print("not significantly different")
}
