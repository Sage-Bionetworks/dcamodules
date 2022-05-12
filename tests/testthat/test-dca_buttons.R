test_that("shinyButton works", {

  btn <- shinyButton(
    "test-id", "test-button",
    style = "color: red;"
  )

  expect_identical(btn[[1]]$attribs$id, "test-id")
  expect_identical(btn[[1]]$attribs$class, "btn btn-default action-button dca-shiny-btn")
  expect_identical(btn[[1]]$attribs$style, "color: red;")
  expect_identical(btn[[2]]$stylesheet, "main.min.css")
})

test_that("arrowButton works", {

  btn <- arrowButton(
    "test-id",
    style = "color: red;"
  )
  expect_identical(btn[[1]]$attribs$id, "test-id")
  expect_identical(purrr::map_chr(btn[[1]]$children[[1]][[1]], ~.x$attribs$class),
                   rep("fa fa-angle-left", 3))
  expect_identical(btn[[1]]$attribs$class, "btn btn-default action-button dca-left-btn")
  expect_identical(btn[[1]]$attribs$style, "color: red;")
  expect_identical(btn[[2]]$stylesheet, "main.min.css")
})

test_that("mediaButton works", {

  btn <- mediaButton(
    "google",
    style = "color: red;"
  )

  expect_true(grepl("fa-google", btn[[1]]$children[[1]]$attribs$class))
  expect_true(is.null(btn[[1]]$attribs$link))
  expect_identical(btn[[1]]$attribs$class, "dca-icon-btn")
  expect_identical(btn[[1]]$attribs$style, "color: red;")
  expect_identical(btn[[2]]$stylesheet, "main.min.css")
})

test_that("paletteButton works", {

  btn <- paletteButton(
    "test-id", "red",
    style = "color: red;"
  )
  expect_identical(btn[[1]]$attribs$id, "test-id")
  expect_identical(btn[[1]]$attribs$class, "action-button dca-palette-btn")
  expect_identical(btn[[1]]$children[[1]]$attribs$style, "color: red;")
  expect_identical(btn[[1]]$attribs$style, "color: red;")
  expect_identical(btn[[2]]$stylesheet, "main.min.css")
})
