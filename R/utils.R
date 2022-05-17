#' Extract tab names
#'
#' @description Get tab names from \code{tabItem} object.
#' @param .tab .tab The \code{tabItem} object.
#' @return A vector of tab names.
#' @examples
#' \dontrun{
#' tab_object <- tabItems(
#'   tabItem(tabName = "tab1"),
#'   tabItem(tabName = "tab2"),
#'   tabItem(tabName = "tab3")
#' )
#' print(get_tab_names(tab_object))
#' # [1] "tab1" "tab2" "tab3"
#' }
#' @rdname get_tab_names
#' @export
#' @importFrom htmltools as.tags
get_tab_names <- function(.tab) {
  sapply(.tab$children, function(tab) {
    id <- htmltools::as.tags(tab)$attribs$id
    gsub("shiny-tab-", "", id)
  })
}


#' Send values from module UI to module Server
#'
#' @description Use this trick to send values from ui to server in module.
#' @param id The input variable to read value from.
#' @param values The values need to be sent.
#' @return The hidden \code{selectInput} object.
#' @examples
#' \dontrun{
#' widgetUI <- function(id) {
#'   ns <- NS(id)
#'   items <- c("chicken", "egg")
#'   var_to_server(ns("items"), items)
#' }
#'
#' widgetServer <- function() {
#'   moduleServer(
#'     id,
#'     function(input, output, session) {
#'       # items now can be read in the server
#'       purrr::map_chr(isolate(input$items), print)
#'     }
#'   )
#' }
#' }
#' @rdname var_to_server
#' @export
var_to_server <- function(id, values) {
  out <- selectInput(id,
    "",
    choices = values,
    selected = values,
    multiple = TRUE
  )
  out$attribs$class <- paste0(out$attribs$class, " dca-remove")

  return(out)
}

#' Insert attribute to a shinydashboard::box
#'
#' @param .box The \code{shinydashboard::box} object.
#' @param ... The attributes added to the box
#' @return New box object after adding attributes.
#' @examples
#' \dontrun{
#' insert_attribute(box(), id = "dca")
#' <div class="col-sm-6">
#'   <div class="box" id="dca">
#'   <div class="box-body"></div>
#'   </div>
#' </div>
#' }
#' @rdname insert_attr_box
#' @export
#' @importFrom htmltools tagAppendAttributes
insert_attr_box <- function(.box, ...) {
  .box$children[[1]] <-
      htmltools::tagAppendAttributes(
        .box$children[[1]],
        ...
      )
  return(.box)
}


### utils

#' drop_empty
#'
#' @param x List of input values
#' @param drop Type of values to drop. Default to 'all'.
#' @return clean data
#' @examples
#' if (interactive()) {
#'   values <- c("real", "null", NULL, NA, "  ")
#'   drop_empty(values)
#'   # [1] "real"
#' }
#' @rdname drop_empty
#' @export
#' @importFrom purrr map_lgl
drop_empty <- function(x, drop = "all") {
  match.arg(drop, c("all", "na", "null", "blank"))

  if (drop == "all") {
    res <- is.na(x) | purrr::map_lgl(x, ~ is.null(.x) || .x == "null") | trimws(x, "both") == ""
  } else {
    if (drop == "na") res <- is.na(x)
    if (drop == "null") res <- purrr::map_lgl(x, ~ is.null(.x) || .x == "null")
    if (drop == "blank") res <- trimws(x, "both") == ""
  }
  return(x[!res])
}
