% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dca_waiters.R
\name{dca_waiter}
\alias{dca_waiter}
\title{DCA Waiter}
\usage{
dca_waiter(
  stage = c("show", "update", "hide"),
  id = NULL,
  user.name = "DCA User",
  is.landing = FALSE,
  is.stop = FALSE,
  sleep = 2,
  is.certified = TRUE,
  is.permission = TRUE,
  msg = NULL,
  spin = NULL,
  color = NULL
)
}
\arguments{
\item{stage}{Type of waiter, 'show' to initiate waiter screen, 'update' to update a waiter screen, or 'hide' to hide a waiter screen.}

\item{id}{Id of element to hide or element on which to show waiter over.}

\item{user.name}{Name of user.}

\item{is.landing}{Whether the waiter screen is used for landing process, including landing page, login failed pages, and welcome page.}

\item{is.stop}{Whether the waiter screen will be stopped after rendered.}

\item{sleep}{Time to keep the loading screen before hiding - recommend to give at least 2s to let users view the page.}

\item{is.certified}{Whether the user is synapse certified.}

\item{is.permission}{Whether the user have sufficient permission to the fileview.}

\item{msg}{Message displayed in the waiter screen.}

\item{spin}{Spinner displayed in the waiter screen.}

\item{color}{Background color of the waiter screen.}
}
\value{
show, update, or stop a waiter screen.
}
\description{
This is wrapper function on the top of \code{waiter} for data curator app.
}
\examples{
if (interactive()) {
  # check the waiter tab in the gallery
  dcamodules::showcase()
}
}
