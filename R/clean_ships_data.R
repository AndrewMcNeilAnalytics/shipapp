#' Clean ships data
#'
#' @param .ships_data (tbl_df) Ships data
#'
#' @return (tbl_df) Cleaned ships data
clean_ships_data <- function(
  .ships_data
) {

  assert_ships_data_raw(.ships_data)

  .ships_data %>%
    clean_rename_cols() %>%
    clean_remove_duplicate_rows() %>%
    clean_mutate_date_time_to_posixct()

}

#' Rename columns of ships data
#'
#' @param .ships_data (tbl_df) Ships data
#'
#' @return (tbl_df) Ships data with renamed columns
clean_rename_cols <- function(
  .ships_data
) {

  rename(
    .ships_data,
    lat = LAT,
    lon = LON,
    date_time = DATETIME,
    ship_name = SHIPNAME
  )

}

#' Remove duplicate rows
#'
#' @param .ships_data (tbl_df) Ships data
#'
#' @return (tbl_df) Ships data without duplicate rows
clean_remove_duplicate_rows <- function(
  .ships_data
) {

  distinct(.ships_data)

}

#' Convert date_time column from character to POSIXct
#'
#' @param .ships_data (tbl_df) Ships data
#'
#' @return (tbl_df) Ships data with POSIXct date_time
clean_mutate_date_time_to_posixct <- function(
  .ships_data
) {

  mutate(
    .ships_data,
    date_time = fasttime::fastPOSIXct(
      date_time,
      tz = "UTC"
    )
  )

}
