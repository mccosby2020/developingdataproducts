
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
data("mtcars")
shinyUI(fluidPage(

  # Application title
  titlePanel("Motor Trend Cars Modeler"),
  h6("Application allows users to add variables to fit regression model for mpg by transmision type on the mtcars data."),
  sidebarLayout(
      sidebarPanel(
          checkboxGroupInput("checkGroup",label = "check variables to add",
                         choices = c("cyl" = "cyl", 
                            "hp" = "hp",
                            "wt" = "wt",
                            "disp" = "disp",
                            "drat" = "drat",
                            "gear" = "gear",
                            "carb" = "carb"
                            ),
                            selected = NULL
                         ),
          actionButton("action",label="Submit")
      ),
      mainPanel(
          h1("Model Detail") ,
          verbatimTextOutput('fit'),
          h4("Summary"),
          textOutput('summary'),
          plotOutput('modelPlot1'),
          plotOutput('modelPlot2'),
          plotOutput('modelPlot3'),
          plotOutput('modelPlot4')
          )
      )
  )
)
