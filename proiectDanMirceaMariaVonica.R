presidentData = read.csv("E:/Programare/RProjects/Project2/approval.csv")

#compute the mean of a variable
#====================Exercise 1
presidentApproval = presidentData$approve
presidentDisapproval = presidentData$disapprove

presidentApprovalAverage = mean(presidentApproval, trim = 0, na.rm = FALSE)
presidentDisapprovalAverage = mean(presidentDisapproval, trim = 0, na.rm = FALSE)

print(presidentApprovalAverage)
print(presidentDisapprovalAverage)

#compute the median of a variable
print(median(presidentApproval))
print(median(presidentDisapproval))

#compute the quartiles
print(quantile(presidentApproval))
print(quantile(presidentDisapproval))

#compute variance
print(var(presidentApproval))
print(var(presidentDisapproval))

#compute standard deviation
presidentStandardDeviation = sd(presidentApproval)
presidentDisapprovalDeviation = sd(presidentDisapproval)

print(presidentStandardDeviation)
print(presidentDisapprovalDeviation)

#compute coefficient variation
print(presidentStandardDeviation/presidentApprovalAverage)
print(presidentDisapprovalDeviation/presidentDisapprovalAverage)

#compute covariance
print(cov(presidentApproval, presidentData$iraq.war))
print(cov(presidentDisapproval, presidentData$iraq.war))

#====================Exercise 2

#90%
errorDisapproval <- qnorm(0.9)*presidentDisapprovalDeviation/sqrt(nrow(presidentData))
leftDisapproval <- presidentDisapprovalAverage - errorDisapproval
rightDissapproval <- presidentDisapprovalAverage + errorDisapproval

errorApproval <- qnorm(0.9)*presidentStandardDeviation/sqrt(nrow(presidentData))
leftApproval <- presidentApprovalAverage - errorApproval
rightApproval <- presidentApprovalAverage + errorApproval

print(leftDisapproval)
print(rightDissapproval)

print(leftApproval)
print(rightApproval)

#95%
errorDisapproval <- qnorm(0.95)*presidentDisapprovalDeviation/sqrt(nrow(presidentData))
leftDisapproval <- presidentDisapprovalAverage - errorDisapproval
rightDissapproval <- presidentDisapprovalAverage + errorDisapproval

errorApproval <- qnorm(0.95)*presidentStandardDeviation/sqrt(nrow(presidentData))
leftApproval <- presidentApprovalAverage - errorApproval
rightApproval <- presidentApprovalAverage + errorApproval

print(leftDisapproval)
print(rightDissapproval)

print(leftApproval)
print(rightApproval)

#99%

errorDisapproval <- qnorm(0.99)*presidentDisapprovalDeviation/sqrt(nrow(presidentData))
leftDisapproval <- presidentDisapprovalAverage - errorDisapproval
rightDissapproval <- presidentDisapprovalAverage + errorDisapproval

errorApproval <- qnorm(0.99)*presidentStandardDeviation/sqrt(nrow(presidentData))
leftApproval <- presidentApprovalAverage - errorApproval
rightApproval <- presidentApprovalAverage + errorApproval

print(leftDisapproval)
print(rightDissapproval)

print(leftApproval)
print(rightApproval)

#====================Exercise 3

#correlation coeffiecient of the two samples

presCor = cor(presidentApproval,presidentDisapproval)

#confidence interval for the two with a 95% confidence interval
cor.test(presidentApproval, presidentDisapproval, conf.level = 0.95)

#====================Exercise 4

presCor = cor(presidentDisapproval,presidentApproval)
#test null hypothesis  
#t.test(presidentDisapproval, presidentApproval, mu = 0, paired = TRUE, conf.level = abs(presCor))
t.test(presidentDisapproval, presidentData$avg.price, mu = 0, paired = TRUE, conf.level = abs(presCor))

#The Value of the p value is greater than the confidence interval, therefore we can assume that a president's
#salary does not have an effect on his dissaprovement rating

#====================Exercise 5

salary = presidentData$avg.price

lm(salary ~ presidentDisapproval)
plot(salary, presidentDisapproval)
abline(lm(presidentDisapproval ~ salary))










