gen_mock_ships_data_raw <- function() {

  tibble(
    LAT = rep(1, 2),
    LON = rep(1, 2),
    SHIPNAME = rep("ship", 2),
    DATETIME = c(
      "2020-01-01 00:00:00Z",
      "2020-01-02 00:00:00Z"
    ),
    ship_type = rep("type", 2)
  )

}

gen_mock_ships_data <- function() {

  tibble(
    lat = rep(1, 2),
    lon = rep(1, 2),
    ship_name = rep("ship", 2),
    date_time = c(
      as.POSIXct("2020-01-01 00:00:00", "UTC"),
      as.POSIXct("2020-01-02 00:00:00", "UTC")
    ),
    ship_type = rep("type", 2)
  )

}

gen_mock_trip <- function() {

  tibble(
    lat = rep(1, 3),
    lon = rep(1, 3),
    ship_name = c("ship", "ship", NA),
    date_time = c(
      as.POSIXct("2020-01-02 00:00:00", "UTC"),
      as.POSIXct("2020-01-02 00:00:00", "UTC"),
      NA
    ),
    ship_type = c("type", "type", NA),
    dist_m = c(0, 0, NA),
    location = c("start", "end", "middle")
  )

}
