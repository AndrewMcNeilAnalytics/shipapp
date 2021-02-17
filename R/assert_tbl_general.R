#' Check if all values of an object are not missing
#'
#' @param .x (atomic | list) Vector or list
#'
#' @return (logical) Whether any values are missing
not_missing <- function(.x) {

  all(
    !is.na(.x) &
    !is.null(.x)
  )

}

#' Assert that input is a tibble
#'
#' @param .tbl (tbl_df) Tibble
#'
#' @return (tbl_df) Returns input if passed, error otherwise
assert_tbl_tibble <- function(
  .tbl
) {

  verify(
    data = .tbl,
    expr = tibble::is_tibble(.tbl)
  )

}

#' Assert that a tibble has no missing values
#'
#' @param .tbl (tbl_df) Tibble
#'
#' @return (tbl_df) Returns input if passed, error otherwise
assert_tbl_no_missing_values <- function(
  .tbl
) {

  assert_rows(
    data = .tbl,
    row_reduction_fn = not_missing,
    predicate = all,
    everything()
  )

}

#' Assert that a tibble has no duplicate rows
#'
#' @param .tbl (tbl_df) Tibble
#'
#' @return (tbl_df) Returns input if passed, error otherwise
assert_tbl_no_duplicate_rows <- function(
  .tbl
) {

  assert_rows(
    data = .tbl,
    row_reduction_fn = col_concat,
    predicate = is_uniq,
    everything()
  )

}

#' Assert that a tibble has expected column names
#'
#' @param .tbl (tbl_df) Tibble
#' @param .col_spec (tbl_df) Column spec tibble
#'
#' @return (tbl_df) Returns input if passed, error otherwise
assert_tbl_col_names <- function(
  .tbl,
  .col_spec
) {

  verify(
    .tbl,
    identical(
      sort(colnames(.tbl)),
      sort(.col_spec$name)
    )
  )

}

#' Assert that a tibble has expected column classes
#'
#' @param .tbl (tbl_df) Tibble
#' @param .col_spec (tbl_df) Column spec tibble
#'
#' @return (tbl_df) Returns input if passed, error otherwise
assert_tbl_col_classes <- function(
  .tbl,
  .col_spec
) {

  primary_class <- compose(
    first,
    class
  )

  col_classes_tbl <- .tbl %>%
    map(primary_class) %>%
    set_names(colnames(.tbl)) %>%
    .[order(names(.))]

  col_classes_spec <- .col_spec %>%
    pull(class) %>%
    as.list() %>%
    set_names(.col_spec$name) %>%
    .[order(names(.))]

  verify(
    .tbl,
    identical(
      col_classes_tbl,
      col_classes_spec
    )
  )

  .tbl

}
