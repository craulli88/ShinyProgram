library(shiny)

# Define UI for slider demo application
shinyUI(fluidPage(
  
  #Title
  titlePanel("Pace Calculator"),
  
  # Sidebar with Numberic input and sliders
  sidebarLayout(
    sidebarPanel(
      # Specify the distance traveled
      numericInput("distance", "Distance (miles):", 1,
                   min = 1, max = 100),
      
      # Specify the amount of hours
      sliderInput("hours", "Hours:", 
                  min=0, max=23, value=0),
      
      # Specify the amount of minutes
      sliderInput("minutes", "Minutes:",
                  min=0, max=59, value=0),
      
      # Specify the amount of seconds
      sliderInput("seconds", "Seconds:",
                  min=0, max=59, value=0)
    ),
    
    # Show a table summarizing the values entered
    mainPanel(
      tableOutput("values")
    )
  )
))