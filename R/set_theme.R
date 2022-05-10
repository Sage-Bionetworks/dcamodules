#' set_theme
#'
#' @description set_theme
#' @param file
#' @param theme
#'
#' @export
#'
set_theme <- function(config = NULL, theme = "default") {

  valid_themes <- c("default", "sage", "htan")
  valid_exts <- c("r", "R")
  match.arg(theme, valid_themes)

  # if pre-defined theme is used, custom is ignored
  if (!is.null(config) && theme == "default") {

    if (length(config) == 1 && is.character(config)) {
      match.arg(tools::file_ext(config), valid_exts)
      custom_theme <- source(config)$value
    } else {
      custom_theme <- config
    }
    variables <- dropEmptys(custom_theme)
  } else {
    variables <- NULL
  }

  themeCSS <- sass::sass(
    sass::sass_layer(
      functions = sass::sass_file(
        system.file(package = "dcamodules", "styling/scss/set_theme.scss")
      ),
      defaults = variables,
      rules = sprintf("@include get-colors-from-theme(%s);
                       @include set-theme();", theme)
      )
    )

  tags$head(
    tags$style(
      HTML(
        text = themeCSS
      )
    )
  )
}
