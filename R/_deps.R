#' #' Create UI dependencies
#' #'
#' #' @noRd
#' #' @importFrom htmltools htmlDependency
#' #' @importFrom utils packageVersion
#' dca_deps <- function() {
#'   htmltools::htmlDependency(
#'     name = "dcamodules",
#'     version = utils::packageVersion("dcamodules"),
#'     package = "dcamodules",
#'     src = "styling/css",
#'     stylesheet = "main.min.css",
#'     all_files = FALSE
#'   )
#' }
#'
#' #' Add UI dependencies
#' #'
#' #' @noRd
#' add_deps <- function(tag) {
#'   tagList(tag, dca_deps())
#' }
#'
#'
#' #' Update css files
#' #'
#' #' @examples \dontrun{
#' #' update_css()
#' #' }
#' #' @keywords internal
#' #' @rdname update_css
#' #' @export
#' #' @importFrom sass sass sass_file sass_options
#' update_css <- function() {
#'   stopifnot(interactive())
#'   scss_file <- "main.scss"
#'   css_file <- "main.min.css"
#'   sass::sass(
#'     sass::sass_file(file.path(system.file(package = "dcamodules", "styling/scss"), scss_file)),
#'     output = file.path(system.file(package = "dcamodules", "styling/css"), css_file),
#'     options = sass::sass_options(
#'       output_style = "compressed",
#'       source_map_embed = TRUE
#'     )
#'   )
#' }
