library(shiny)
library(shinydashboard)
library(dcamodules)
ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem("tab1"),
      menuItem("tab2")
    )
  ),
  dashboardBody(
    tabSwitchUI(
      id = "switch",
      tabItems(
        tabItem("tab1"),
        tabItem("tab2")
        )
    )
  )
)

server <- function(input, output, session) {
  observeEvent(input$test, {
    tabSwitch("switch", "tabs", session, input, output)
  })
}

testServer(server, {
  session$setInputs(test = 1)
  session$setInputs(tabs = "tab2")
})

