#' Assert cleaned ships data is as expected
#'
#' @param .ships_data (tbl_df) Ships data
#'
#' @return (logical | error) TRUE if passed, error otherwise
assert_ships_data <- function(
  .ships_data
) {

  col_spec <- tribble(
    ~name, ~class,
    "lat", "numeric",
    "lon", "numeric",
    "ship_name", "character",
    "date_time", "POSIXct",
    "ship_type", "character"
  )

  .ships_data %>%
    assert_tbl_tibble() %>%
    assert_tbl_no_missing_values() %>%
    assert_tbl_no_duplicate_rows() %>%
    assert_tbl_col_names(
      .col_spec = col_spec
    ) %>%
    assert_tbl_col_classes(
      .col_spec = col_spec
    )

  TRUE

}
