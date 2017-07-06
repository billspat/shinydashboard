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
    controlsidebarMenu(
      controlsidebarMenuItem("this is item 1",icon("table"),heading="Item 1"),
      controlsidebarMenuItem("this is item 2",icon("table"),heading="Item 2"),
      controlsidebarMenuItem("this is item 3",icon("table"),heading="Item 3")
    )
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
        message = paste(row[["message"]], input$slider)
      )
    })

    dropdownMenu(type = "messages", .list = msgs)
  })
}

shinyApp(ui, server)
