
#
# $coral: (
#   200: #f7e2df,
#     300: #ffc5bd,
#     400: #fca79a,
#     500: #f47e6c,
#     600: #da614f,
#     700: #bd422f,
#     800: #8f1d0b,
# );
# $blueberry: (
#   200: #bce0f7,
#     300: #94c9eb,
#     400: #77afd4,
#     500: #5b95ba,
#     600: #407ba0,
#     700: #2b688f,
#     800: #164b6e,
# );
# $rose: (
#   200: #f7c6dd,
#     300: #f7a6cc,
#     400: #f683b9,
#     500: #e566a1,
#     600: #c94281,
#     700: #b22d6b,
#     800: #990e4f,
# );
# $slate: (
#   200: #abbee0,
#     300: #849bc4,
#     400: #6279a1,
#     500: #4a5e81,
#     600: #3c4a63,
#     700: #24334f,
#     800: #0d1c38,
# );
# $cloud: (
#   200: #f5f5f5,
#     300: #ededed,
#     400: #e3e1e1,
#     500: #dbd9d9,
#     600: #c7c5c5,
#     700: #a6a6a6,
#     800: #808080,
# );
# $butterscotch: (
#   200: #ffe2ad,
#     300: #fad591,
#     400: #fccb6f,
#     500: #f5b33c,
#     600: #de9a1f,
#     700: #cf8c15,
#     800: #bd7900,
# );
# $turquoise: (
#   200: #a9ebe5,
#     300: #63dbd0,
#     400: #42c7bb,
#     500: #24ab9f,
#     600: #109488,
#     700: #10847a,
#     800: #05635b,
# );
# $apricot: (
#   200: #facfaf,
#     300: #f5b584,
#     400: #f89c55,
#     500: #eb8231,
#     600: #d46d1e,
#     700: #c25d10,
#     800: #a84c05,
# );
# $apple: (
#   200: #ff9ca0,
#     300: #f27277,
#     400: #e0585d,
#     500: #cc3f45,
#     600: #b2242a,
#     700: #9c141a,
#     800: #85070c,
# );
# $lavender: (
#   200: #c7d6ff,
#     300: #b1c6fa,
#     400: #93abe8,
#     500: #7692d9,
#     600: #5171c0,
#     700: #3f5eab,
#     800: #28448a,
# );
# $fern: (
#   200: #c0ebc0,
#     300: #a7dba7,
#     400: #87c987,
#     500: #6db56d,
#     600: #58a158,
#     700: #3f833f,
#     800: #2c692c,
# );
# $stone: (
#   200: #e6e6e8,
#     300: #d3d5d8,
#     400: #bcc0ca,
#     500: #9da3b3,
#     600: #8d919e,
#     700: #6d7078,
#     800: #515359,


#' Title
#'
#' @param id
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
palettePanelUI <- function(id = NULL, ...) {

  ns <- NS(id)
  colors <- c("#d5cfe3", "#b2a5d1", "#907fba", "#5a478f",
              "#47337d", "#332069", "#251454", "#e1f4f5",
              "#c5edf0", "#a6dde0", "#7ec8cc", "#5bb0b5",
              "#2f8e94", "#0c656b")
  parts <- c("header", "sidebar", "content")
  value <- restoreInput(id = id, default = NULL)

  tags$div(
    # ns("dca-palette-panel"),
    class = "dca-palette-panel-container",
    lapply(parts, function(part) {
      tags$div(
        tagList(
          h4(part),
          lapply(colors, function(cl) {
            tags$button(
              id = ns(sprintf("%s-%s", part, cl)),
              type = "button",
              class = "btn btn-default action-button",
              `data-val` = value,
              shiny::icon(
                "circle",
                style = sprintf("color: %s;", cl)
              )
            )
          })
        )
      )
    }),
    ...
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
        parts <- c("header", "sidebar", "content")

        lapply(parts, function(part)  {
          var_name <- sprintf("%s-bg-cl", part)
          lapply(colors, function(cl) {
            name <- sprintf("%s-%s", part, cl)
            observeEvent(input[[name]], {
              var <- list(cl)
              names(var) <- var_name
              parent.output[[header.id]] <- renderUI({
                set_theme(var)
              })
            })
          })
        })
    }
  )
}
