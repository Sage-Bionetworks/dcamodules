#' onload
#'
#' @noRd
#'
.onLoad <- function(...) {
  shiny::addResourcePath("assets", system.file("assets", package="dcamodules"))
}
