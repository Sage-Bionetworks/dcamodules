#' Create button to switch tabs
#'
#' @param .tab The \code{tabItem} object.
#' @param id The input variable to read value from. If NULL is set, 'dca-tab-switch' will be used for 'id'.
#' @examples
#' if (interactive()) {
#'   library(shinydashboard)
#'   library(magrittr)
#'   library(dcamodules)
#'   # add after tabItems via pipe %>%
#'   # or move tabItems inside of tabSwitchUI
#'   tabItems(
#'     tabItem(tabName = "awesome-tab")
#'   ) %>% tabSwitchUI()
#' }
#' @rdname tabSwitchUI
#' @export
#' @importFrom magrittr %>%
#' @importFrom htmltools tagAppendChild
tabSwitchUI <- function(.tab, id = NULL) {
  if (is.null(id)) id <- "dca-tab-switch"
  ns <- NS(id)

  n_tabs <- length(.tab$children)

  tab_names <- get_tab_names(.tab)
  var1 <- var_to_server(ns("tab-names"), tab_names)

  switch_btn_ids <- c(NS("prev", n_tabs))

  .tab$children[[n_tabs]] <- .tab$children[[n_tabs]] %>%
    htmltools::tagAppendChild(
      fluidRow(
        lapply(1:3, function(i) br()),
        column(1, offset = 1, arrowButton(ns(NS("prev", n_tabs)), "left")),
        lapply(1:3, function(i) br())
      )
    )

  if (n_tabs > 1) {
    .tab$children[[1]] <- .tab$children[[1]] %>%
      htmltools::tagAppendChild(
        fluidRow(
          lapply(1:3, function(i) br()),
          column(1, offset = 10, arrowButton(ns(NS("next", 1)), "right")),
          lapply(1:3, function(i) br())
        )
      )
    switch_btn_ids <- c(switch_btn_ids, NS("next", 1))
  }

  if (n_tabs > 2) {
    lapply(2:(n_tabs - 1), function(i) {
      .tab$children[[i]] <<- .tab$children[[i]] %>%
        htmltools::tagAppendChild(
          fluidRow(
            lapply(1:3, function(i) br()),
            column(1, offset = 1, arrowButton(ns(NS("prev", i)), "left")),
            column(1, offset = 8, arrowButton(ns(NS("next", i)), "right")),
            lapply(1:3, function(i) br()),
          )
        )
      switch_btn_ids <<- c(switch_btn_ids, c(NS("prev", i), NS("next", i)))
    })
  }

  var2 <- var_to_server(ns("switch-ids"), switch_btn_ids)

  return(tagList(.tab, var1, var2))
}

#' Tab switch button server
#'
#' @param id The input id to read value from.
#' @param tab.id The id of \code{sidebarMenu} object.
#' @param parent.session The session from parent scope.
#' @param parent.input The input from parent scope.
#' @param parent.output The output from parent scope.
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(shinydashboard)
#'   library(dcamodules)
#'   ui <- dashboardPage(
#'     dashboardHeader(),
#'     dashboardSidebar(
#'       sidebarMenu(
#'         id = "tabs",
#'         menuItem("awesome_tab")
#'       )
#'     ),
#'     dashboardBody(
#'       tabSwitchUI(
#'         id = "switch",
#'         tabItems(tabItem("awesome_tab"))
#'       )
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     tabSwitch("switch", "tabs", session, input, output)
#'   }
#'   shinyApp(ui, server)
#' }
#' @rdname tabSwitch
#' @export
#' @importFrom shinydashboard updateTabItems
tabSwitch <- function(id, tab.id, parent.session, parent.input, parent.output) {
  moduleServer(
    id,
    function(input, output, session) {
      lapply(isolate(input[["switch-ids"]]), function(name) {
        observeEvent(input[[name]],
          {
            tab_names <- input[["tab-names"]]
            curr_inx <- which(tab_names == parent.input[[tab.id]])
            # switch to next/previous tab based on which btn is clicked
            i <- ifelse(grepl("prev-[1-9+]", name), -1, 1)
            updateTabItems(parent.session,
              tab.id,
              selected = tab_names[curr_inx + i]
            )
          },
          ignoreNULL = TRUE,
          ignoreInit = FALSE
        )
      })
    }
  )
}
