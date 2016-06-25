
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
data("mtcars")
library(caret)

shinyServer(
    function(input, output) {
         fit <- reactive( {
            input$action
            isolate({
                if (length(input$checkGroup) > 0)
                    paste("mpg~am",paste(input$checkGroup,collapse = "+"),sep = "+")
                else
                    'mpg~am'
                })
        })
       
        model <- reactive({lm(as.formula(fit()),data=mtcars)})
        
        output$fit <- renderText({c('NB:as.formula(fit())=lm(',fit(),',data = mtcars)')})
        
        output$modelPlot1 <- renderPlot( {
        input$action
        isolate(plot(model(), which = 1)) }
    )
    output$modelPlot2 <- renderPlot( {
        input$action
        isolate(plot(model(), which = 2))}
    )
    output$modelPlot3 <- renderPlot({ 
        input$action
        isolate(plot(model(), which = 3))}
    )
    output$modelPlot4 <- renderPlot({ 
        input$action
        isolate(plot(model(), which = 4))}
    )
    output$summary <- renderPrint({
        input$action
        isolate(summary(model()))}
    )
})
