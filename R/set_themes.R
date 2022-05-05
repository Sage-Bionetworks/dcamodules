# sass_layer(
#   functions = sass(sass_file("~/Projects/Web/dcamodules/inst/styling/basic/_themes.scss")), html_deps = htmltools::htmlDependency(
#   name = "dcamodules",
#   version = utils::packageVersion("dcamodules"),
#   package = "dcamodules",
#   src = "styling"
# ))
# registerThemeDependency()
# session$setCurrentTheme()

#' set_themes
#'
#' @description set_themes
#' @param primary
#' @param accent
#'
#' @export
#'
set_themes <- function(theme) {

  # themes <- c(
  #   "royal", "powder","coral","blueberry",
  #   "rose","slate", "cloud","butterscotch",
  #   "turquoise","apricot", "apple","lavender",
  #   "fern", "stone"
  # )
  themes <- c("sage")
  match.arg(theme, themes)

  themeCSS <- sass::sass(
    list(
      sass::sass_file(
        system.file(package = "dcamodules", "styling/scss/themes/_load.scss")
      ),
      glue::glue("@include dca-set-theme({theme});")
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
