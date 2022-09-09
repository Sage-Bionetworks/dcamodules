#' Use DCA Modules
#'
#' @description Initiate dca modules dependencies
#' @param theme The theme of app. A list variables, e.g. \code{list('header-bg-cl' = 'red')},
#'     a config file (.rds) or a prefined theme ("sage") is accepted.
#'     Default is the "default" theme.
#' @examples
#' if (interactive()) {
#'   library(shinydashboard)
#'   library(dcamodules)
#'   # 1. use it in the dashboardBody()
#'   dashboardBody(
#'     use_dca(theme = "sage")
#'   )
#'
#'   # 2. create your own custom variables
#'   custom_theme <- list(
#'     "primary" = "blue",
#'     "accent" = "red",
#'     "dark" = NULL,
#'     "light" = NULL,
#'     "success" = NULL,
#'     "info" = NULL,
#'     "warning" = NULL,
#'     "danger" = NULL,
#'     "white" = NULL,
#'     "black" = NULL,
#'     "font" = NULL,
#'     "link-font-cl" = NULL,
#'     "content-bg-cl" = NULL,
#'     "content-font-cl" = NULL,
#'     "header-bg-cl" = NULL,
#'     "header-font-cl" = NULL,
#'     "sidebar-bg-cl" = NULL,
#'     "sidebar-font-cl" = NULL,
#'     "sidebar-bg-select-cl" = NULL,
#'     "sidebar-font-select-cl" = NULL,
#'     "sidebar-bg-hover-cl" = NULL,
#'     "sidebar-font-hover-cl" = NULL,
#'     "footer-bg-cl" = NULL,
#'     "footer-font-cl" = NULL,
#'     "waiter-bg-cl" = NULL,
#'     "waiter-font-cl" = NULL
#'   )
#'   # save variables to rds
#'   saveRDS(custom_theme, "theme_config.rds")
#'
#'   # set them by parsing the config rds
#'   dashboardBody(
#'     use_dca(theme = "theme_config.rds")
#'   )
#' }
#' @rdname use_dca
#' @export
#' @importFrom sass sass sass_file sass_layer
#' @importFrom tools file_ext
#' @importFrom htmlwidgets JS
#' @importFrom waiter use_waiter
use_dca <- function(theme = "default") {
  var_opt <- c(
    "primary", "accent", "dark", "light",
    "success", "info", "warning", "danger",
    "white", "black", "font", "link-font-cl",
    "content-bg-cl", "content-font-cl",
    "header-bg-cl", "header-font-cl",
    "sidebar-bg-cl", "sidebar-font-cl",
    "sidebar-bg-select-cl", "sidebar-font-select-cl",
    "sidebar-bg-hover-cl", "sidebar-font-hover-cl",
    "footer-bg-cl", "footer-font-cl",
    "waiter-bg-cl", "waiter-font-cl"
  )
  variables <- NULL
  rules <- NULL

  # validation
  # if custom theme provided, change theme to default for now
  if (is.list(theme)) {
    stopifnot(all(names(theme) %in% var_opt))
    variables <- drop_empty(theme)
    theme <- "default"
  } else if (grepl("rds", tools::file_ext(theme))) {
    stopifnot(file.exists(theme))
    custom_theme <- readRDS(theme)
    variables <- drop_empty(custom_theme)
    theme <- "default"
  } else {
    match.arg(theme, c("default", "sage", "htan"))
  }

  rules <- ifelse(
    theme == "default",
    "@include set-theme()",
    sprintf(
      "@include get-colors-from-theme(%s);
      @include set-theme();", theme
    )
  )

  themeCSS <- sass::sass(
    sass::sass_layer(
      functions = sass::sass_file(
        system.file(package = "dcamodules", "styling/scss/main.scss")
      ),
      defaults = variables,
      rules = rules
    )
  )

  list(
    tags$head(
      tags$style(themeCSS),
      tags$script(htmlwidgets::JS(
        "
        setTimeout(function() {
          history.pushState({}, 'Data Curator', window.location.pathname);
        }, 2000);
        "
      ))
    ),
    waiter::use_waiter()
  )
}