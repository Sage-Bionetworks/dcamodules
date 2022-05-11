#' tagInsertAttribute
#'
#' @param .tag The tag object
#' @param pos After which position to insert attributes
#' @param ... List of tag attributes
#'
#' @export
#'
tagInsertAttribute <- function(.tag, ..., pos = 1) {
  if (pos == 0) {
    .tag <- tagAppendAttributes(.tag, ...)
  } else {
    .tag$children[[pos]] <- tagAppendAttributes(
      .tag$children[[pos]],
      ...
    )
  }
  return(.tag)
}


### utils
#' dropEmptys
#'
#' @param x List of input values
#' @param drop Which type of values to drop
#'
#' @export
#'
dropEmptys <- function(x, drop = "all") {
  match.arg(drop, c("all", "na", "null", "blank"))

  if (drop == "all") {
    res <- is.na(x) | sapply(x, is.null) | trimws(x, "both") == ""
  } else {
    if (drop == "na") res <- is.na(x)
    if (drop == "null") res <- sapply(x, is.null)
    if (drop == "blank") res <- trimws(x, "both") == ""
  }
  return(x[!res])
}