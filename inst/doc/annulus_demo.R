## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=6,
  fig.height=6
)

## ----setup--------------------------------------------------------------------
library(ashapesampler)
library(alphahull)
library(ggplot2)
library(doParallel)
library(parallel)
cores <- min(2L, detectCores())

## -----------------------------------------------------------------------------
set.seed(201723)
my_alpha = 0.15
n = 1000
N= 10
r_maj <- 0.75
r_min <- 0.25

## -----------------------------------------------------------------------------
ann_list <- list()
complex_list <- list()
tau_vec <- vector("numeric", N)
for (k in 1:N){
  ann_pts <- runif_annulus(n, r_maj, r_min)
  ann_list[[k]] <- ashape(ann_pts, alpha = my_alpha)
  complex_list[[k]] <- get_alpha_complex(ann_pts, my_alpha)
  tau_vec[k] <- tau_bound(ann_list[[k]]$x, complex_list[[k]])
}

## -----------------------------------------------------------------------------
choose_2 <- sample(N,2)
point_cloud = rbind(ann_list[[choose_2[1]]]$x, ann_list[[choose_2[[2]]]]$x)

## -----------------------------------------------------------------------------
tau_vec2 = c(tau_vec[choose_2[1]], tau_vec[choose_2[2]])

## -----------------------------------------------------------------------------
new_annulus <- generate_ashape2d(point_cloud, J=2, tau=min(tau_vec2), 
                                 cores=cores)


tri_keep = new_annulus$delvor.obj$tri.obj$trlist[which(new_annulus$delvor.obj$tri.obj$cclist[,3]<new_annulus$alpha), 1:3]
dim_tri = dim(tri_keep)[1]
tri_keep = as.vector(t(tri_keep))
triangles = data.frame("id"=sort(rep(1:dim_tri, 3)), 
                       "x"=new_annulus$x[tri_keep, 1], 
                       "y"=new_annulus$x[tri_keep,2])
extremes = as.data.frame(new_annulus$x[new_annulus$alpha.extremes,])

edges = as.data.frame(new_annulus$edges[,3:6])

ggplot(data.frame(new_annulus$x), aes(x=X1, y=X2)) +
  geom_polygon(data=triangles, aes(x=x, y=y, group=id), fill="gray") +
  geom_segment(data=edges, aes(x=x1, y=y1, xend=x2, yend=y2), color="blue")+
  geom_point(data=extremes, aes(x=V1, y=V2), size=1.5)+
  theme_classic()

