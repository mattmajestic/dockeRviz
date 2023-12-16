#' What is Docker?
#'
#' Docker is an open-source platform that uses containerization technology to enable developers
#' to package applications and their dependencies into a virtual container. This makes it possible
#' to run applications consistently across various computing environments.
#'
#' @export
#'
#' @seealso \code{\link{docker_info}}, \code{\link{docker_compose}}
#'
#' @return An HTML widget with information about Docker.
#' @import htmltools
#' @import shiny
#'
#' @examples
#' \dontrun{
#' whats_docker()
#' }
#'
#' @seealso https://www.docker.com/
#' @seealso https://docs.docker.com/
#' @seealso https://docs.docker.com/get-started/
#' @seealso https://hub.docker.com/
#' @seealso https://www.docker.com/play-with-docker
#'
#' @author Matt Majestic
#'
#' @export
whats_docker <- function() {
  info <- tags$div(
    style = "font-family: Arial, sans-serif; padding: 20px;",

    tags$h2(style = "color: #007bff;", " What is Docker?"),
    tags$p("Docker is an open-source platform that uses containerization technology to enable developers
           to package applications and their dependencies into a virtual container. This makes it possible
           to run applications consistently across various computing environments."),

    tags$h3(style = "color: #28a745;", " Key Features:"),
    tags$ul(
      tags$li("Containers: Encapsulate application and environment, lightweight compared to virtual machines."),
      tags$li("Portability: Containers can run on any system supporting Docker, eliminating environment inconsistencies."),
      tags$li("Microservices: Ideal for deploying independent services in separate containers."),
      tags$li(" Isolation: Containers are isolated for security and individual scalability."),
      tags$li("Version Control: Docker provides version control for containers.")
    ),

    tags$h3(style = "color: #dc3545;", "Getting Started:"),
    tags$p("Install Docker Engine on your machine and explore Docker's official documentation and resources."),

    tags$h3(style = "color: #17a2b8;", "Resources:"),
    tags$ul(
      tags$li(tags$a(href = "https://www.docker.com/", "Official Website")),
      tags$li(tags$a(href = "https://docs.docker.com/", "Documentation")),
      tags$li(tags$a(href = "https://docs.docker.com/get-started/", "Get Started Guide")),
      tags$li(tags$a(href = "https://hub.docker.com/", "Docker Hub (A repository for Docker images)")),
      tags$li(tags$a(href = "https://www.docker.com/play-with-docker", "Interactive Tutorials"))
    ),

    tags$h3(style = "color: #ffc107;", "Community and Support:"),
    tags$ul(
      tags$li(tags$a(href = "https://forums.docker.com/", "Docker Community Forums")),
      tags$li(tags$a(href = "https://stackoverflow.com/questions/tagged/docker", "Stack Overflow")),
      tags$li(tags$a(href = "https://www.reddit.com/r/docker/", " Docker Subreddit"))
    ),

    tags$h3(style = "color: #6f42c1;", "Further Reading:"),
    tags$ul(
      tags$li("'Docker Deep Dive' by Nigel Poulton"),
      tags$li("'Using Docker: Developing and Deploying Software with Containers' by Adrian Mouat")
    )
  )

  html_print(info)
}
