#' Calculate the longest trip for a given ship
#'
#' @param .ships_data (tbl_df) Ships data
#'   containing data from a single ship
#'
#' @return (tbl_df) Tibble containing information
#'   about the longest trip
calc_longest_trip <- function(
  .ships_data
) {

  assert_tibble(.ships_data)

  rename(
    .ships_data,
    lat_end = lat,
    lon_end = lon
  ) %>%
  arrange(date_time) %>%
  mutate(
    lat_start = lag(lat_end),
    lon_start = lag(lon_end),
    dist_m = geodist::geodist(
      x = select(
        .,
        lon_end,
        lat_end
      ),
      sequential = TRUE,
      pad = TRUE,
      measure = "geodesic"
    )
  ) %>%
  slice_max(
    order_by = dist_m,
    with_ties = TRUE
  ) %>%
  slice_max(
    order_by = date_time,
    with_ties = FALSE
  ) %>%
  tidyr::pivot_longer(
    cols = c(
      lat_start,
      lon_start,
      lat_end,
      lon_end
    )
  ) %>%
  mutate(
    location =
      stringr::str_remove(
        string = name,
        pattern = "^[a-z]+_"
      ),
    coord =
      stringr::str_remove(
        string = name,
        pattern = "_[a-z]+$"
      )
  ) %>%
  select(-name) %>%
  tidyr::pivot_wider(
    names_from = coord
  ) %>%
  add_trip_middle() %>%
  relocate(
    lat,
    lon,
    ship_name,
    date_time,
    ship_type,
    dist_m,
    location
  )

}

#' Add row with location of middle of trip
#'
#' Used to add pirate ship in trip path
#'
#' @param .longest_trip (tbl_df) Tibble containing information
#'   about the longest trip
#'
#' @return (tbl_df) Longest trip data with a 3rd row added
add_trip_middle <- function(
  .longest_trip
) {

  middle_location <- .longest_trip %>%
    summarise(
      lat = mean(lat),
      lon = mean(lon)
    ) %>%
    tibble::add_column(
      location = "middle"
    )

  .longest_trip %>%
    bind_rows(middle_location)

}
