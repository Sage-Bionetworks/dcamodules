
#' @title Shiny button
#'
#' @description
#' A button with shiny effect
#'
#' @param id The input id to read value from
#' @param label The display label of the button
#' @param ... List of tag attributes
#' 
#' @import shiny
#' @export
#' @examples
#' if (interactive()) {
#'
#'  shinyButton("button")
#'
#' }
shinyButton <- function(id, label, ...) {

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


#' Arrow button
#'
#' @param id The input id to read value from
#' @param direction The direction of arrow button
#' @param ... List of tag attributes
#'
#' @export
#'
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


#' Media button
#'
#' @param icon The icon object from \code{shiny::icon}
#' @param link The redirecting url
#' @param ... List of tag attributes
#'
#' @export
mediaButton <- function(icon, link = NULL, ...) {

  btn <- tags$a(
      icon(icon),
      href = link,
      target = "_blank",
      class = "dca-icon-btn",
      ...
    )
  add_deps(btn)
}


#' Palette button
#'
#' @param id The input id to read value from
#' @param color The color of palette
#' @param ... List of tag attributes
#' 
#' @export
#'
paletteButton <- function(id, color, ...) {

  value <- restoreInput(id = id, default = NULL)

  btn <- tags$button(
    id = id,
    type = "button",
    class = "action-button dca-palette-btn",
    `data-val` = value,
    icon(
      "circle",
      style = sprintf("color: %s;", color)
    ),
    ...
  )
  add_deps(btn)
}
