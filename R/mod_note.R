#' note UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_note_ui <- function(id) {

  ns <- NS(id)

  div(
    class = "ui raised padded segment",

    h4(
      class = "ui blue ribbon label",

      "Longest Trip"

    ),

    p(
      textOutput(
        outputId = ns("note")
      )
    )

  )

}

#' note Server Function
#'
#' @param .longest_trip (tbl_df)
#'   Tibble containing information about the
#'   longest trip
#'
#' @noRd
mod_note_server <- function(
  input,
  output,
  session,
  .longest_trip
) {

  ns <- session$ns

  output$note <- renderText({

    req(.longest_trip())

    gen_trip_note(
      .longest_trip = .longest_trip()
    )

  })

}

