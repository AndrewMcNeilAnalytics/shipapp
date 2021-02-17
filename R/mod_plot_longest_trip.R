#' plot_longest_trip UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_plot_longest_trip_ui <- function(id) {

  ns <- NS(id)

  div(
    class = "ui raised padded segment",
    style = "
      width: 100%;
      height: 100%;
    ",

    leaflet::leafletOutput(
      outputId = ns("map"),
      width = "100%",
      height = "100%"
    )

  )

}

#' plot_longest_trip Server Function
#'
#' @param .longest_trip (reactive tbl_df)
#'   Tibble containing information about the longest trip
#'
#' @noRd
mod_plot_longest_trip_server <- function(
  input,
  output,
  session,
  .longest_trip
) {

  ns <- session$ns

  output$map <- leaflet::renderLeaflet({

    req(.longest_trip())

    plot_trip(.trip = .longest_trip())

  })

}


