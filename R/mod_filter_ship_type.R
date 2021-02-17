#' filter_ship_type Server Function
#'
#' @param .ships_data (tbl_df) Ships data
#' @param .ship_type (reactive character)
#'   Ship type from dropdown
#'
#' @noRd
mod_filter_ship_type <- function(
  input,
  output,
  session,
  .ships_data,
  .ship_type
) {

  ns <- session$ns

  ships_data_type <- reactive({

    req(.ship_type())

    filter_ship_type(
      .ships_data = .ships_data,
      .ship_type = .ship_type()
    )

  })

  return(
    ships_data_type
  )

}
