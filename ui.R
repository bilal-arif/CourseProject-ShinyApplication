library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("My Assignment - Data Science"),
    sidebarPanel(
      sliderInput("breaks",'No. of Points',value = .1,min=.01,max=1,step=.005),
      p("It is kind of the detail of the curve, and how smooth the cruve will be"),
      sliderInput("min",'Maximum Value',value = 1.5,min=0,max=10,step=.1), 
      p("The Maximum possible value of the curve"),
      sliderInput("max",'Minimum Value',value = 5.5,min=1,max=10,step=.1),
      p("The Minimum possible value of the curve"),
      checkboxGroupInput('datavalue',"Use Data Value",
                         c("Minimum"="min",
                           "Maximum"="max"
                           )
                         ),
      p("It uses the maximum and minimum values of the dataset and sets the value accordingly")
      ),
    mainPanel(
      plotOutput('curve')
      )
    )
  )