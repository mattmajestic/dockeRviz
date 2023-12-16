#' View Docker Information
#'
#' This function provides information about the Docker setup on your system, including whether Docker is installed,
#' if the Docker daemon is running, Docker version, all Docker images (only names), and all running Docker containers (only names).
#'
#' @importFrom htmltools tags h2 p h3 pre ul li
#' @export
#'
#' @return An HTML widget displaying Docker information.
#'
#' @examples
#' \dontrun{
#' docker_info()
#' }
#'
#' @author Your Name
#'
#' @seealso \code{\link{docker_compose}}, \code{\link{whats_docker}}
#'
docker_info <- function() {
  # Check if Docker is installed
  if (Sys.which("docker") == "") {
    info <- tags$div(
      style = "font-family: Arial, sans-serif; padding: 20px;",
      tags$h2("🐳 Docker Information"),
      tags$p("Docker is not installed on this system. 😞")
    )
    html_print(info)
    return()
  }

  # Check if Docker daemon is running
  docker_running <- system("docker info > /dev/null 2>&1", ignore.stdout = TRUE, ignore.stderr = TRUE) == 0

  # Get Docker version
  docker_version_cmd <- "docker --version"
  docker_version_info <- system(docker_version_cmd, intern = TRUE)

  # Get all Docker images (only names)
  docker_images_cmd <- "docker images --format '{{.Repository}}:{{.Tag}}'"
  docker_images_info <- system(docker_images_cmd, intern = TRUE)

  # Get all running Docker containers (only names)
  docker_containers_cmd <- "docker ps --format '{{.Names}}'"
  docker_containers_info <- system(docker_containers_cmd, intern = TRUE)

  info_left <- tags$div(
    style = "font-family: Arial, sans-serif; padding: 20px; float: left; width: 50%;",
    tags$h3("🐳 Docker Information"),
    tags$p(ifelse(docker_running, "Docker is running. 😄", "Docker is installed but not running. 😞")),
    tags$h3("Docker Version Information:"),
    tags$pre(
      style = "background-color: #f8f9fa; padding: 10px; border: 1px solid #dee2e6; border-radius: 5px;",
      paste(docker_version_info, collapse = "\n")
    )
  )

  if (length(docker_images_info) > 0) {
    info_right <- tags$div(
      style = "font-family: Arial, sans-serif; padding: 20px; float: left; width: 50%;",
      tags$h3("🐳 All Docker Images:"),
      tags$ul(
        style = "list-style-type: disc; padding-left: 20px;",
        lapply(strsplit(docker_images_info, "\n"), function(img) tags$li(img))
      )
    )
  } else {
    info_right <- tags$div(
      style = "font-family: Arial, sans-serif; padding: 20px; float: left; width: 50%;",
      tags$h3("🐳 All Docker Images:"),
      tags$ul(
        style = "list-style-type: disc; padding-left: 20px;",
        tags$li("No Docker images found. 😞")
      )
    )
  }

  if (length(docker_containers_info) > 0) {
    info_containers <- tags$div(
      style = "font-family: Arial, sans-serif; padding: 20px; clear: both;",
      tags$h3("🐳 All Running Docker Containers:"),
      tags$ul(
        style = "list-style-type: disc; padding-left: 20px;",
        lapply(strsplit(docker_containers_info, "\n"), function(container) tags$li(container))
      )
    )
  } else {
    info_containers <- tags$div(
      style = "font-family: Arial, sans-serif; padding: 20px; clear: both;",
      tags$h3("🐳 All Running Docker Containers:"),
      tags$ul(
        style = "list-style-type: disc; padding-left: 20px;",
        tags$li("No running Docker containers. 😞")
      )
    )
  }

  html_print(tags$div(info_left, info_right, info_containers))
}

