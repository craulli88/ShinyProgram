library(shiny)

# Define server logic
shinyServer(function(input, output) {

  # Reactive expression to compose a data frame containing all of the values
  sliderValues <- reactive({
    #Do calculations to get pace/mile
    time <- (((input$hours)*3600)+((input$minutes)*60)+(input$minutes))
    dist <- input$distance
    pace <- (time/dist)/60
    floor <- floor(pace)
    dec <- pace-floor
    sec <- floor(dec*60)
    paste <- paste(floor, ":", sec)
    
    # Print results into a table
    data.frame(
      Measure = "Pace/Mile",
      Value = as.character(paste), 
      stringsAsFactors=FALSE)
  }) 
  
  # Show the values using an HTML table
  output$values <- renderTable({
    sliderValues()
  })
})