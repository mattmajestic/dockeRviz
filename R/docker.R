#' Visualize Dockerfile
#'
#' This function allows you to visualize a Dockerfile by extracting and displaying its instructions in a bar chart.
#'
#' @import plotly
#' @import RColorBrewer
#' @importFrom stats setNames
#' @export
#'
#' @return An interactive bar chart displaying Dockerfile instructions.
#'
#' @examples
#' \dontrun{
#' docker()
#' }
#'
#' @author Your Name
#'
#' @seealso \code{\link{docker_compose}}, \code{\link{whats_docker}}, \code{\link{docker_info}}
#'
docker <- function() {
  if(!file.exists("Dockerfile")) {
    return("Dockerfile does not exist")
  }

  dockerfile_lines <- readLines("Dockerfile")

  extract_instructions <- function(dockerfile) {
    instructions <- c("FROM", "RUN", "CMD", "LABEL", "EXPOSE", "ENV", "ADD", "COPY", "ENTRYPOINT", "VOLUME", "USER", "WORKDIR", "ARG", "ONBUILD", "STOPSIGNAL", "HEALTHCHECK", "SHELL")
    colors <- RColorBrewer::brewer.pal(min(length(instructions), 9), "Set3")
    color_map <- setNames(colors[1:length(instructions)], instructions)
    instruction_data <- data.frame(Step = integer(0), Instruction = character(0), Detail = character(0), Color = character(0))

    step_counter <- 1
    for (line in dockerfile) {
      for (inst in instructions) {
        if (grepl(paste0("^", inst), line, ignore.case = TRUE)) {
          instruction_label <- paste(step_counter, inst)
          instruction_data <- rbind(instruction_data, data.frame(Step = step_counter, Instruction = instruction_label, Detail = line, Color = color_map[inst]))
          step_counter <- step_counter + 1
          break
        }
      }
    }
    instruction_data
  }

  instruction_data <- extract_instructions(dockerfile_lines)

  max_step_length <- max(instruction_data$Step)
  plot_ly(instruction_data, x = ~Step, y = ~Instruction, type = 'bar', text = ~Detail,
          hoverinfo = 'text', marker = list(color = ~Color), width = 0.5) %>%
    layout(title = "Dockerfile Instructions Visualization",
           xaxis = list(title = "Step Number", range = c(0, max_step_length + 1)),
           yaxis = list(title = "Instruction Type (Step Number)", autorange = "reversed"))
}
