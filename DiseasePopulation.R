# Exercise 4.1

rm(list=ls())

# Probability of having a disease in general population
Theta = c(1, 0)
pTheta = c(0.001, 0.999) # Prior? 

Data = c(1)
nPos = sum(Data == 1)
nNeg = sum(Data == 1)

pDataGivenTheta = 0.99 * nPos + 0.05 * nPos
pPositiveGivenNoDisease = 0.05

pData = 

pThetaGivenData = pDataGivenTheta * pTheta / pData

Data = 1

pData = 1 * pPositiveGivenDisease

# Need to calculate
pDiseaseGivenPositive = pPositiveGivenDisease * pThetaDisease / pData