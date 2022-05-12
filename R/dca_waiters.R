#' Config waiter
#' @description Use to config dependencies of dca waiter
#' @examples
#' if (interactive()) {
#'   library(shinydashboard)
#'   library(dcamodules)
#'   dashboardBody(
#'     use_dca_waiter()
#'   )
#' }
#' @rdname use_dca_waiter
#' @export
use_dca_waiter <- function() {
  list(waiter::use_waiter(), dca_deps())
}


#' DCA Waiter
#'
#' @description This is wrapper function on the top of \code{waiter} for data curator app.
#' @param stage Type of waiter, 'show' to initiate waiter screen, 'update' to update a waiter screen, or 'hide' to hide a waiter screen.
#' @param id Id of element to hide or element on which to show waiter over.
#' @param is.landing Whether the waiter screen is used for landing process, including landing page, login failed pages, and welcome page.
#' @param is.certified Whether the user is synapse certified.
#' @param is.permission Whether the user have sufficient permission to the fileview.
#' @param user.name Name of user.
#' @param is.stop Whether the waiter screen will be stopped after rendered.
#' @param sleep Time to keep the loading screen before hiding - recommend to give at least 2s to let users view the page.
#' @param msg Message displayed in the waiter screen.
#' @param spin Spinner displayed in the waiter screen.
#' @param color Background color of the waiter screen.
#' @examples
#' if (interactive()) {
#'   # check the waiter tab in the gallery
#'   dcamodules::showcase()
#' }
#' @return show, update, or stop a waiter screen.
#' @rdname dca_waiter
#' @export
dca_waiter <- function(stage = c("show", "update", "hide"),
                       id = NULL, user.name = "DCA User",
                       is.landing = FALSE, is.stop = FALSE, sleep = 2,
                       is.certified = TRUE, is.permission = TRUE,
                       msg = NULL, spin = NULL, color = NULL) {

  # validate arguments
  match.arg(stage, c("show", "update", "hide"))
  stopifnot(is.logical(is.landing))
  stopifnot(is.logical(is.stop))
  stopifnot(is.logical(is.certified))
  stopifnot(is.logical(is.permission))
  stopifnot(sleep >= 0)
  if (is.landing && is.stop) warning("'is.stop' is not used when 'is.landing' is TRUE")

  # default values
  if (is.null(msg)) msg <- "Loading ..."
  if (is.null(spin)) spin <- waiter::spin_plus()
  if (is.null(color)) bg_cl <- "#424874" # TODO: add waiter to theme

  # if "hide", proceed hiding process immediately and exit function
  if (stage == "hide") {
    Sys.sleep(sleep)
    return(waiter::waiter_hide(id))
  }

  # predefined loading screens for dca
  if (is.landing) {
    img_path <- "assets/loading_sage_logo.gif"

    if (stage == "show") {
      # initial loading screen
      # `waiter_show_on_load` only work in UI
      waiter::waiter_show_on_load(
        tagList(
          img(src = img_path),
          h3("Retrieving Synapse information...")
        ),
        color = bg_cl
      )
    } else if (!is.certified) {
      # not certified synapse user
      Sys.sleep(sleep)
      waiter::waiter_update(
        id,
        tagList(
          img(src = img_path),
          h3("Looks like you're not a synapse certified user!"),
          span(
            "Please follow the ",
            a("instruction",
              href = "https://help.synapse.org/docs/User-Account-Tiers.2007072795.html#UserAccountTiers-CertifiedUsers",
              target = "_blank"
            ),
            " to become a certified user, then refresh this page."
          )
        )
      )
    } else if (!is.permission) {
      # not have right permission
      Sys.sleep(sleep)
      waiter::waiter_update(
        id,
        tagList(
          img(src = img_path),
          h3("Fileview Access Denied!"),
          span("You may not have sufficient permissions for curation.
           Please contact your team and project administrators.")
        )
      )
    } else {
      # success loading page - user.name needed to provide
      Sys.sleep(sleep)
      waiter::waiter_update(
        id,
        tagList(
          img(src = img_path),
          h3(sprintf("Welcome, %s!", user.name))
        )
      )
      Sys.sleep(sleep)
      waiter::waiter_hide(id)
    }
  } else {
    # custom loading screens
    if (stage == "show") {
      waiter::waiter_show(
        id,
        tagList(spin, br(), h3(msg)),
        color = bg_cl
      )
    } else {
      Sys.sleep(sleep)
      waiter::waiter_update(
        id,
        tagList(spin, br(), h3(msg))
      )
      if (is.stop) {
        Sys.sleep(sleep)
        waiter::waiter_hide(id)
      }
    }
  }
}


#' Synapse Logo Spinner
#'
#' @description Synapse logo spinner to use with waiter
#' @param logo Name of logo. Default to 'synapse'.
#' @rdname spin_logo
#' @export
spin_logo <- function(logo = "synapse") {
  all_logos <- list.files(system.file(package = "dcamodules", "assets/logos"))
  all_orgs <- tools::file_path_sans_ext(all_logos)

  match.arg(logo, all_orgs)

  logo_path <- file.path("assets/logos", all_logos[match(logo, all_orgs)])

  # only accept png and svg now, add more as needed
  if (tools::file_ext(logo_path) == "svg") {
    img_type <- "svg+xml"
  } else {
    img_type <- "png"
  }

  b64 <- base64enc::dataURI(
    file = system.file(logo_path, package = "dcamodules"),
    mime = paste0("image/", img_type)
  )
  spinner <- img(src = b64, class = "dca-logo-spin")
  add_deps(spinner)
}
