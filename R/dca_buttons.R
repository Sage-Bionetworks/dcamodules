#' Shiny button
#'
#' @param id The input id to read value from.
#' @param label The display label of the button.
#' @param ... List of tag attributes.
#' @examples
#' if (interactive()) {
#'   shinyButton("awesome-id", "button")
#' }
#' @rdname shinyButton
#' @export
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
}


#' Arrow button
#'
#' @param id The input id to read value from.
#' @param direction The direction of arrow button.
#' @param ... List of tag attributes.
#' @examples
#' if (interactive()) {
#'   arrowButton("awesome-id", direction = "left")
#' }
#' @rdname arrowButton
#' @export
arrowButton <- function(id, direction = "left", ...) {
  match.arg(direction, c("left", "right"))
  icon_left <- lapply(1:3, function(i) tags$i(class = "fa fa-angle-left"))
  icon_right <- lapply(1:3, function(i) tags$i(class = "fa fa-angle-right"))

  value <- restoreInput(id = id, default = NULL)

  btn <- tags$button(
    id = id,
    type = "button",
    class = sprintf("btn btn-default action-button dca-%s-btn", direction),
    `data-val` = value,
    list(
      if (direction == "left") icon_left else icon_right
    ),
    ...
  )
}


#' Media button
#'
#' @param icon The icon object from \code{shiny::icon}
#' @param link The redirecting url
#' @param ... List of tag attributes
#' @examples
#' if (interactive()) {
#'   mediaButton("github", "https://github.com")
#' }
#' @rdname mediaButton
#' @export
mediaButton <- function(icon, link = NULL, ...) {
  btn <- tags$a(
    icon(icon),
    href = link,
    target = "_blank",
    class = "dca-icon-btn",
    ...
  )
}
