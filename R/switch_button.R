#' Title
#'
#' @param id
#' @param .tab
#'
#' @return
#' @export
#'
#' @examples
tabSwitchUI <- function(.tab, id=NULL) {

  if (is.null(id)) id <- "dca-tab-switch"
  ns <- NS(id)

  n_tabs <- length(.tab$children)

  tab_names <- get_tab_names(.tab)
  var1 <- var2server(ns("tab-names"), tab_names)

  switch_btn_ids <- c(NS("prev", n_tabs))

  .tab$children[[n_tabs]] <- .tab$children[[n_tabs]] %>%
    tagAppendChild(
      fluidRow(
        br(), br(), br(),
        column(1, offset = 1, arrowButton(ns(NS("prev", n_tabs)), "left"))
        )
      )

  if (n_tabs > 1) {
    .tab$children[[1]] <- .tab$children[[1]] %>%
      tagAppendChild(
        fluidRow(
          br(), br(), br(),
          column(1, offset = 10, arrowButton(ns(NS("next", 1)), "right"))
        )
      )
    switch_btn_ids <- c(switch_btn_ids, NS("next", 1))
  }

  if (n_tabs > 2) {
    lapply(2:(n_tabs-1), function(i) {
      .tab$children[[i]] <<- .tab$children[[i]] %>%
        tagAppendChild(
          fluidRow(
            br(), br(), br(),
            column(1, offset = 1, arrowButton(ns(NS("prev", i)), "left")),
            column(1, offset = 8, arrowButton(ns(NS("next", i)), "right"))
          )
        )
      switch_btn_ids <<- c(switch_btn_ids, c(NS("prev", i), NS("next", i)))
    })

  }

  var2 <- var2server(ns("switch-ids"), switch_btn_ids)

  return(tagList(.tab, var1, var2))
}

#' Title
#'
#' @param id
#' @param tab.id
#' @param tabList
#' @param parent.session
#' @param parent.input
#' @param parent.output
#'
#' @return
#' @export
#'
#' @examples
tabSwitch <- function(id, tab.id, parent.session, parent.input, parent.output) {
  moduleServer(
    id,
    function(input, output, session) {

      lapply(isolate(input[["switch-ids"]]), function(name) {

        observeEvent(input[[name]], {

          tab_names <- input[["tab-names"]]
          curr_inx <- which(tab_names == parent.input[[tab.id]])
          # switch to next/previous tab based on which btn is clicked
          i <- ifelse(grepl("prev-[1-9+]", name), -1, 1)
          updateTabItems(parent.session,
                         tab.id,
                         selected = tab_names[curr_inx + i])

        }, ignoreNULL = TRUE, ignoreInit = FALSE)
      })
    }
  )
}
