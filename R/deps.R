#' Create UI dependencies
#' @noRd
#'
get_dca_deps <- function() {

  # match.arg(type, c("default", "btn", "waiter", "box"))
  # css <- dplyr::case_when(type == "btn" ~ "button.min.css",
  #                         type == "waiter" ~ "waiter.min.css",
  #                         type == "box" ~ "box.min.css",
  #                         TRUE ~ "main.min.css")
  # js <-
  htmltools::htmlDependency(
    name = "dcamodules",
    version = utils::packageVersion("dcamodules"),
    package = "dcamodules",
    src = "styling/css",
    stylesheet = "main.min.css",
    all_files = FALSE
  )
}

#' Add UI dependencies
#'
#' @noRd
#'
add_deps <- function(tag) {
  shiny::tagList(tag, get_dca_deps())
}


#' haha
#'
#' @export
#' @noRd
#'
update_css <- function() {
  stopifnot(interactive())

  # match.arg(type, c("default", "btn", "waiter", "box"))
  # scss_file <- dplyr::case_when(type == "btn" ~ "buttons/_load.scss",
  #                               type == "waiter" ~ "waiters/_load.scss",
  #                               type == "box" ~ "boxes/_load.scss",
  #                               TRUE ~ "main.scss")
  # css_file <- dplyr::case_when(type == "btn" ~ "button.min.css",
  #                              type == "waiter" ~ "waiter.min.css",
  #                              type == "box" ~ "box.min.css",
  #                              TRUE ~ "main.min.css")

  scss_file <- "main.scss"
  css_file <- "main.min.css"
  sass::sass(
    sass::sass_file(file.path(system.file(package = "dcamodules", "styling/scss"), scss_file)),
    output = file.path(system.file(package = "dcamodules", "styling/css"), css_file),
    options = sass::sass_options(
      output_style = "compressed",
      source_map_embed = TRUE
    )
  )
}
