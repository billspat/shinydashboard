## Dynamically render controlmenu sidebar items with other shiny controls (sliders)

library(shiny)

ui <- dashboardPage(
  dashboardHeader(
    title = "Dynamic menus",
    # this parameter is required to display icon that triggers control-sidebar js
    controlsidebar = TRUE
  ),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(
        title = "Parameters",
        sliderInput("slider1", "alpha", 1, 100, 50),
        sliderInput("slider2", "beta", 1, 100, 50),
        sliderInput("slider3", "gamma", 1, 100, 50)
      )
    )
  ),
  dashboardControlSidebar(
    # display server-side control-sidebar menu output
    controlMenuOutput("controlMenu")
  )

)

server <- function(input, output) {
  # Code to connect UI controls to controlsidebar menu dynamically
  output$controlMenu <- renderControlMenu({
    controlsidebarMenu( controlsidebarMenuItem(p(input$slider1),headerText="alpha"),
                       controlsidebarMenuItem(p(input$slider2),headerText="beta"),
                       controlsidebarMenuItem(p(input$slider3),headerText="gamma"),
                       headerText = "Parameters")
  })

}

shinyApp(ui, server)
