
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
#'  shinyButton("button")
#'
#' }
shinyButton <- function(id, label="Button", ...) {
  btn <- tags$button(
    id = id,
    type = "button",
    class = "btn btn-default action-button dca-shiny-btn",
    list(label),
    ...
  )
  add_deps(btn)
}


#' Title
#'
#' @param id
#' @param direction
#'
#' @return
#' @export
#'
#' @examples
arrowButton <- function(id, direction = "left") {
  match.arg(direction, c("left", "right"))
  icon_left <- lapply(1:3, function(i) tags$i(class = "fa fa-angle-left"))
  icon_right <- lapply(1:3, function(i) tags$i(class = "fa fa-angle-right"))


  if (direction == "left") {
    btn <- actionButton(id, class = "dca-left-btn", icon_left)
  } else {
    btn <- actionButton(id, class = "dca-right-btn", icon_right)
  }
  add_deps(btn)
}
