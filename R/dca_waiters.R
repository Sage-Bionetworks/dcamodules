#' Title
#'
#' @return
#' @export
#'
#' @examples
use_dcaWaiter <- function() {
  list(waiter::use_waiter(), dca_deps("waiter"))
}


#' DCA Waiter
#'
#' @description This is wrapper function on the top of \code{waiter} for data curator app
#' @param stage type of waiter, 'show' to initiate waiter screen, 'update' to update a waiter screen, or 'hide' to hide a waiter screen
#' @param id Id of element to hide or element on which to show waiter over
#' @param is.landing whether the waiter screen is used for landing process, including landing page, login failed pages, and welcome page
#' @param isCertified whether the user is synapse certified
#' @param isPermission whether the user have sufficient permission to the fileview
#' @param user.name name of user
#' @param is.stop whether the waiter screen will be stopped after rendered
#' @param sleep time to keep the loading screen before hiding - recommend to give at least 2s to let users view the page
#' @param msg message displayed in the waiter screen
#' @param spin spinner displayed in the waiter screen
#' @param color background color of the waiter screen
#'
#' @return show, update, or stop a waiter screen
#' @import shiny waiter
#' @export
dcaWaiter <- function(stage = c("show", "update", "hide"),
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
  if (is.null(spin)) spin <- spin_plus()
  if (is.null(color)) bg_cl <- "#424874" # TODO: add waiter to theme

  # if "hide", proceed hiding process immediately and exit function
  if (stage == "hide") {
    Sys.sleep(sleep)
    return(waiter_hide(id))
  }

  ## predefined loading screens for dca
  if (is.landing) {

    img_path <- "assets/loading.gif"

    if (stage == "show") {
      # initial loading screen
      # `waiter_show_on_load` only work in UI
      waiter_show_on_load(
        tagList(
          img(src = img_path),
          h3("Retrieving Synapse information...")
        ),
        color = bg_cl
      )
    } else if (!is.certified) {
      # not certified synapse user
      Sys.sleep(sleep)
      waiter_update(
        id,
        tagList(
          img(src = img_path),
          h3("Looks like you're not a synapse certified user!"),
          span("Please follow the ",
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
      waiter_update(
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
      waiter_update(
        id,
        tagList(
          img(src = img_path),
          h3(sprintf("Welcome, %s!", user.name))
        )
      )
      Sys.sleep(sleep)
      waiter_hide(id)
    }
  } else {
    ## custom loading screens
    if (stage == "show") {
      waiter_show(
        id,
        tagList(spin, br(), h3(msg)),
        color = bg_cl
      )
    } else {
      Sys.sleep(sleep)
      waiter_update(
        id,
        tagList(spin, br(), h3(msg))
      )
      if (is.stop) {
        Sys.sleep(sleep)
        waiter_hide(id)
      }
    }
  }
}


#' Synapse Logo Spinner
#'
#' @description Synapse logo spinner to use with waiter
#' @param logo name of logo
#' @return
#' @export
#'
spin_logo <- function(logo = "synapse") {

  all_logos <- list.files(system.file(package = "dcamodules", "assets/logos"))
  all_orgs <- tools::file_path_sans_ext(all_logos)

  match.arg(logo, all_orgs)

  logo_path <- file.path("assets/logos", all_logos[match(logo, all_orgs)])

  # only accept png and svg now, add more as needed
  if (tools::file_ext(basename(logo_path)) == "svg") {
    img_type <- "svg+xml"
  } else {
    img_type <- "png"
  }

  b64 <- base64enc::dataURI(file = system.file(logo_path, package="dcamodules"),
                            mime = paste0("image/", img_type))
  spinner <- img(src = b64, class = "logo-spin")
  add_deps(spinner, "waiter")
}
