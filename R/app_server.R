#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#'
#' @noRd
app_server <- function(
  input,
  output,
  session
) {

  ships_data_raw <- read_ships_data()

  ships_data <- clean_ships_data(
    ships_data_raw
  )

  callModule(
    module = mod_app_server,
    id = "app",
    .ships_data = ships_data
  )

  waiter::waiter_hide()

}
