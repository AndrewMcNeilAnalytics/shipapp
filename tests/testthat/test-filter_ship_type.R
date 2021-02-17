ships_data_mock <- tibble(
  lat = rep(1, 2),
  lon = rep(1, 2),
  ship_name = rep("ship", 2),
  date_time = rep(
    as.POSIXct("2020-01-01 00:00:00", "UTC"),
    2
  ),
  ship_type = c("type_1", "type_2")
)

test_that(
  "
  filter_ship_type throws if .ship_type is not of
  class character
  "
, {

  expect_error(
    filter_ship_type(
      .ships_data = ships_data_mock,
      .ship_type = 1
    )
  )

})

test_that(
  "
  filter_ship_type throws if .ship_type has
  length not equal to 1
  "
, {

  expect_error(
    filter_ship_type(
      .ships_data = ships_data_mock,
      .ship_type = c("type_1", "type_2")
    )
  )

})

test_that(
  "
  filter_ship_type return value passes assertion
  "
, {

  ships_data <- ships_data_mock %>%
    filter_ship_type(.ship_type = "type_1")

  expect_true(
    assert_ships_data(
      ships_data
    )
  )

})

test_that(
  "
  filter_ship_type return value has all values of
  'ship_type' column equal to .ship_type
  "
, {

  ship_type <- "type_1"

  ships_data <- ships_data_mock %>%
    filter_ship_type(.ship_type = ship_type)

  expect_true(
    all(ships_data$ship_type == ship_type)
  )

})
