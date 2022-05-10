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
  out$attribs$class <- paste0(out$attribs$class, " dca-remove")

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


### utils
#' Title
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
dropEmptys <- function(x, drop = "all") {

  match.arg(drop, c("all", "na", "null", "blank"))

  if (drop == "all") {
    res <- is.na(x) | sapply(x, is.null) | trimws(x, "both") == ""
  } else {
    if (drop == "na") res <- is.na(x)
    if (drop == "null") res <- sapply(x, is.null)
    if (drop == "blank") res <- trimws(x, "both") == ""
  }
  return(x[!res])
}
