test_that(
  "
  not_missing returns TRUE when no values are missing
  "
, {

  vec <- c(1, 2)

  lst <- list(1, "a")

  expect_true(
    not_missing(vec)
  )

  expect_true(
    not_missing(lst)
  )

})

test_that(
  "
  not_missing returns FALSE if values are missing
  "
, {

  vec <- c(1, NA)

  lst <- list(1, NA)

  expect_false(
    not_missing(vec)
  )

  expect_false(
    not_missing(lst)
  )

})

test_that(
  "
  assert_tbl_tibble throws if .tbl is not a tibble
  "
, {

  expect_error(
    assert_tbl_tibble(
      data.frame(a = 1)
    )
  )

})

test_that(
  "
  assert_tbl_tibble returns input if .tbl is a tibble
  "
, {

  tbl_input <- tibble(a = 1)

  expect_equal(
    tbl_input,
    assert_tbl_tibble(
      tbl_input
    )
  )

})

test_that(
  "
  assert_tbl_no_missing_values throws if tibble
  has missing values
  "
, {

  tbl_missing <- tibble(
    a = 1,
    b = NA
  )

  expect_error(
    assert_tibble_no_missing_values(
      tbl_missing
    )
  )

})

test_that(
  "
  assert_tbl_no_missing_values returns input if
  .tbl doesn't have missing values
  "
, {

  tbl_input <- tibble(
    a = 1,
    b = 1
  )

  expect_equal(
    tbl_input,
    assert_tbl_no_missing_values(
      tbl_input
    )
  )

})

test_that(
  "
  assert_tbl_no_duplicate_rows throws if tibble
  has duplicate rows
  "
, {

  tbl_duplicate <- tibble(
    a = c(1, 1),
    b = c(2, 2)
  )

  expect_error(
    assert_tbl_no_duplicate_rows(
      tbl_duplicate
    )
  )

})

test_that(
  "
  assert_tbl_no_duplicate_rows returns input if
  .tbl doesn't have duplicate rows
  "
, {

  tbl_input <- tibble(
    a = c(1, 1),
    b = c(2, 3)
  )

  expect_equal(
    tbl_input,
    assert_tbl_no_duplicate_rows(
      tbl_input
    )
  )

})

test_that(
  "
  assert_tbl_col_names throws if .tbl has
  incorrect column names
  "
, {

  tbl_incorrect_names <- tibble(
    a = 1,
    b = 1
  )

  col_spec <- tribble(
    ~name, ~class,
    "a", "numeric",
    "c", "numeric"
  )

  expect_error(
    assert_tbl_col_names(
      .tbl = tbl_incorrect_names,
      .col_spec = col_spec
    )
  )

})

test_that(
  "
  assert_tbl_col_names returns input if
  .tbl has correct column names
  "
, {

  tbl_input <- tibble(
    a = 1,
    b = 1
  )

  col_spec <- tribble(
    ~name, ~class,
    "a", "numeric",
    "b", "numeric"
  )

  expect_equal(
    tbl_input,
    assert_tbl_col_names(
      .tbl = tbl_input,
      .col_spec = col_spec
    )
  )

})

test_that(
  "
  assert_tbl_col_classes throws if .tbl has
  incorrect column classes
  "
, {

  tbl_incorrect_classes <- tibble(
    a = 1,
    b = 1
  )

  col_spec <- tribble(
    ~name, ~class,
    "a", "numeric",
    "b", "character"
  )

  expect_error(
    assert_tbl_col_classes(
      .tbl = tbl_incorrect_classes,
      .col_spec = col_spec
    )
  )

})

test_that(
  "
  assert_tbl_col_names returns input if
  .tbl has correct column classes
  "
, {

  tbl_input <- tibble(
    a = 1,
    b = 1
  )

  col_spec <- tribble(
    ~name, ~class,
    "a", "numeric",
    "b", "numeric"
  )

  expect_equal(
    tbl_input,
    assert_tbl_col_classes(
      .tbl = tbl_input,
      .col_spec = col_spec
    )
  )

})
