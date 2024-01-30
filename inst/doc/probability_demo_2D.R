## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=6,
  fig.height=6
)

## ----setup--------------------------------------------------------------------
library(ashapesampler)

## -----------------------------------------------------------------------------
set.seed(100001)
my_ashape = sampling2Dashape(N=1)
plot(my_ashape[[1]])

## -----------------------------------------------------------------------------
my_ashape = sampling2Dashape(N=1, n.noise = TRUE)
plot(my_ashape[[1]])

## -----------------------------------------------------------------------------
my_ashape = sampling2Dashape(N=1, n.noise = TRUE, lambda = 10)
plot(my_ashape[[1]])

## -----------------------------------------------------------------------------
my_ashape = sampling2Dashape(N=1, n.dependent=FALSE, n.noise=TRUE, lambda = 5)
plot(my_ashape[[1]])

## -----------------------------------------------------------------------------
my_ashape = sampling2Dashape(N=1, nhomology = TRUE)
plot(my_ashape[[1]])

## -----------------------------------------------------------------------------
my_ashape = sampling2Dashape(N=1, r=0.5)
my_alpha = my_ashape[[1]]$alpha

plot(my_ashape[[1]])

## -----------------------------------------------------------------------------
my_ashape = sampling2Dashape(N=1, bound="circle")
plot(my_ashape[[1]])

## -----------------------------------------------------------------------------
my_ashape = sampling2Dashape(N=1, r=0.75, rmin=0.5, bound="annulus")
plot(my_ashape[[1]])

## -----------------------------------------------------------------------------
my_ashape = sampling2Dashape(N=1, afixed = TRUE, alpha=0.2, bound="circle")
plot(my_ashape[[1]])

## -----------------------------------------------------------------------------
my_ashape = sampling2Dashape(N=1, mu=0.2, sigma = 0.1)
plot(my_ashape[[1]])

