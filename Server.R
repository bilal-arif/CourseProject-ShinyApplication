library(shiny)
library(UsingR)
data(galton)
data(faithful)


shinyServer(
  function(input,output) {
    duration<-faithful$eruption
    output$curve <- renderPlot({
      if(('min' %in% input$datavalue) ==TRUE){
        min<-min(duration)
      }
      else{
        min<-input$min
      }
      
      if(('max' %in% input$datavalue) ==TRUE){
        max<-max(duration)
      }
      else{
        max<-input$max
      }      
      
      breaks = seq(min,max,by=input$breaks)
      duration.cut<-cut(duration,breaks,rigth=FALSE)
      duration.freq <- table (duration.cut)
      cumfreq0<-c(0,cumsum(duration.freq))
    
      plot(breaks,cumfreq0,
           main = "Old Fashion Eruptions",
           xlab="Duration",
           ylab="Cumalative")
      
      lines(breaks,cumfreq0)
    }
    
    )

    
  }
  
)