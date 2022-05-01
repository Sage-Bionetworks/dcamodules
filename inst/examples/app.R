library(shiny)
library(shinydashboard)
library(dcamodules)

### general
themes <- c(
  "royal", "powder","coral","blueberry",
  "rose","slate", "cloud","butterscotch",
  "turquoise","apricot", "apple","lavender",
  "fern", "stone"
)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem(
        "buttons",
        tabName = "tab_buttons",
        icon = icon("mouse")
      ),
      menuItem(
        "themes",
        tabName = "tab_themes",
        icon = icon("brush")
      )
    )
  ),
  dashboardBody(
    uiOutput("theme"),
    tabItems(
      tabItem(
        tabName = "tab_buttons",
        h1("Still under development ...", style = "color: red; text-align:center;"),
        h2("Buttons:"),
        shinyButton()
      ),
      tabItem(
        tabName = "tab_themes",
        h2("Select colors to preview themes (only set up for colors now"),
        fluidRow(
          column(3, offset = 2,
            selectInput(
              inputId = "pri_theme",
              label = "Choose your primary color:",
              choices = themes,
              selected = "royal"
            )
          ),
          column(3,
            selectInput(
              inputId = "acc_theme",
              label = "Choose your secondary color:",
              choices = themes,
              selected = "coral"
            )
          )
        ),
        fluidRow(
          box(
            title = "Box1",
            status = "primary",
            width = 6,
            actionButton("theme_button", "Button")
          ),
          box(
            title = "Box2",
            status = "primary",
            solidHeader = TRUE,
            width = 6,
            actionButton("theme_button", "Button")
          )
        )
      )
    )
  )
)

server <- function(input, output) {

  observeEvent(c(input$pri_theme,input$acc_theme), {

    output$theme <- renderUI({
      set_themes(input$pri_theme, input$acc_theme)
    })
  })
}

shinyApp(ui, server)
