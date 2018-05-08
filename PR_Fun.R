##StatsGraphsFunction_PR()##

#This function takes 2 vectors, one specifying an x variable, one specifying a y variable, plots them against each other,
# and returns a graph of the plot with the adjusted R2 and p-value printed in the corner legend.
# Currently, the function is set to be specific to root distribution datasets.

#Args
# x = a vector of x variables
# y = a vectory of y variables
# ... = other graphs specs.

#Returns a plot of y vs. x with statistics.


#make function for r squared:

PR <- function(x,y,...){
  r2 = summary(lm(y~x))$r.squared
  pval = summary(lm(y~x))$coefficients[2,4]
  rp = vector('expression',2)
  rp[1] = substitute(expression(italic(R)^2 == MYVALUE),
                     list(MYVALUE = format(r2,dig=3)))[2]
  rp[2] = substitute(expression(italic(p) == MYOTHERVALUE),
                    list(MYOTHERVALUE = format(pval, digits = 2)))[2]

depth_colTot <- rev(colorspace::rainbow_hcl(nrow(HWTotal)))
plot(y~x, cex.axis = 1, cex.lab = 1.25, col = depth_colTot, pch = 19, ylab = "Fraction of Roots in Profile (%)", xlab = ...)
legend('topright', legend = rp, bty = 'n', cex = 0.5)
}

