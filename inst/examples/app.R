library(shiny)
library(shinydashboard)
library(dcamodules)
library(shinyjs)
library(dplyr)
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
        "waiter",
        tabName = "tab_waiter",
        icon = icon("screen")
      ),
      menuItem(
        "data",
        tabName = "tab_data",
        icon = icon("table")
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
        h2("Still under development ...", style = "color: red; text-align:center;"),
        h3("Basic Buttons:"),
        fluidPage(
          actionButton("demo-act-btn", "Primary", class = "btn-primary"),
          actionButton("demo-act-btn", "Accent", class = "btn-accent"),
          actionButton("demo-act-btn", "Success", class = "btn-success"),
          actionButton("demo-act-btn", "Warning", class = "btn-warning"),
          actionButton("demo-act-btn", "Danger", class = "btn-danger")
        ),
        h3("Special Buttons:"),
        fluidPage(
          shinyButton("demo-shiny-btn", "Button"),
          arrowButton("demo-arrow-left", "left"),
          arrowButton("demo-arrow-right", "right")
          )
      ),
      tabItem(
        tabName = "tab_waiter",
        h2("Nothing here yet")
      ),
      tabItem(
        tabName = "tab_data",
        h2("Nothing here yet")
      ),
      tabItem(
        tabName = "tab_themes",
        h2("Select colors to preview themes"),
        fluidRow(
          column(3, offset = 2,
            selectInput(
              inputId = "pri_theme",
              label = "Primary color:",
              choices = themes,
              selected = "slate"
            )
          ),
          column(3,
            selectInput(
              inputId = "acc_theme",
              label = "Secondary color:",
              choices = themes,
              selected = "royal"
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
    ) %>% tabSwitchUI("switch_btn")
  )
)

server <- function(input, output, session) {

  observeEvent(c(input$pri_theme,input$acc_theme), {

    output$theme <- renderUI({
      set_themes(input$pri_theme, input$acc_theme)
    })
  })

  tabSwitch("switch_btn", "tabs", session, input, output)

}

shinyApp(ui, server)
