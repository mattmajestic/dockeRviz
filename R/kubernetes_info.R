#' Visualize Kubernetes Information
#'
#' This function checks if Kubernetes is installed on the system and displays relevant information
#' about the Kubernetes cluster if it's installed.
#'
#' @importFrom DT datatable
#' @export
#'
#' @return An interactive table displaying Kubernetes cluster information if Kubernetes is installed.
#'
#' @examples
#' \dontrun{
#' kubernetes_info()
#' }
#'
#' @author Your Name
#'
#' @seealso \code{\link{docker_compose}}, \code{\link{whats_docker}}, \code{\link{docker_info}}, \code{\link{docker}}
#'
kubernetes_info <- function() {
  if (Sys.which("kubectl") == "") {
    intro <- tags$div(
      style = "font-family: Arial, sans-serif; padding: 20px; clear: both;",
      tags$h3("🚀 Kubernetes Information"),
      tags$p("Kubernetes is not installed on this system. 😞")
    )
  } else {
    intro <- tags$div(
      style = "font-family: Arial, sans-serif; padding: 20px; clear: both;",
      tags$h3("🚀 Kubernetes Information"),
      tags$p("Kubernetes is installed and ready to use! 🎉")
    )
  }

  kubernetes_data <- data.frame(
    Name = c("Cluster Name", "API Server", "Nodes", "Pods"),
    Value = c("MyCluster", "https://api.mycluster.com", 3, 10)
  )

  kubernetes_dt <- DT::datatable(kubernetes_data,
                                 options = list(dom = 't', paging = FALSE),
                                 extensions = 'Buttons',
                                 rownames = FALSE,
                                 selection = 'none',
                                 class = 'display'
  )

  html_print(tags$div(intro, kubernetes_dt))
}
