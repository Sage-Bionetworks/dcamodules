#' @title shinyButton
#'
#' @description
#' A button with shiny effect
#'
#' @export
#' @importFrom shiny tags
#' @examples
#'
#' if (interactive()) {
#'
#'  shinyButton()
#'
#' }
shinyButton <- function() {
  tag <- tags$button(
    type = "button",
    class = "btn-shiny-effect",
    "Button"
  )
  add_deps(tag)
}


