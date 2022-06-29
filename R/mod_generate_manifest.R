generate_manifest_ui <- function(id) {
  ns <- NS(id)
  shinyjs::useShinyjs()
  
  fluidPage(
  textInput(ns("url"), label = h3("Schematic URL"), value = "http://0.0.0.0:3001/v1/manifest/generate"),
  br(),
  textInput(ns("title"), label = h3("Data Title"), value = "Title"),
  br(),
  textInput(ns("data_type"), label = h3("Template Type"), value = "Biospecimen"),
  br(),
  textInput(ns("dataset_id"), label = h3("Synapse Fileview"), value = "syn23643253"),
  br(),
  h2("Download Template for Selected Folder"),
  fluidRow(
    shinydashboardPlus::box(
      title = "Get Link, Annotate, and Download Template as CSV",
      status = "primary",
      width = 12,
      actionButton(ns("btn_template"), "Click to Generate Google Sheets Template",
                   class = "btn-primary-color"
      ),
      shinyjs::hidden(
        div(
          id = "div_template_warn",
          height = "100%",
          htmlOutput(ns("text_template_warn"))
        ),
        div(
          id = "div_template",
          height = "100%",
          htmlOutput(ns("text_template"))
        )
      ),
      helpText("This link will leads to an empty template or your previously submitted template with new files if applicable.")
    )
  )
)
#  tabItem(
#    tabName = "tab_data",
#    h2("Set Dataset and Metadata Template for Curation"),
    # fluidRow(
    #   shinydashboardPlus::box(
    #     status = "primary",
    #     width = 6,
    #     title = "Choose a Project and Folder: ",
    #     selectInput(
    #       inputId = ns("dropdown_project"),
    #       label = "Project:",
    #       choices = "Generating..."
    #     ),
    #     selectInput(
    #       inputId = ns("dropdown_folder"),
    #       label = "Folder:",
    #       choices = "Generating..."
    #     ),
    #     helpText(
    #       "If your recently updated folder does not appear, please wait for Synapse to sync and refresh"
    #     )
    #   ),
    #   shinydashboardPlus::box(
    #     status = "primary",
    #     width = 6,
    #     title = "Choose a Metadata Template Type: ",
    #     selectInput(
    #       inputId = ns("dropdown_template"),
    #       label = "Template:",
    #       choices = "Generating..."
    #     )
    #   )
    # )#,
#    switchTabUI("switchTab2", direction = "both")
#  )
}

generate_manifest_server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      
      observeEvent(input$btn_template, {
        # loading screen for template link generation
 #       dcWaiter("show", msg = "Generating link...")
        
        # manifest_url <-
        #   metadata_model$getModelManifest(paste0(config$community, " ", input$dropdown_template),
        #     template_schema_name(),
        #     filenames = switch((template_type == "assay") + 1,
        #       NULL,
        #       as.list(names(datatype_list$files))
        #     ),
        #     datasetId = folder_synID()
        #   )
        
        #schematic rest api to generate manifest
       manifest_url <- manifest_generate(
         # url=file.path("http://0.0.0.0:3001", "v1/manifest/generate"),
         # title = "Test",
         # data_type = "Biospecimen",
         # dataset_id = "syn23643253"
         url=input$url,
         title = input$title,
         data_type = input$data_type,
         dataset_id = input$dataset_id
         )
        
        # generate link
        output$text_template <- renderUI(
          tags$a(id = "template_link",
                 href = manifest_url,
                 list(icon("hand-point-right"), manifest_url),
                 target = "_blank")
        )
        
#        dcWaiter("hide", sleep = 1)
        
#        shinypop::nx_confirm(
#          inputId = "btn_template_confirm",
#          title = "Go to the template now?",
#          message = paste0("click 'Go' to edit your ",
#          #                 sQuote(input$dropdown_template),
#                           " template on the google sheet"),
#          button_ok = "Go",
#        )
        
        # display link
#        show("div_template") # TODO: add progress bar on (loading) screen
      })
    })
}

generate_manifest_demo <- function() {
  ui <- generate_manifest_ui("x")
  server <- function(input, output, session) {
    generate_manifest_server("x")
  }
  shinyApp(ui, server)
}
