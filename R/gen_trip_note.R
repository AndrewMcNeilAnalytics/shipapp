#' Generate text for the longest trip note
#'
#' @param .longest_trip (tbl_df) Tibble containing
#'   information about the trip
#'
#' @return (character) Longest trip note
gen_trip_note <- function(
  .longest_trip
) {

  assert_tibble(.longest_trip)

  ship_name <- .longest_trip %>%
    slice(1) %>%
    pull(ship_name)

  distance <- .longest_trip %>%
    slice(1) %>%
    pull(dist_m) %>%
    round()

  paste0(
    "The ship named ",
    ship_name,
    " traveled ",
    distance,
    " meters during this trip."
  )

}
