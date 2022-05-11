
#' Data Curator Footer
#'
#' @param message The main text section at the bottom of footer
#' @param media The top section for media links
#' @param height The height of footer
#' @param ... List of tag attributes
#'
#' @export
dcaFooter <- function(message, media = NULL, height = "100px", ...) {
  tags$div(
    class = "dca-footer-placeholder",
    style = sprintf("max-height: %s;", height),
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
