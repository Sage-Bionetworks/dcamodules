# https://stackoverflow.com/questions/66004405/access-updated-datatable-edited-with-celledit-in-r-shiny
# https://stackoverflow.com/questions/56535488/how-to-download-editable-data-table-in-shiny

library(shiny)
library(DT)

callback <- readLines(system.file("js", "callback.js", package = "dcamodules"))

editable_table_ui <- function(id){
  ns <- NS(id)
  
  fluidPage(
    fileInput(ns("file"), label = h3("Upload a CSV")),
    br(),
    DTOutput(ns("dt")),
    br(),
    verbatimTextOutput(ns("editedCell")),
    br(),
    actionButton(ns("action"), label = "Add row to table"),
    br(),
    downloadButton(ns("downloadData"), "Download this table")
  )
}

editable_table_server <- function(id){
  moduleServer(
    id,
    function(input, output, session){
      
      # Make this dynamic input
      # Create a template with the necessary column names.
      template_data <- data.frame(
        "Patient ID" = NA_character_,
        Sex = NA_character_,
        "Year of Birth" = NA_character_,
        Diagnosis = NA_character_,
        Component = NA_character_,
        "Cancer Type" = NA_character_,
        "Family History" = NA_character_,
        check.names = FALSE
      )
      
      # Create a reactive work dataset that will take the template as a default
      # If a user uploads a file, it will take that value.
      work_data <- reactiveVal(template_data)
      
      observeEvent(input$file, {
        upload_data <- read.csv(input$file$datapath, check.names=FALSE)
        work_data(upload_data)
      })
      
      # Render the "work" table (either default or user's data) with editable cells.
      #https://www.r-bloggers.com/2021/01/adding-action-buttons-in-rows-of-dt-data-table-in-r-shiny/
      output[["dt"]] <- renderDT({
        dtable <- datatable(work_data(), #dat, 
                            rownames = FALSE,
                            selection = "none",
                            callback = JS(callback))

        path <- path.expand("www") # folder containing the files dataTables.cellEdit.js
        # and dataTables.cellEdit.css
        dep <- htmltools::htmlDependency(
          "CellEdit", "1.0.19", path, 
          script = "dataTables.cellEdit.js", stylesheet = "dataTables.cellEdit.css", 
          all_files = FALSE)
        dtable$dependencies <- c(dtable$dependencies, list(dep))
        dtable
      }, server = FALSE)
      
      # Look for edits to the table and update the actual table.
      observeEvent(input[["dt_cell_edit"]], {
        cell <- input[["dt_cell_edit"]]
        newdf <- work_data()
        newdf[cell$row, cell$col] <- cell$value
        work_data(newdf)
      })
      
      # Add a row to the "work" table.
      observeEvent(input$action, {
        work_data(tibble::add_row(work_data()))
      })
      
      # Download the "work" table.
      output[["downloadData"]] <- downloadHandler(
        filename = function() {
          "mydata.csv"
        },
        content = function(file) {
          write.csv(work_data(), file, row.names = FALSE)
        }
      )
      
    }
  )
}

editable_table_demo <- function(){ 
  ui <- editable_table_ui("x")
  server <- function(input, output, session){
    editable_table_server("x")
  }
  shinyApp(ui, server)
}

