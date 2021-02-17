ships_data_mock <- gen_mock_ships_data()
trip_mock <- gen_mock_trip()

test_that(
  "
  calc_longest_trip returns trip mock when
  ships data mock is input
  "
, {

  expect_equal(
    trip_mock,
    calc_longest_trip(
      ships_data_mock
    )
  )

})
