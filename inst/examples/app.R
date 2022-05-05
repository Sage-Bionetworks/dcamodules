library(shiny)
library(shinydashboard)
library(dcamodules)
library(dplyr)

### general
themes <- c(
  "royal", "powder","coral","blueberry",
  "rose","slate", "cloud","butterscotch",
  "turquoise","apricot", "apple","lavender",
  "fern", "stone"
)

primary_cl <- reactiveVal("slate")
accent_cl <- reactiveVal("royal")

all_orgs <- list.files(system.file(package = "dcamodules", "assets/logos")) %>%
  tools::file_path_sans_ext()


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
        icon = icon("clock")
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
    use_dcaWaiter(),
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
            title = "Logo Spinner:",
            width = 12,
            fluidRow(
              lapply(all_orgs, function(org) {
                column(3, spin_logo(org))
              })
            )
          ),
          box(
            title = "Landing:",
            width = 12,
            height = "250px",
            actionButton("btn_waiter_loading", "try")
          ) %>% tagInsertAttribute(id = "box_waiter_loading"),
          box(
            title = "Uncertified User:",
            width = 12,
            height = "250px",
            actionButton("btn_waiter_no_cert", "try")
          ) %>% tagInsertAttribute(id = "box_waiter_no_cert"),
          box(
            title = "Not Enough Permission:",
            width = 12,
            height = "250px",
            actionButton("btn_waiter_no_perm", "try")
          ) %>% tagInsertAttribute(id = "box_waiter_no_perm"),
          box(
            title = "Successful Login:",
            width = 12,
            height = "250px",
            actionButton("btn_waiter_success", "try")
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
              choices = themes
            )
          ),
          column(3,
            selectInput(
              inputId = "acc_theme",
              label = "Secondary color:",
              choices = themes
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

  observeEvent(c(primary_cl(), accent_cl()), {

    output$theme <- renderUI({
      set_themes(primary_cl(), accent_cl())
    })
  })

  tabSwitch("switch_btn", "tabs", session, input, output)

  lapply(c("loading", "no_cert", "no_perm", "success"), function(i) {

    observeEvent(input[[paste0("btn_waiter_", i)]], {
      dcaWaiter("hide", sleep = 0)

      if (i == "loading") {
        msg <- "Retrieving Synapse information..."
        dcaWaiter("show", id = paste0("box_waiter_", i), msg = msg)
      } else {
        msg <- NULL
        dcaWaiter("show", id = paste0("box_waiter_", i), msg = msg)
        dcaWaiter("update",
                 id = paste0("box_waiter_", i),
                 is.landing = !grepl("landing", i),
                 is.certified = !grepl("cert", i),
                 is.permission = !grepl("perm", i))
      }
    })
  })
}

shinyApp(ui, server)
