#' Title
#'
#' @param id
#' @param ...
#'
#' @return
#' @importFrom colourpicker colourInput
#' @importFrom sagethemes sage_colors
#' @export
#'
#' @examples
palettePanelUI <- function(id) {

  ns <- NS(id)
  bg_cls <- unlist(sage_colors)
  font_cls <- c("#000000", "#FFFFFF")
  defaults <- list(
    header_bg_cl = "#3c8dbc",
    sidebar_bg_cl = "#222d32",
    content_bg_cl = "#ecf0f5",
    footer_bg_cl = "#222d32",
    waiter_bg_cl = "#3c8dbc",
    header_font_cl = "#3c8dbc",
    sidebar_font_cl = "#b8c7ce",
    content_font_cl = "#444444",
    footer_font_cl = "#b8c7ce",
    waiter_font_cl ="#444444"
  )

  sections <- c("header", "sidebar", "content", "footer", "waiter")
  value <- restoreInput(id = id, default = NULL)

  tags$div(
    id = ns("dca-palette-panel"),
    tagList(
      fluidRow(
        lapply(sections, function(s) {
          column(2,
            h4(s, class = "text-center text-capitalize"),
            tagList(
              colourInput(ns(NS(s, "bg-cl")), "background",
                          palette = "limited",
                          value = NULL,
                          allowedCols = c(defaults[[paste0(s, "_bg_cl")]], bg_cls)
              ),
              colourInput(ns(NS(s, "font-cl")), "font",
                          palette = "limited",
                          value = NULL,
                          allowedCols = c(defaults[[paste0(s, "_font_cl")]], font_cls)
              )
            )
          )
        })
      ),
      tagList(
        actionButton(ns("save-btn"), "save"),
        textOutput(ns("save-progress"))
      )
    )
  )
}


#' Title
#'
#' @param id
#' @param parent.session
#' @param parent.input
#' @param parent.output
#'
#' @return
#' @export
#'
#' @examples
palettePanel <- function(id, header.id, parent.session, parent.input, parent.output) {
  moduleServer(
    id,
    function(input, output, session) {

      colors <- c("#d5cfe3", "#b2a5d1", "#907fba", "#5a478f",
                  "#47337d", "#332069", "#251454", "#e1f4f5",
                  "#c5edf0", "#a6dde0", "#7ec8cc", "#5bb0b5",
                  "#2f8e94", "#0c656b")
      sections <- c("header", "sidebar", "content", "footer", "waiter")

      vars <- reactive({
        bg_cls <- lapply(sections, function(s) input[[NS(s, "bg-cl")]])
        font_cls <- lapply(sections, function(s) input[[NS(s, "font-cl")]])
        vars <- c(bg_cls, font_cls)
        names(vars) <- c(paste0(sections, "-bg-cl"), paste0(sections, "-font-cl"))
        return(vars)
      })

      observeEvent(vars(), {
        output[["save-progress"]] <- renderText(NULL)
        parent.output[[header.id]] <- renderUI({
          set_theme(vars())
        })
      })

      observeEvent(input$`save-btn`, {
        vars()
        path <- "./theme_config.rds"
        isolate({
          saveRDS(vars(), path)
          output[["save-progress"]] <- renderText(
            sprintf("'%s' is updated!", path)
            )
        })
      })
    }
  )
}
