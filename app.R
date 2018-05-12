library(shiny)

ui <- fluidPage(
  titlePanel("Grade Percentage Calculator"),
  p(
    "This app can help you estimate your overall grade for info 201"
  ),
  numericInput("assignment", label = "Assignment(%)", value = 0, min = 0, 
               max = 100),
  numericInput("participation", label = "Participation(%)", value = 0, min = 0, 
               max = 100),
  numericInput("project", label = "Project(%)", value = 0, min = 0, 
               max = 100),
  strong("Overall Grade(%)"), 
  textOutput("overall")
)
server <- function(input, output) {
  output$overall <- renderText({
    return(paste0((input$assignment * 0.7) + (input$participation * 0.05) +
                    (input$project * 0.25))) 
  })
}
shinyApp(ui = ui, server = server)
  
  