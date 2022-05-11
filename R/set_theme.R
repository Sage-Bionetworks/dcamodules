#' Set theme
#'
#' @description Set theme of shiny dashboard
#' @param config The configuration of styling variables. It can be a rds file or list of variables.
#' @param theme The predefined theme.
#'
#' @export
#' @examples
#' \donttest{
#' # 1. use it in the dashboardBody()
#'  set_theme(theme = "default")
#'
#'  # 2. create your own custom variables
#'  custom_theme <- list(
#'   "primary" = "blue",
#'   "accent" = "red",
#'   "dark" = NULL,
#'   "light" = NULL,
#'   "success" = NULL,
#'   "info" = NULL,
#'   "warning" = NULL,
#'   "danger" = NULL,
#'   "white" = NULL,
#'   "black" = NULL,
#'   "font" = NULL,
#'   "link-font-cl" = NULL,
#'   "content-bg-cl" = NULL,
#'   "content-font-cl" = NULL,
#'   "header-font-cl" = NULL,
#'   "sidebar-bg-cl" = NULL,
#'   "sidebar-font-cl" = NULL,
#'   "sidebar-bg-select-cl" = NULL,
#'   "sidebar-font-select-cl" = NULL,
#'   "sidebar-bg-hover-cl" = NULL,
#'   "sidebar-font-hover-cl" = NULL,
#'   "footer-bg-cl" = NULL,
#'   "footer-font-cl" = NULL,
#'   "waiter-bg-cl" = NULL,
#'   "waiter-font-cl" = NULL
#' )
#' # save variables to rds
#' # saveRDS(custom_theme, "theme_config.rds")
#'
#' # set them by parsing the config rds
#' # set_theme(config = "theme_config.rds")
#' }
#'
set_theme <- function(config = NULL, theme = "default") {

  valid_themes <- c("default", "sage", "htan")
  match.arg(theme, valid_themes)

  # if pre-defined theme is used, custom is ignored
  if (!is.null(config) && theme == "default") {

    if (length(config) == 1 && is.character(config)) {
      match.arg(tolower(tools::file_ext(config)), "rds")
      custom_theme <- readRDS(config)
    } else {
      custom_theme <- config
    }

    # remove undefined variables
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
