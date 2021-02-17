#' Filter ships data by ship name
#'
#' @param .ships_data (tbl_df) Ships data
#' @param .ship_name (character) Ship name
#'
#' @return (tbl_df) Ships data filtered by ship name
filter_ship_name <- function(
  .ships_data,
  .ship_name
) {

  assert_tibble(.ships_data)
  assert_character(
    .ship_name,
    len = 1
  )

  filter(
    .ships_data,
    ship_name == .ship_name
  )

}
