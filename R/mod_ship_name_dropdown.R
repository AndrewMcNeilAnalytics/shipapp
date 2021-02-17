#' ship_name_dropdown UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_ship_name_dropdown_ui <- function(id) {

  ns <- NS(id)

  div(
    class = "ui raised padded segment blue",

    h4(
      class = "ui header",

      "Select Ship Name"

    ),

    dropdown_input(
      input_id = ns("ship_name"),
      choices = NULL
    )

  )

}

#' ship_name_dropdown Server Function
#'
#' @param .ships_data_type (reactive tbl_df)
#'   Ships data filtered by ship type
#'
#' @return (reactive character)
#'   Ship name chosen from dropdown
#'
#' @noRd
mod_ship_name_dropdown_server <- function(
  input,
  output,
  session,
  .ships_data_type
) {

  ns <- session$ns

  ship_name_choices <- reactive({

    req(.ships_data_type())

    .ships_data_type() %>%
      pull(ship_name) %>%
      unique() %>%
      sort()

  })

  observe({

    req(ship_name_choices())

    update_dropdown_input(
      session = session,
      input_id = "ship_name",
      choices = ship_name_choices()
    )

  })

  return(
    reactive({
      input$ship_name
    })
  )

}
