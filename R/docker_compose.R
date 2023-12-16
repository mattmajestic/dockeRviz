#' Display Docker Compose Services
#'
#' This function reads the Docker Compose configuration from the "docker-compose.yml" file in the current
#' working directory and displays information about the defined services, including their names and exposed ports.
#'
#' @import DT
#' @importFrom yaml yaml.load
#' @export
#'
#' @return An HTML widget displaying Docker Compose service information.
#'
#' @examples
#' \dontrun{
#' docker_compose()
#' }
#'
#' @author Matt Majestic
#'
#' @seealso \code{\link{docker_info}}, \code{\link{whats_docker}}
#'

docker_compose <- function() {
  compose_yaml <- readLines("docker-compose.yml")
  yaml_string <- paste(compose_yaml, collapse = "\n")
  compose_data <- yaml::yaml.load(yaml_string)

  # Create a data frame to store service info
  services_df <- data.frame(
    Service = character(0),
    Ports = character(0),
    stringsAsFactors = FALSE
  )

  # Iterate through each service
  for (service_name in names(compose_data$services)) {
    service <- compose_data$services[[service_name]]

    # Extract ports information
    ports <- ifelse(!is.null(service$ports), paste(service$ports, collapse = ","), "N/A")

    # Add service info to the data frame
    services_df <- rbind(services_df, data.frame(Service = service_name, Ports = ports))
  }

  # Create an interactive table
  compose_dt <- DT::datatable(services_df,
                options = list(dom = 't', paging = FALSE),
                extensions = 'Buttons',
                rownames = FALSE,
                selection = 'none',
                class = 'display')

  intro <- tags$div(
    style = "font-family: Arial, sans-serif; padding: 20px; clear: both;",
    tags$h3("🐳Docker Compose Services"),
    tags$ul(
      style = "list-style-type: disc; padding-left: 20px;",
      tags$li("No running Docker containers. 😞")
    )
  )

  html_print(tags$div(intro, compose_dt))
}
