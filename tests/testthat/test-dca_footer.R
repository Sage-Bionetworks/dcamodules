test_that("dcaFooter works", {
  footer <- dcaFooter("default footer", height = "200px")
  expect_identical(footer$attribs$class, "dca-footer-placeholder")
  expect_identical(footer$attribs$style, "height: 200px;")
  expect_identical(footer$children[[1]]$attribs$class, "dca-footer")
  expect_identical(footer$children[[1]]$attribs$style, "max-height: 200px;")
})
