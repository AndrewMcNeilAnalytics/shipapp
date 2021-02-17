#' Generate CSS Grid for the app
#'
#' @param ... Arguments to pass to "grid" function
grid_app <- function(...) {

  grid_app <- grid_template(
    default = list(
      areas = rbind(
        c("ship_type", "ship_name", "note"),
        c("map", "map", "map")
      ),
      rows_height = c("auto", "1fr"),
      cols_width = c("1fr", "1fr", "1fr")
    )
  )

  grid(
    grid_template = grid_app,
    container_style = "
      align-items: stretch;
      justify-items: stretch;
      row-gap: 4vh;
      column-gap: 3vh;
      padding: 2vh;
      background-color: #fafafa
    ",

    ...

  )

}
