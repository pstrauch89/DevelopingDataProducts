# loading libraries
library(shiny)
library(dplyr)
library(markdown)

# building UI - page with 2 tabs
shinyUI(navbarPage("Automobile catalog filter",
      
      # 1st tab of page                        
      tabPanel("Analysis",
               # left side of page
               sidebarPanel(
                     h2("Project Assignment", align = "center"),
                     h3("by Peter Strauch", align = "center"),
                     
                     sliderInput("horses", 
                                 label = "Range of horsepower:",
                                 min = 50, max = 350, value = c(50,350), 
                                 step = 5, post = " hp"),
                     
                     uiOutput("cylsOutput")
               ),
               
               # right side of page - with 2 tabs
               mainPanel(tabsetPanel(
                     # 1st tab of 1st page tab
                     tabPanel("Plot", 
                              plotOutput("graph")),
                     
                     # 2nd tab of 1st page tab
                     tabPanel("Table", 
                              tableOutput("table"),
                              downloadButton("downloadData", "Download filtered data"))
               ))
      ), 
      
      # 2nd tab of page
      tabPanel("About", 
               mainPanel(includeMarkdown("README.md")))
))