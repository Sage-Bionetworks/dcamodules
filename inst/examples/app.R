library(shiny)
library(shinydashboard)
library(dcamodules)
library(dplyr)

### general
themes <- c("default" ,"sage")

all_orgs <- list.files(system.file(package = "dcamodules", "assets/logos")) %>%
  tools::file_path_sans_ext()

ui <- dashboardPage(
  dashboardHeader(
    title = tagList("DCA Modules", tags$img(src="assets/logos/sage.svg", height = 40, alt="Logo")
  )),
  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem(
        "buttons",
        tabName = "tab_buttons",
        icon = icon("mouse")
      ),
      menuItem(
        "waiters",
        tabName = "tab_waiter",
        icon = icon("clock")
      ),
      menuItem(
        "progress bar",
        tabName = "tab_progress_bar",
        icon = icon("spinner")
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
    # set_theme(system.file(package = "dcamodules", "examples/theme_config_tmp.R")),
    uiOutput("theme"),
    tabItems(
      tabItem(
        tabName = "tab_buttons",
        h2("Still under development ...", style = "color: red; text-align:center;"),
        h3("Basic Buttons:"),
        fluidPage(
          actionButton("demo-act-btn1", "Primary", class = "btn-primary"),
          actionButton("demo-act-btn2", "Accent", class = "btn-accent"),
          actionButton("demo-act-btn3", "Success", class = "btn-success"),
          actionButton("demo-act-btn4", "Info", class = "btn-info"),
          actionButton("demo-act-btn5", "Warning", class = "btn-warning"),
          actionButton("demo-act-btn6", "Danger", class = "btn-danger")
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
        tabName = "tab_progress_bar",
        h2("Nothing here yet")
      ),
      tabItem(
        tabName = "tab_themes",
        h2("Change theme"),
        fluidRow(
          column(3, offset = 5,
            selectInput(
              inputId = "btn_theme",
              label = "Theme Choice:",
              choices = themes
            )
          ),
          box(
            title = "Customize your theme",
            status = "primary",
            width = 12,
            palettePanelUI("palette-panel")
          )
        ),
        fluidRow(
          box(
            title = "Box1",
            status = "primary",
            width = 6,
            "empty box"
          ),
          box(
            title = "Box2",
            status = "primary",
            solidHeader = TRUE,
            width = 6,
            "empty box"
          )
        ),
        fluidPage(
          actionButton("demo-act-btn1", "Primary", class = "btn-primary"),
          actionButton("demo-act-btn2", "Accent", class = "btn-accent"),
          actionButton("demo-act-btn3", "Success", class = "btn-success"),
          actionButton("demo-act-btn4", "Info", class = "btn-info"),
          actionButton("demo-act-btn5", "Warning", class = "btn-warning"),
          actionButton("demo-act-btn6", "Danger", class = "btn-danger")
        )
      )
    ) %>% tabSwitchUI("switch_btn"),
    dcaFooter(
      HTML(paste0(
        "Copy right @2022. Powered by ",
        tags$a("Sage Bionetworks", href = "https://sagebionetworks.org/"),
        "."
        )),
      media = tagList(
        mediaButton("github", "https://github.com/Sage-Bionetworks/dcamodules"),
        mediaButton("github", "https://github.com/Sage-Bionetworks/dcamodules")
      )
    )
  )
)

server <- function(input, output, session) {
  palettePanel("palette-panel", "theme", session, input, output)
  observeEvent(input$btn_theme, {
      output$theme <- renderUI({
          set_theme(theme = input$btn_theme)
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
