#' filter_ship_name Server Function
#'
#' @param .ships_data (reactive tbl_df) Ships data
#' @param .ship_name (reactive character)
#'   Ship name from dropdown
#'
#' @noRd
mod_filter_ship_name <- function(
  input,
  output,
  session,
  .ships_data_type,
  .ship_name
) {

  ns <- session$ns

  ships_data_name <- reactive({

    req(
      .ships_data_type(),
      .ship_name()
    )

    filter_ship_name(
      .ships_data = .ships_data_type(),
      .ship_name = .ship_name()
    )

  })

  return(
    ships_data_name
  )

}
