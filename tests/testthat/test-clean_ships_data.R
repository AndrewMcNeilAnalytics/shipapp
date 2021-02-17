ships_data_raw_mock <- gen_mock_ships_data_raw()

ships_data_clean_mock <- gen_mock_ships_data()

test_that(
  "
  clean_rename_cols renames columns to correct names
  "
, {

  ships_data_renamed <- ships_data_raw_mock %>%
    clean_rename_cols()

  expect_equal(
    colnames(ships_data_clean_mock),
    colnames(ships_data_renamed)
  )

})

test_that(
  "
  clean_remove_duplicate_rows removes duplicate rows
  "
, {

  ships_data_duplicates <- ships_data_raw_mock %>%
    bind_rows(ships_data_raw_mock)

  ships_data_removed_duplicates <-
    ships_data_duplicates %>%
    clean_remove_duplicate_rows()

  expect_equal(
    ships_data_raw_mock,
    ships_data_removed_duplicates
  )

})

test_that(
  "
  clean_mutate_date_time_to_posixct converts date_time
  column to class POSIXct with UTC timezone
  "
, {

  ships_data_cleaned <- ships_data_raw_mock %>%
    rename(date_time = DATETIME) %>%
    clean_mutate_date_time_to_posixct()

  expect_posixct(
    ships_data_cleaned$date_time
  )

  expect_true(
    lubridate::tz(
      ships_data_cleaned$date_time
    ) == "UTC"
  )

})

test_that(
  "
  clean_ships_data return value is equal
  to mock cleaned data
  "
, {

  ships_data_cleaned <- ships_data_raw_mock %>%
    clean_ships_data()

  expect_equal(
    ships_data_clean_mock,
    ships_data_cleaned
  )

})

test_that(
  "
  clean_ships_data return value passes
  ships data assertion
  "
, {

  ships_data_cleaned <- ships_data_raw_mock %>%
    clean_ships_data()

  expect_true(
    assert_ships_data(
      ships_data_cleaned
    )
  )

})
