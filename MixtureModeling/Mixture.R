#creating a mixture of two Gaussian populations
D = sample(c(rnorm(500,1, 3), rnorm(500, 5, 1)))
D	#show D

hist(D, prob=TRUE, breaks=20)  #generate a histogram for D
lines(density(D), col="blue")  #density plot superimposed on the histogram

#set initial conditions, key- mai=initial mean of distribution a; mbi = initial mean of distribution b
#va= initial variance of distribution a; vb = initial variance of distribution b
#priora = prior probability of a; priorb = prior probability of b
#The program will have iterations. In each of the iterations, two probabilities will be computed. posterior and prior.
#posterior is the P(value|given the group); prior is the P(group|the value).
#in each iteration for all the values posterior probability of that being in group a or b is calculated.
#Then for every value the probability that it is in group a or b is calculated and these serve as weights to update the group means.
#After many such iterations, the means of a and b stabilize.

#creating a matrices for recording the updated means and variances of two populations a and b after each iteration
meana <- matrix(, nrow=100, ncol=1); meanb <- matrix(, nrow=100, ncol=1)
vara <- matrix(, nrow=100, ncol=1); varb <- matrix(, nrow=100, ncol=1)

#initializing the means and variances
mai <- 10; vai <- 1; mbi <- 2; vbi <- 0.5; meana[1,] <- mai; meanb[1,] <- mbi
vara[1,] <- vai; varb[1,] <- vbi
priora <- 0.5; priorb <- 0.5

# code for updating the means and variances in after each iteration (100 iterations, which can be changed)

for (i in 1:100) {
#posta= P(x|a)
posta <- (exp(-((D-mai)^2)/(2*vai)))/(sqrt(2*pi*vai))
postb <- (exp(-((D-mbi)^2)/(2*vbi)))/(sqrt(2*pi*vbi))

#a= P(a|x)
a <- (posta*priora)/(postb*priorb + posta*priora)
b <- (postb*priorb)/(postb*priorb + posta*priora)

maf <- (sum(D*a))/sum(a)
mbf <- (sum(D*b))/sum(b)

vaf <- (sum(a*(D-maf)^2))/sum(a)
vbf <- (sum(b*(D-mbf)^2))/sum(b)
maf
vaf
mbf
vbf
meana[i+1] <- maf; meanb[i+1] <- mbf; vara[i+1] <- vaf; varb[i+1] <- vbf
mai <- maf; mbi <- mbf; vai <- vaf; vbi <- vbf; priora <- mean(a); priorb <- mean(b)
}
SDA = sqrt(vaf); SDB = sqrt(vbf)

#show results, ie the mean, variance and standard deviation of the two populations A and B
print (paste("mean of population A:", maf))
print (paste("variance of population A:", vaf))
print (paste("standard deviation of population A:", SDA))
print (paste("mean of population B:", mbf))
print (paste("variance of population B:", vbf))
print (paste("standard deviation of population B:", SDB))
