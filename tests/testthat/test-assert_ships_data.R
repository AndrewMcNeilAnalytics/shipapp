ships_data_mock <- gen_mock_ships_data()

test_that(
  "
  assert_ships_data throws if .ships_data
  isn't a tibble
  "
, {

  ships_data_df <- as.data.frame(
    ships_data_mock
  )

  expect_error(
    assert_ships_data(
      ships_data_df
    )
  )

})

test_that(
  "
  assert_ships_data throws if .ships_data
  has missing values
  "
, {

  ships_data_missing <- ships_data_mock %>%
    mutate(ship_type = NA)

  expect_error(
    assert_ships_data(
      ships_data_missing
    )
  )

})

test_that(
  "
  assert_ships_data throws if .ships_data
  has duplicate rows
  "
, {

  ships_data_duplicates <- ships_data_mock %>%
    bind_rows(ships_data_mock)

  expect_error(
    assert_ships_data(
      ships_data_duplicates
    )
  )

})

test_that(
  "
  assert_ships_data throws if .ships_data
  has incorrect column names
  "
, {

  ships_data_incorrect_names <- ships_data_mock %>%
    rename(shiptype = ship_type)

  expect_error(
    assert_ships_data(
      ships_data_incorrect_names
    )
  )

})

test_that(
  "
  assert_ships_data throws if .ships_data
  has incorrect column classes
  "
, {

  ships_data_incorrect_classes <- ships_data_mock %>%
    mutate(lat = as.character(lat))

  expect_error(
    assert_ships_data(
      ships_data_incorrect_classes
    )
  )

})

test_that(
  "
  assert_ships_data returns TRUE with
  correctly formatted input data
  "
, {

  expect_true(
    assert_ships_data(
      ships_data_mock
    )
  )

})
