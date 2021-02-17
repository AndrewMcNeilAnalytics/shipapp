#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @noRd
app_ui <- function(request) {

  tagList(

    golem_add_external_resources(),

    waiter::use_waiter(),
    waiter::waiter_show_on_load(
      html = waiter::spin_3(),
      color = "#ffffff"
    ),

    mod_app_ui(
      id = "app"
    )

  )

}
#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @noRd
golem_add_external_resources <- function() {

  add_resource_path(
    'www',
    app_sys('app/www')
  )

  shiny::tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'shipapp'
    )
  )
}
