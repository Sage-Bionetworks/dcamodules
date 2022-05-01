library(shiny)
library(shinydashboard)
library(dcamodules)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem(
        "buttons",
        tabName = "tab_buttons",
        icon = icon("mouse")
      )
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(
        tabName = "tab_buttons",
        h2("Buttons:"),
        lapply(1:10, FUN = shinyButton)
      )
    )
  )
)

server <- function(input, output) { }

shinyApp(ui, server)
