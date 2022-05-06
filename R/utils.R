#' test
#'
#' @param .tab
#'
#' @return
#' @import htmltools
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
#' @import shiny
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


#' Title
#'
#' @param .tag
#' @param ...
#' @param pos
#'
#' @return
#' @export
#'
#' @examples
tagInsertAttribute <- function(.tag, ..., pos = 1) {
  if (pos == 0) {
    .tag <- tagAppendAttributes(.tag, ...)
  } else {
    .tag$children[[pos]] <- tagAppendAttributes(
      .tag$children[[pos]],
      ...
      )
  }
  return(.tag)
}
