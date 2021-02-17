#' ship_type_dropdown UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_ship_type_dropdown_ui <- function(id) {

  ns <- NS(id)

  div(
    class = "ui raised padded segment blue",

    h4(
      class = "ui header",

      "Select Ship Type"

    ),

    dropdown_input(
      input_id = ns("ship_type"),
      choices = NULL
    )

  )

}

#' ship_type_dropdown Server Function
#'
#' @param .ships_data (tbl_df) Ships data
#'
#' @return (reactive character)
#'   Ship type chosen from dropdown
#'
#' @noRd
mod_ship_type_dropdown_server <- function(
  input,
  output,
  session,
  .ships_data
) {

  ns <- session$ns

  ship_type_choices <- .ships_data %>%
    pull(ship_type) %>%
    unique() %>%
    sort()

  update_dropdown_input(
    session = session,
    input_id = "ship_type",
    choices = ship_type_choices
  )

  return(
    reactive({
      input$ship_type
    })
  )

}


