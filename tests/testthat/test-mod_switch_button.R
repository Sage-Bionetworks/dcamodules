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

# testing updateTabItems in a module is a bit tricky
# haven't found a good testing for ^
# ignore server test for now
