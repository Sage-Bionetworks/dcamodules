#' onload
#'
#' @noRd
#'
.onLoad <- function(...) {
  addResourcePath("assets", system.file("assets", package="dcamodules"))
}
