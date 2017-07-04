#' Create a footer for a dashboard page
#'
#' A dashboard footer can be left blank, or it can include arbitrary HTML (small)
#' on the right side.
#'
#' @param ... Items to put in the footer.
#'
#' @param version optional version number displayed on left side when not in mobile size
#'
#' @examples
#' ## Footer Example
#' library(shiny)
#' copyrighttext <- function(holder=
#'    (if(""==Sys.getenv("USERNAME")) Sys.getenv("USER") else Sys.getenv("USERNAME"))
#'   ){
#'     paste("Copyright", format(Sys.Date(),"%Y"),holder )
#' }
#'
#' title <- "The Shiniest App"
#' footer <- dashboardFooter(
#'  tags$strong(title),
#'  HTML("|"),
#'  tags$i(copyrighttext()),
#'  version=paste("version ", packageVersion("shinydashboard"))
#' )

#' @export
dashboardFooter <- function(...,version=' '){
  tags$footer(class='main-footer',
      ...,
      div(class="pull-right hidden-xs",version)
  )

}



