test_that("shinyButton works", {
  btn <- shinyButton(
    "test-id", "test-button",
    style = "color: red;"
  )

  expect_identical(btn$attribs$id, "test-id")
  expect_identical(btn$attribs$class, "btn btn-default action-button dca-shiny-btn")
  expect_identical(btn$attribs$style, "color: red;")
})

test_that("arrowButton works", {
  btn <- arrowButton(
    "test-id",
    style = "color: red;"
  )
  expect_identical(btn$attribs$id, "test-id")
  expect_identical(
    purrr::map_chr(btn$children[[1]][[1]], ~ .x$attribs$class),
    rep("fa fa-angle-left", 3)
  )
  expect_identical(btn$attribs$class, "btn btn-default action-button dca-left-btn")
  expect_identical(btn$attribs$style, "color: red;")
})

test_that("mediaButton works", {
  btn <- mediaButton(
    "google",
    style = "color: red;"
  )

  expect_true(grepl("fa-google", btn$children[[1]]$attribs$class))
  expect_true(is.null(btn$attribs$link))
  expect_identical(btn$attribs$class, "dca-icon-btn")
  expect_identical(btn$attribs$style, "color: red;")
})
