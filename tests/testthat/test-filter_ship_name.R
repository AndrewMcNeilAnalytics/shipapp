ships_data_mock <- tibble(
  lat = rep(1, 2),
  lon = rep(1, 2),
  ship_name = c("ship_1", "ship_2"),
  date_time = rep(
    as.POSIXct("2020-01-01 00:00:00", "UTC"),
    2
  ),
  ship_type = rep("type", 2)
)

test_that(
  "
  filter_ship_name throws if .ship_name is not of
  class character
  "
, {

  expect_error(
    filter_ship_name(
      .ships_data = ships_data_mock,
      .ship_name = 1
    )
  )

})

test_that(
  "
  filter_ship_name throws if .ship_name has
  length not equal to 1
  "
, {

  expect_error(
    filter_ship_name(
      .ships_data = ships_data_mock,
      .ship_name = c("name_1", "name_2")
    )
  )

})

test_that(
  "
  filter_ship_name return value passes assertion
  "
, {

  ships_data <- ships_data_mock %>%
    filter_ship_name(.ship_name = "name_1")

  expect_true(
    assert_ships_data(
      ships_data
    )
  )

})

test_that(
  "
  filter_ship_name return value has all values of
  'ship_name' column equal to .ship_name
  "
, {

  ship_name <- "name_1"

  ships_data <- ships_data_mock %>%
    filter_ship_name(.ship_name = ship_name)

  expect_true(
    all(ships_data$ship_name == ship_name)
  )

})
