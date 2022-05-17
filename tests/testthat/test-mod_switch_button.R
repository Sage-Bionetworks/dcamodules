library(shiny)
library(shinydashboard)
library(dcamodules)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem("tab1"),
      menuItem("tab2"),
      menuItem("tab3")
    )
  ),
  dashboardBody(
    tabSwitchUI(
      id = "switch",
      tabItems(
        tabItem("tab1"),
        tabItem("tab2"),
        tabItem("tab3")
      )
    )
  )
)

# not real server testing
server <- function(input, out, session) {
  tabSwitch("switch", "tabs", session)
}

shinyApp(ui, server)
