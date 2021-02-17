#' Filter ships data by ship type
#'
#' @param .ships_data (tbl_df) Ships data
#' @param .ship_type (character) Ship type
#'
#' @return (tbl_df) Ships data filtered by ship type
filter_ship_type <- function(
  .ships_data,
  .ship_type
) {

  assert_tibble(.ships_data)
  assert_character(
    .ship_type,
    len = 1
  )

  filter(
    .ships_data,
    ship_type == .ship_type
  )

}
