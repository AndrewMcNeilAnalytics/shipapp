#' Plot a map with the start, middle and end of a trip
#'
#' @param .trip (tbl_df) Tibble containing information
#'   about the trip
#'
#' @return (leaflet) Leaflet htmlwidget map
plot_trip <- function(
  .trip
) {

  icon_size <- 60

  icons <- iconList(
    start = makeIcon(
      iconUrl = app_sys("app/www/port.png"),
      iconWidth = icon_size,
      iconHeight = icon_size
    ),
    middle = makeIcon(
      iconUrl = app_sys("app/www/ship.png"),
      iconWidth = icon_size,
      iconHeight = icon_size
    ),
    end = makeIcon(
      iconUrl = app_sys("app/www/treasure.png"),
      iconWidth = icon_size,
      iconHeight = icon_size
    )
  )

  leaflet(.trip) %>%
    addProviderTiles(
      provider = "Stamen.Watercolor"
    ) %>%
    addMarkers(
      lng = ~lon,
      lat = ~lat,
      icon = ~icons[location]
    )

}
