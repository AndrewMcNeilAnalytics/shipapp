#' Read in ships data
#'
#' @return (tbl_df) Ships data
read_ships_data <- function() {

  file <-
    get_ships_file_path()

  data.table::fread(
    file = file,
    sep = ",",
    tz = "UTC",
    select = c(
      ship_type = "character",
      SHIPNAME = "character",
      LAT = "numeric",
      LON = "numeric",
      DATETIME = "character"
    )
  ) %>%
    as_tibble()

}

#' Get file path for ships data
#'
#' @return (character) File path
get_ships_file_path <- function() {

  app_sys(
    "app/data/ships.csv"
  )

}
