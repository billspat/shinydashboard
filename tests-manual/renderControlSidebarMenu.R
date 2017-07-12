## Creates a slider though which (dropdown) notifications are updated

library(shiny)

messageData <- data.frame(
  from = c("Admininstrator", "New User", "Support"),
  message = c(
    "Sales are steady this month.",
    "How do I register?",
    "The new server is ready."
  ),
  stringsAsFactors = FALSE
)

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
    dropdownMenuOutput("messageMenu"),
    controlsidebar = TRUE
  ),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(
        title = "Controls",
        sliderInput("slider1", "V1:", 1, 100, 50),
        sliderInput("slider2", "V2:", 1, 100, 50),
        sliderInput("slider3", "V3:", 1, 100, 50)
      )
    )
  ),
  dashboardControlSidebar(
    controlMenuOutput("controlMenu")
    # controlsidebarMenu(headerText = "Parameter List",
    #   controlsidebarMenuItem(p(" 1"),headerText="alpha"),
    #   controlsidebarMenuItem(p("2.0001"),headerText="beta"),
    #   controlsidebarMenuItem(p("-3"),headerText="gamma")
    # )
  )
)

server <- function(input, output) {
  output$messageMenu <- renderMenu({
    # Code to generate each of the messageItems here, in a list.controlmenuData
    # is a data frame with two columns, 'from' and 'message'.
    # Also add on slider value to the message content, so that messages update.
    msgs <- apply(messageData, 1, function(row) {
      messageItem(
        from = row[["from"]],
        message = paste(row[["message"]], input$slider1)
      )
    })

    dropdownMenu(type = "messages", .list = msgs)
  })


  output$controlMenu <- renderControlMenu({
    controlsidebarMenu( controlsidebarMenuItem(p(input$slider1),headerText="alpha"),
                       controlsidebarMenuItem(p(input$slider2),headerText="beta"),
                       controlsidebarMenuItem(p(input$slider3),headerText="gamma"),
                       title = "Parameters")
  })

} # end server

shinyApp(ui, server)
