#' Data Curator Footer
#'
#' @description Add footer to the bottom of \code{dashboardSidebar} or \code{dashboardBody}.
#' @param message The main text section at the bottom of footer.
#' @param media The top section for media links. Default to NULL.
#' @param height The height of footer. Default to '100px'/
#' @param ... List of tag attributes
#' @examples
#' if (interactive()) {
#'   library(shinydashboard)
#'   dashboardBody(
#'     dcaFooter("
#'       Copy right 2022",
#'       media = mediaButton("google", "https://google.com")
#'     )
#'   )
#' }
#' @rdname dcaFooter
#' @export
dcaFooter <- function(message, media = NULL, height = "100px", ...) {

  height <- validateCssUnit(height)
  tags$div(
    class = "dca-footer-placeholder",
    style = sprintf("height: %s;", height),
    tags$footer(
      class = "dca-footer",
      style = sprintf("max-height: %s;", height),
      tagList(
        if (!is.null(media)) div(class = "dca-footer-media", list(media)),
        div(class = "dca-footer-msg", list(message))
      ),
      ...
    )
  )
}
