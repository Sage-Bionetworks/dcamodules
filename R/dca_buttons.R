
#' @title shinyButton
#'
#' @description
#' A button with shiny effect
#'
#' @export
#' @examples
#'
#' if (interactive()) {
#'
#'  shinyButton("button")
#'
#' }
shinyButton <- function(id, label = NULL, ...) {

  value <- restoreInput(id = id, default = NULL)

  btn <- tags$button(
    id = id,
    type = "button",
    class = "btn btn-default action-button dca-shiny-btn",
    `data-val` = value,
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
arrowButton <- function(id, direction = "left", ...) {
  match.arg(direction, c("left", "right"))
  icon_left <- lapply(1:3, function(i) tags$i(class = "fa fa-angle-left"))
  icon_right <- lapply(1:3, function(i) tags$i(class = "fa fa-angle-right"))

  value <- restoreInput(id = id, default = NULL)

  if (direction == "left") {
    btn <-  tags$button(
      id = id,
      type = "button",
      class = "btn btn-default action-button dca-left-btn",
      `data-val` = value,
      icon_left,
      ...
    )
  } else {
    btn <- tags$button(
      id = id,
      type = "button",
      class = "btn btn-default action-button dca-right-btn",
      `data-val` = value,
      icon_right,
      ...
    )
  }
  add_deps(btn)
}


#' Title
#'
#' @param icon
#' @param link
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
iconButton <- function(icon, link, ...) {
  btn <- tags$a(
    icon,
    href = link,
    target = "_blank",
    class = "dca-icon-btn",
    ...
  )
  add_deps(btn)
}
