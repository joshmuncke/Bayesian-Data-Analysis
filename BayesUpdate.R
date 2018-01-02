# Theta is the vector of candidate values for the parameter theta
# nThetaVals is the number of candidate theta values
nThetaVals <- 100
Theta = seq( from  = 1/(nThetaVals + 1), to = nThetaVals/(nThetaVals+1), by = 1/(nThetaVals+1))

# pTheta is the vector of prior probabilities on the theta values
pTheta = Theta ^ 2
pTheta = pTheta / sum(pTheta) # Normalize to make them probabilities

Data = c(1,0,1,0)
nHeads = sum( Data == 1 )
nTails = sum( Data == 0 )

# Compute likelihood (of the Data given different values of Theta)
pDataGivenTheta = Theta^nHeads * (1-Theta)^nTails # Bernoulli

# Compute posterior
pData = sum(pDataGivenTheta * pTheta)
pThetaGivenData = pDataGivenTheta * pTheta / pData

# Set layout
layout(matrix(c(1,2,3), nrow = 3, ncol = 1, byrow = F))
par(mar = c(3,3,1,0)) # Number margin lines - BLTR
par(mgp = c(2,1,0)) # Which margins for labels

plot( Theta, pTheta, type = "h", lwd = 3, main = "Prior",
      xlim = c(0,1), xlab = bquote(theta),
      ylim = c(0,1.1*max(pThetaGivenData)), ylab = bquote(p(theta)),
      cex.axis = 1.2, cex.lab = 1.5, cex.main = 1.5)

plot( Theta, pDataGivenTheta, type = "h", lwd=3, main = "Likelihood",
       xlim=c(0,1), xlab = bquote(theta),
       ylim=c(0,1.1*max(pDataGivenTheta)), ylab = bquote(paste("p(D|", theta, ")")),
       cex.axis = 1.2, cex.lab = 1.5, cex.main = 1.5)
text( .55, 0.85*max(pDataGivenTheta), cex = 2.0, bquote("D=" * .(nHeads) * "H," * .(nTails) * "T" ))

plot( Theta, pThetaGivenData, type = "h", lwd=3, main = "Posterior",
      xlim=c(0,1), xlab = bquote(theta),
      ylim=c(0,1.1*max(pThetaGivenData)), ylab = bquote(paste("p(", theta, "|D)")),
      cex.axis = 1.2, cex.lab = 1.5, cex.main = 1.5)
text( .55, 0.85*max(pThetaGivenData), cex = 2.0, bquote("p(D)=" * .(signif(pData,3))))