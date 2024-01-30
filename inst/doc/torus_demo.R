## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ashapesampler)
library(alphashape3d)
library(alphahull)
library(doParallel)
library(parallel)
cores <- min(2L, detectCores())
library(rgl)
options(rgl.useNULL = TRUE)

## -----------------------------------------------------------------------------
N=10
tau_vec <- vector("numeric", N)
my_alpha <- 0.15
n <- 1000
r_maj <- 0.5
r_min <- 0.15

## -----------------------------------------------------------------------------
torus_list <- list()
complex_torus_list <- list()

for (k in 1:N){
  torus_pts <- rtorus(n, r_min, r_maj)
  temp_torus <- ashape3d(torus_pts, my_alpha)
  torus_list[[k]] <- temp_torus
  complex_torus_list[[k]] <- get_alpha_complex(torus_pts, my_alpha)
  tau_vec[k] <- tau_bound(torus_list[[k]]$x, complex_torus_list[[k]])
}

## -----------------------------------------------------------------------------
choose_2 <- sample(N,2)
point_cloud = rbind(torus_list[[choose_2[1]]]$x, torus_list[[choose_2[[2]]]]$x)

## -----------------------------------------------------------------------------
tau = min(tau_vec[choose_2[1]], tau_vec[choose_2[2]])

## -----------------------------------------------------------------------------
new_torus <- generate_ashape3d(point_cloud, J=2, tau=tau, cores=cores)
plot(new_torus, indexAlpha="all")
rglwidget()

