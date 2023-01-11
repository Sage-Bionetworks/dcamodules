#' Create an palette panel
#'
#' @param id output variable to read the value from.
#' @keywords internal
#' @rdname palettePanelUI
#' @export
#' @importFrom sagethemes sage_colors
#' @importFrom colourpicker colourInput
palettePanelUI <- function(id) {
  ns <- NS(id)

  base_cls <- c(
    "#3c8dbc", "#222d32", "#ecf0f5", "#605ca8",
    "#00a65a", "#dd4b39", "#f39c12"
  )
  bg_cls <- c(base_cls, unlist(sagethemes::sage_colors))
  defaults <- list(
    header_bg_cl = "#3c8dbc",
    sidebar_bg_cl = "#222d32",
    content_bg_cl = "#ecf0f5",
    footer_bg_cl = "#222d32",
    waiter_bg_cl = "#3c8dbc"
    # header_font_cl = "#3c8dbc",
    # sidebar_font_cl = "#b8c7ce",
    # content_font_cl = "#444444",
    # footer_font_cl = "#b8c7ce",
    # waiter_font_cl = "#444444"
  )

  sections <- c("header", "sidebar", "content", "footer", "waiter")

  panel <- tags$li(
    id = ns("panel"),
    class = "dropdown dca-palette-panel",
    list(
      div(
        class = "dca-palette-toggle",
        onClick = "
          $('#dca-palette-menu').toggle();
          $('.dca-palette-panel').toggleClass('open');
        ",
        icon("palette")
      ),
      div(
        id = "dca-palette-menu", # one palette panel for one app makes sense
        style = "display: none;", # close initially
        tagList(
          div(class = "header text-capitalize", "Background Color"),
          lapply(sections, function(s) {
            div(
              class = "menu",
              colourpicker::colourInput(
                ns(NS(s, "bg-cl")),
                s,
                palette = "limited",
                value = defaults[[paste0(s, "_bg_cl")]],
                allowedCols = bg_cls
              )
            )
          }),
          actionButton(ns("save-btn"), "save", class = "save-palette-btn"),
          textOutput(ns("save-progress"))
        )
      )
    )
  )
}


#' Palette panel server
#'
#' @param id The id of the output object.
#' @param head.id The id of head tag that used to change styles.
#' @param parent.session Session from parent scope.
#' @keywords internal
#' @rdname palettePanel
#' @export
palettePanel <- function(id, head.id, parent.session) {
  moduleServer(
    id,
    function(input, output, session) {
      base_cls <- c(
        "#3c8dbc", "#222d32", "#ecf0f5", "#605ca8",
        "#00a65a", "#dd4b39", "#f39c12"
      )
      bg_cls <- c(base_cls, unlist(sagethemes::sage_colors))
      defaults <- list(
        header_bg_cl = "#3c8dbc",
        sidebar_bg_cl = "#222d32",
        content_bg_cl = "#ecf0f5",
        footer_bg_cl = "#222d32",
        waiter_bg_cl = "#3c8dbc"
      )
      sections <- c("header", "sidebar", "content", "footer", "waiter")

      vars <- reactive({
        bg_cls <- lapply(sections, function(s) input[[NS(s, "bg-cl")]])
        names(bg_cls) <- paste0(sections, "-bg-cl")
        # add more variables if requested
        variables <- bg_cls
        return(variables)
      })

      observeEvent(vars(), {
        output[["save-progress"]] <- renderText(NULL)
        parent.session$output[[head.id]] <- renderUI({
          use_dca(theme = vars())
        })
      })

      observeEvent(input$`save-btn`, {
        saveRDS(vars(), "theme_config.rds")
        output[["save-progress"]] <- renderText("'theme_config.rds' is updated!")
      })
    }
  )
}
