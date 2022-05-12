#' onload
#'
#' @noRd
#' @import shiny
.onLoad <- function(...) {
  shiny::addResourcePath("assets", system.file("assets", package = "dcamodules"))
}
