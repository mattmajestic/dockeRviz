% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/docker_compose.R
\name{docker_compose}
\alias{docker_compose}
\title{Display Docker Compose Services}
\usage{
docker_compose()
}
\value{
An HTML widget displaying Docker Compose service information.
}
\description{
This function reads the Docker Compose configuration from the "docker-compose.yml" file in the current
working directory and displays information about the defined services, including their names and exposed ports.
}
\examples{
\dontrun{
docker_compose()
}

}
\seealso{
\code{\link{docker_info}}, \code{\link{whats_docker}}
}
\author{
Matt Majestic
}
