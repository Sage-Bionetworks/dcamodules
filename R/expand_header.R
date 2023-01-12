#' Expand dashboardheader
#'
#' @description Expand the ui to \code{dashboardheader}.
#' @param header \code{dashboardheader}.
#' @param left The left menu in the header.
#' @examples
#' if (interactive()) {
#'   library(shinydashboard)
#'   dashboardheader() %>%
#'     expandHeader()
#'   )
#' }
#' @rdname expandHeader
#' @export
expandHeader <- function(.header, left = NULL) {
  header <- htmltools::as.tags(.header)
  nav_index <- which(as.character(sapply(header$children, `[[`, 1)) == "nav")

  if (!is.null(left)) {
    left_menu <- shiny::tags$div(
      class = "navbar-custom-menu left",
      style = "float: left; margin-left: 10px;",
      shiny::tags$ul(
        class = "nav navbar-nav",
        left
      )
    )
    header$children[[nav_index]] <- htmltools::tagInsertChildren(header$children[[nav_index]], after = 2, left_menu)
  }
  return(header)
}
