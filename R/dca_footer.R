
#' Title
#'
#' @param label
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
dcaFooter <- function(message, media = NULL, height = "100px", ...) {

  tags$div(
    class = "dca-footer-placeholder",
    style = glue::glue("max-height: {height};"),
    tags$footer(
      class = "dca-footer",
      style = glue::glue("max-height: {height};"),
      tagList(
        if(!is.null(media)) div(class = "dca-footer-media", list(media)),
        div(class = "dca-footer-msg", list(message))
      ),
      ...
    )
  )
}

