trip <- gen_mock_trip()

test_that(
  "
  plot_trip return value is a leaflet object
  "
, {

  expect_class(
    plot_trip(trip),
    "leaflet"
  )

})
