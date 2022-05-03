# Copy from https://github.com/rstudio/shiny/blob/ac84be956a1417a613e0b6ebeea75b08f9302df2/R/shiny.R#L2571-L2582
validate_session_object <- function(session, label = as.character(sys.call(sys.parent())[[1]])) {
  if (missing(session) ||
      !inherits(session, c("ShinySession", "MockShinySession", "session_proxy")))
  {
    stop(call. = FALSE,
         sprintf(
           "`session` must be a 'ShinySession' object. Did you forget to pass `session` to `%s()`?",
           label
         )
    )
  }
}

#' test
#'
#' @param .tab
#'
#' @return
#' @export
#'
#' @examples
get_tab_names <- function(.tab) {
  sapply(.tab$children, function(tab) {
    id <- htmltools::as.tags(tab)$attribs$id
    gsub("shiny-tab-", "", id)
  })
}


#' var2server
#'
#' @description use this trick to send variables from ui to server in module
#' @param id
#' @param values
#'
#' @return
#' @export
#'
#' @examples
var2server <- function(id, values) {

  out <- selectInput(id,
              "",
              choices = values,
              selected = values,
              multiple = TRUE)
  out$attribs$class <- paste0(out$attribs$class, " dca-hidden")

  return(out)
}
