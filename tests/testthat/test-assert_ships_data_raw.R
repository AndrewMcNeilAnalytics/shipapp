ships_data_mock <- gen_mock_ships_data_raw()

test_that(
  "
  assert_ships_data_raw throws if .ships_data
  isn't a tibble
  "
, {

  ships_data_df <- as.data.frame(
    ships_data_mock
  )

  expect_error(
    assert_ships_data_raw(
      ships_data_df
    )
  )

})

test_that(
  "
  assert_ships_data_raw throws if .ships_data
  has missing values
  "
, {

  ships_data_missing <- ships_data_mock %>%
    mutate(ship_type = NA)

  expect_error(
    assert_ships_data_raw(
      ships_data_missing
    )
  )

})

test_that(
  "
  assert_ships_data_raw throws if .ships_data
  has incorrect column names
  "
, {

  ships_data_incorrect_names <- ships_data_mock %>%
    rename(shiptype = ship_type)

  expect_error(
    assert_ships_data_raw(
      ships_data_incorrect_names
    )
  )

})

test_that(
  "
  assert_ships_data_raw throws if .ships_data
  has incorrect column classes
  "
, {

  ships_data_incorrect_classes <- ships_data_mock %>%
    mutate(LAT = as.character(LAT))

  expect_error(
    assert_ships_data_raw(
      ships_data_incorrect_classes
    )
  )

})

test_that(
  "
  assert_ships_data_raw returns TRUE with
  correctly formatted input data
  "
, {

  expect_true(
    assert_ships_data_raw(
      ships_data_mock
    )
  )

})
