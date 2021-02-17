#' Assert raw ships data is as expected
#'
#' @param .ships_data (tbl_df) Ships data
#'
#' @return (logical | error) TRUE if passed, error otherwise
assert_ships_data_raw <- function(
  .ships_data
) {

  col_spec <- tribble(
    ~name, ~class,
    "LAT", "numeric",
    "LON", "numeric",
    "SHIPNAME", "character",
    "DATETIME", "character",
    "ship_type", "character"
  )

  # raw data has duplicate rows,
  # removed when cleaned

  .ships_data %>%
    assert_tbl_tibble() %>%
    assert_tbl_no_missing_values() %>%
    assert_tbl_col_names(
      .col_spec = col_spec
    ) %>%
    assert_tbl_col_classes(
      .col_spec = col_spec
    )

  TRUE

}
