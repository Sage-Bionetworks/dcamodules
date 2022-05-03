#' Create UI dependencies
#'
#' @noRd
#'
dca_deps <- function() {
  htmltools::htmlDependency(
    name = "dcamodules",
    version = utils::packageVersion("dcamodules"),
    package = "dcamodules",
    src = "styling",
    stylesheet = "main.min.css"
  )
}

#' Add UI dependencies
#'
#' @noRd
#'
add_deps <- function(tag) {
  shiny::tagList(tag, dca_deps())
}


#' Converting scss files to update 'main.min.css'
#'
#' @param main.scss path to main.min.css
#'
#' @return path of main.min.css
#' @import sass
#' @export
#'
update_css <- function(main.scss=NULL) {
  stopifnot(interactive())
  if (is.null(main.scss)) {
    main.scss <- system.file(package = "dcamodules", "styling/scss/main.scss")
  }
  sass::sass(
    sass::sass_file(main.scss),
    output = system.file(package = "dcamodules", "styling/main.min.css"),
    options = sass::sass_options(
      output_style = "compressed",
      source_map_embed = TRUE
    )
  )
}

