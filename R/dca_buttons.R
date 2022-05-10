
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

  btn <-  tags$button(
    id = id,
    type = "button",
    class = sprintf("btn btn-default action-button dca-%s-btn", direction),
    `data-val` = value,
    list(
      ifelse(direction == "left", icon_left, icon_right)
    ),
    ...
  )
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
mediaButton <- function(icon, link = NULL, ...) {

  btn <- tags$a(
      shiny::icon(icon),
      href = link,
      target = "_blank",
      class = "dca-icon-btn",
      ...
    )
  add_deps(btn)
}


#' Title
#'
#' @param id
#' @param color
#'
#' @return
#' @export
#'
#' @examples
paletteButton <- function(id, color, ...) {

  value <- restoreInput(id = id, default = NULL)

  btn <- tags$button(
    id = id,
    type = "button",
    class = "action-button dca-palette-btn",
    `data-val` = value,
    shiny::icon(
      "circle",
      style = sprintf("color: %s;", color)
    ),
    ...
  )
  add_deps(btn)
}
