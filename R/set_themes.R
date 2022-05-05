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
set_themes <- function(primary, accent) {

  themes <- c(
    "royal", "powder","coral","blueberry",
    "rose","slate", "cloud","butterscotch",
    "turquoise","apricot", "apple","lavender",
    "fern", "stone"
  )
  match.arg(primary, themes)
  match.arg(accent, themes)

  themeCSS <- sass::sass(
    list(
      sass::sass_file(
        system.file(package = "dcamodules", "styling/scss/basic/_themes.scss")
        ),
      glue::glue("@include themes(${primary}, ${accent});")
    )
  )

  htmltools::tags$head(
    htmltools::tags$style(
      htmltools::HTML(
        text = themeCSS
      )
    )
  )
}
