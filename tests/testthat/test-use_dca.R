# update the snapshot by running testthat::snapshot_accept()
test_that("use_dca can read variables ", {
  var <- list("header-bg-cl" = "red")
  res_var <- use_dca(theme = var)
  expect_snapshot(res_var[[1]]$children)
})

test_that("use_dca can use predefined theme", {
  res_theme <- use_dca(theme = "sage")
  expect_snapshot(res_theme[[1]]$children)
})

test_that("use_dca can read rds file", {
  res_rds <- use_dca(theme = "test-data/test_use_dca.rds")
  expect_snapshot(res_rds[[1]]$children)
})
