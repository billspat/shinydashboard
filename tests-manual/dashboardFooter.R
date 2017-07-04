# A dashboard footer demo with copyright and version

library(shiny)

dashtitle <- "Footer Demo"
header <- dashboardHeader(
  title = dashtitle
)

body <- dashboardBody(

)


copyrighttext <- function(holder= (if(""==Sys.getenv("USERNAME")) Sys.getenv("USER") else Sys.getenv("USERNAME"))){
  paste("Copyright", format(Sys.Date(),"%Y"),holder )
}

footer <- dashboardFooter(
  tags$strong(dashtitle),
  HTML("|"),
  tags$i(copyrighttext()),
  version=paste("Dashboard version ", packageVersion("shinydashboard"))
)

shinyApp(
  ui = dashboardPage(
    header,
    dashboardSidebar(),
    body,
    footer
  ),
  server = function(input, output) { }
)
