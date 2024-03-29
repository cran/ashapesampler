% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mcmc.R
\name{generate_ashape3d}
\alias{generate_ashape3d}
\title{Generate 3D alpha shape}
\usage{
generate_ashape3d(
  point_cloud,
  J,
  tau,
  delta = 0.05,
  afixed = TRUE,
  mu = NULL,
  sig = NULL,
  sample_rad = NULL,
  acc_rad = NULL,
  k_min = 3,
  eps = 1e-04,
  cores = 1
)
}
\arguments{
\item{point_cloud}{3 column matrix of all points from all shapes in initial
data set}

\item{J}{number of shapes in initial data set}

\item{tau}{tau bound for the shapes}

\item{delta}{probability of not preserving homology; default is 0.05}

\item{afixed}{boolean, whether to sample alpha or leave fixed based on tau. Default FALSE}

\item{mu}{mean of truncated distribution from which alpha sampled; default tau/3}

\item{sig}{standard deviation of truncated distribution from which alpha
sampled; default tau/12}

\item{sample_rad}{radius of ball around each point in point cloud from which to
sample; default tau/8}

\item{acc_rad}{radius of ball to check around potential sampled points for whether
to accept or reject new point; default tau/4}

\item{k_min}{number of points needed in radius 2 alpha of point cloud to accept a sample}

\item{eps}{amount to subtract from tau/2 to give alpha. Defaul 1e-4.}

\item{cores}{number of cores for parallelizing. Default 1.}
}
\value{
new_ashape three dimensional alpha shape object from alphashape3d library
}
\description{
Generate 3D alpha shape
}
