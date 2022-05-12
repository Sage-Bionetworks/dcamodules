test_that("use_dca_waiter works", {
  deps <- use_dca_waiter()
  expect_length(deps, 2)
  expect_identical(deps[[2]]$stylesheet, "main.min.css")
})


library(shiny)
library(shinydashboard)
library(dcamodules)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody(
    use_dca_waiter(),
    # landing
    dca_waiter("show", is.landing = TRUE)
  )
)

server <- function(input, output, session) {
  observe(input$waiter, {
    t <- 0
    # not certified
    dca_waiter("update", is.landing = TRUE, is.certified = FALSE, sleep = t)
    # not enought permission
    dca_waiter("update", is.landing = TRUE, is.permission = FALSE, sleep = t)
    # success login
    dca_waiter("update", is.landing = TRUE, sleep = t)
    # simple waiter screens
    dca_waiter("show", sleep = t)
    dca_waiter("update", sleep = t, is.stop = TRUE)
    dca_waiter("hide", sleep = t)
  })
}

test_that("waiter works", {
  testServer(server, {
    # Give input$x a value.
    session$setInputs(waiter = 1)
  })

  expect_warning(
    dca_waiter("show", is.landing = TRUE, is.stop = TRUE),
    "'is.stop' is not used when 'is.landing' is TRUE"
  )
})

test_that("waiter warning works", {
  expect_warning(
    dca_waiter("show", is.landing = TRUE, is.stop = TRUE),
    "'is.stop' is not used when 'is.landing' is TRUE"
  )
})

test_that("spin_logo works", {
  svg_spinner <- spin_logo("synapse")
  png_spinner <- spin_logo("htan")
  expect_identical(class(svg_spinner[[1]]) == "shiny.tag")
  expect_identical(class(png_spinner[[1]]) == "shiny.tag")
  expect_identical(svg_spinner[[1]]$attribs$class, "dca-logo-spin")
  expect_identical(png_spinner[[1]]$attribs$class, "dca-logo-spin")
})
