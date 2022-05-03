#' Title
#'
#' @param stage
#' @param id
#' @param userName
#' @param is.landing
#' @param is.stop
#' @param isCertified
#' @param isPermission
#' @param sleep recommend to give at least 2s to let users view the page before updating
#' initial screen will not use _sleep
#' @param msg
#' @param spin
#'
#' @return
#' @import shiny waiter
#' @export
#' @examples
dcWaiter <- function(stage = c("show", "update", "hide"),
                     id = NULL, user.name = "DCA User",
                     is.landing = FALSE, is.stop = FALSE, sleep = 2,
                     is.certified = TRUE, is.permission = TRUE,
                     msg = NULL, spin = NULL, color = NULL) {
  # validate arguments
  stopifnot(is.logical(is.landing))
  stopifnot(is.logical(is.stop))
  stopifnot(is.logical(is.certified))
  stopifnot(is.logical(is.permission))
  stopifnot(sleep >= 0)
  match.arg(stage, c("show", "update", "hide"))

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

    addResourcePath("assets", system.file("assets", package="dcamodules"))
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
