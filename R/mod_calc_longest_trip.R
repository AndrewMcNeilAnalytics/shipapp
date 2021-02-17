#' calc_longest_trip Server Function
#'
#' @param .ships_data_name (reactive tbl_df) Ships data
#'   filtered by ship type and ship name
#'
#' @return (reactive tbl_df) Tibble with information
#'   about the longest trip for the ship
#'
#' @noRd
mod_calc_longest_trip <- function(
  input,
  output,
  session,
  .ships_data_name
) {

  ns <- session$ns

  longest_trip <- reactive({

    req(
      nrow(.ships_data_name()) > 0
    )

    calc_longest_trip(
      .ships_data = .ships_data_name()
    )

  })

  return(
    longest_trip
  )

}


