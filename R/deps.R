#' Create UI dependencies
#' @noRd
#'
dca_deps <- function(type="default") {

  match.arg(type, c("default", "btn", "waiter", "box"))
  css <- dplyr::case_when(type == "btn" ~ "button.min.css",
                          type == "waiter" ~ "waiter.min.css",
                          type == "box" ~ "box.min.css",
                          TRUE ~ "main.min.css")
  # js <-
  htmltools::htmlDependency(
    name = shiny::NS("dcamodules", type),
    version = utils::packageVersion("dcamodules"),
    package = "dcamodules",
    src = "styling/css",
    stylesheet = css,
    all_files = FALSE
  )
}

#' Add UI dependencies
#'
#' @noRd
#'
add_deps <- function(tag, type="default") {
  match.arg(type, c("default", "btn", "waiter", "box"))
  shiny::tagList(tag, dca_deps(type))
}


#' haha
#'
#' @noRd
#'
update_css <- function(type="default") {
  stopifnot(interactive())

  match.arg(type, c("default", "btn", "waiter", "box"))
  scss_file <- dplyr::case_when(type == "btn" ~ "buttons/_load.scss",
                                type == "waiter" ~ "waiters/_load.scss",
                                type == "box" ~ "boxes/_load.scss",
                                TRUE ~ "main.scss")
  css_file <- dplyr::case_when(type == "btn" ~ "button.min.css",
                               type == "waiter" ~ "waiter.min.css",
                               type == "box" ~ "box.min.css",
                               TRUE ~ "main.min.css")

  sass::sass(
    sass::sass_file(file.path(system.file(package = "dcamodules", "styling/scss"), scss_file)),
    output = file.path(system.file(package = "dcamodules", "styling/css"), css_file),
    options = sass::sass_options(
      output_style = "compressed",
      source_map_embed = TRUE
    )
  )
}
