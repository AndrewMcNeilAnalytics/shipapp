#' app UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
mod_app_ui <- function(id) {

  ns <- NS(id)

  semanticPage(

    grid_app(

      ship_type = mod_ship_type_dropdown_ui(
        id = ns("ship_type_dropdown")
      ),

      ship_name = mod_ship_name_dropdown_ui(
        id = ns("ship_name_dropdown")
      ),

      note = mod_note_ui(
        id = ns("note")
      ),

      map = mod_plot_longest_trip_ui(
        id = ns("plot_longest_trip")
      )

    )

  )

}

#' app Server Function
#'
#' @param .ships_data (tbl_df) Cleaned ships data
#'
#' @noRd
mod_app_server <- function(
  input,
  output,
  session,
  .ships_data
) {

  ns <- session$ns

  ship_type <- callModule(
    module = mod_ship_type_dropdown_server,
    id = "ship_type_dropdown",
    .ships_data = .ships_data
  )

  ships_data_type <- callModule(
    module = mod_filter_ship_type,
    id = "filter_ship_type",
    .ships_data = .ships_data,
    .ship_type = ship_type
  )

  ship_name <- callModule(
    module = mod_ship_name_dropdown_server,
    id = "ship_name_dropdown",
    .ships_data_type = ships_data_type
  )

  ships_data_name <- callModule(
    module = mod_filter_ship_name,
    id = "filter_ship_name",
    .ships_data_type = ships_data_type,
    .ship_name = ship_name
  )

  longest_trip <- callModule(
    module = mod_calc_longest_trip,
    id = "calc_longest_trip",
    .ships_data_name = ships_data_name
  )

  callModule(
    module = mod_plot_longest_trip_server,
    id = "plot_longest_trip",
    .longest_trip = longest_trip
  )

  callModule(
    module = mod_note_server,
    id = "note",
    .longest_trip = longest_trip
  )

}

