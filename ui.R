library(shiny)
library(ggplot2)
library(gridExtra, quietly =T)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Diferenciales de selección"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("dif", label = "diferencial s", min=-2, max=2, value = 0, step = 0.01),
      width = 3),
  
    
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))