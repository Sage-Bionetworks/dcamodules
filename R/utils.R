#' Extract tab names
#'
#' @param .tab The \code{tabItem} object
#'
#' @export
getTabNames <- function(.tab) {
  sapply(.tab$children, function(tab) {
    id <- htmltools::as.tags(tab)$attribs$id
    gsub("shiny-tab-", "", id)
  })
}


#' var2server
#'
#' @description Use this trick to send variables from ui to server in module
#' @param id The input variable to read value from
#' @param values The values need to be sent
#'
#' @export
#'
var2server <- function(id, values) {

  out <- selectInput(id,
              "",
              choices = values,
              selected = values,
              multiple = TRUE)
  out$attribs$class <- paste0(out$attribs$class, " dca-remove")

  return(out)
}


#' tagInsertAttribute
#'
#' @param .tag The tag object
#' @param pos After which position to insert attributes
#' @param ... List of tag attributes
#'
#' @export
#'
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
#' dropEmptys
#'
#' @param x List of input values
#' @param drop Which type of values to drop
#' 
#' @export
#'
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
