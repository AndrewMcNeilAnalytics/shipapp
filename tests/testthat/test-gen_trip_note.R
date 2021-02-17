test_that(
  "
  gen_trip_note generates note correctly
  "
, {

  trip_mock <- gen_mock_trip()

  trip_note <- gen_trip_note(
    .longest_trip = trip_mock
  )

  expected_note <- paste0(
    "The ship named ship traveled ",
    "0 meters during this trip."
  )

  expect_equal(
    trip_note,
    expected_note
  )

})
