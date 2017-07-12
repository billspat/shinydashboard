## Creates a slider though which (dropdown) notifications are updated

library(shiny)


controlmenuData <- data.frame(
  key = c("Key1", "Key2", "Key3"),
  value = c(
    "V1",
    "V2",
    "V3"
  ),
  stringsAsFactors = FALSE
)

ui <- dashboardPage(
  dashboardHeader(
    title = "Dynamic menus",
    controlsidebar = TRUE
  ),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(
        title = "Controls",
        sliderInput("slider1", "alpha", 1, 100, 50),
        sliderInput("slider2", "beta", 1, 100, 50),
        sliderInput("slider3", "gamma", 1, 100, 50)
      )
    )
  ),
  dashboardControlSidebar(
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
