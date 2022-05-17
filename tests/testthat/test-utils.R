test_that("get_tab_names works", {
  tab_object <- tabItems(
    tabItem(tabName = "tab1"),
    tabItem(tabName = "tab2"),
    tabItem(tabName = "tab3")
  )
  res <- get_tab_names(tab_object)
  expect_identical(res, c("tab1", "tab2", "tab3"))
})

test_that("var_to_server works", {
  ui <- var_to_server("values", 1:3)
  expect_true(grepl("dca-remove", ui$attribs$class))
  # TODO: add test on values in server
})

test_that("insert_attr_box works", {
  tag <- insert_attr_box(
    shinydashboard::box(),
    id = "test-id"
  )
  expect_identical(tag$children[[1]]$attribs$id, "test-id")
})

test_that("drop_empty with drop = 'all' works", {
  test_data <- c("real", "null", NULL, NA, "  ")
  res_all <- drop_empty(test_data)
  res_na <- drop_empty(test_data, drop = "na")
  res_null <- drop_empty(test_data, drop = "null")
  res_blank <- drop_empty(test_data, drop = "blank")
  expect_identical(res_all, "real")
  expect_identical(res_na, c("real", "null", "  "))
  expect_identical(res_null, c("real", NA, "  "))
  expect_identical(res_blank, c("real", "null", NA))
})
