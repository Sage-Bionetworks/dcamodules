library(shiny)
library(shinydashboard)
library(dcamodules)

ui <- dashboardPage(
  dashboardHeader(palettePanelUI("test-id")),
  dashboardSidebar(),
  dashboardBody(uiOutput("head-id"))
)

# not real server testing
server <- function(input, output, session) {
  palettePanel("test-id", "head-id", session)
}

shinyApp(ui, server)
