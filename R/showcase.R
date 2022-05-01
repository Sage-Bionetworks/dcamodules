#' @title Launch the dcamodules Gallery
#'
#' @description
#' A gallery of all components available in dcamodules
#'
#' @export
#'
#' @examples
#'
#' if (interactive()) {
#'
#'  dcamodules::showcase()
#'
#' }
showcase <- function() {
  shiny::shinyAppFile(system.file('examples/app.R', package = 'dcamodules', mustWork = TRUE))
}
