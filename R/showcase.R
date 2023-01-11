#' Launch the gallery of dcamodules
#'
#' @description
#' A gallery of all components available in dcamodules
#' @examples
#' if (interactive()) {
#'   dcamodules::showcase()
#' }
#' @rdname showcase
#' @export
showcase <- function() {
  Sys.setenv(WORKING_DIR = getwd())
  shiny::shinyAppFile(system.file("examples/app.R", package = "dcamodules", mustWork = TRUE))
}
