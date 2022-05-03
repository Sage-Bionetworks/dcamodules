library(shiny)
library(shinydashboard)
library(dcamodules)
# library(waiter)
# library(dplyr)

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
    waiter::use_waiter(),
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
        h2("Loading Screens"),
        fluidRow(
          box(
            title = "Landing:",
            width = 12,
            height = "250px",
            actionButton("btn_waiter_loading", "try 5s")
          ) %>% tagInsertAttribute(id = "box_waiter_loading"),
          box(
            title = "Uncertified User:",
            width = 12,
            height = "250px",
            actionButton("btn_waiter_no_cert", "try 5s")
          ) %>% tagInsertAttribute(id = "box_waiter_no_cert"),
          box(
            title = "Not Enough Permission:",
            width = 12,
            height = "250px",
            actionButton("btn_waiter_no_perm", "try 5s")
          ) %>% tagInsertAttribute(id = "box_waiter_no_perm"),
          box(
            title = "Successful Login:",
            width = 12,
            height = "250px",
            actionButton("btn_waiter_success", "try 5s")
          ) %>% tagInsertAttribute(id = "box_waiter_success")
        )
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

  lapply(c("loading", "no_cert", "no_perm", "success"), function(i) {

    observeEvent(input[[paste0("btn_waiter_", i)]], {
      dcWaiter("hide", sleep = 0)

      if (i == "loading") {
        msg <- "Retrieving Synapse information..."
        dcWaiter("show", id = paste0("box_waiter_", i), msg = msg)
        dcWaiter("hide", sleep = 5)
      } else {
        msg <- NULL
        dcWaiter("show", id = paste0("box_waiter_", i), msg = msg)
        dcWaiter("update",
                 id = paste0("box_waiter_", i),
                 is.landing = !grepl("landing", i),
                 is.certified = !grepl("cert", i),
                 is.permission = !grepl("perm", i))
        dcWaiter("hide", sleep = 5)
      }

    })

  })
  observeEvent(c(input$pri_theme,input$acc_theme), {

    output$theme <- renderUI({
      set_themes(input$pri_theme, input$acc_theme)
    })
  })
}

shinyApp(ui, server)
