# loading libraries
library(shiny)
library(dplyr)
library(markdown)

# loading and processing data
data <- data.frame(mtcars)
data$name <- rownames(data)
data <- cbind(data[12], data[,1:11])

# output depended on inputs
shinyServer(
      function(input, output) {
            
            # calculating factors for input
            output$cylsOutput <- renderUI({
                  checkboxGroupInput(inputId = "cylsInput", 
                                     label = "Number of cylinders:", 
                                     choices = as.numeric(levels(factor(data$cyl))),
                                     selected = c(4,8))
            })

            # reactive table
            tab <- reactive({
                  if (is.null(input$cylsInput)) {return(NULL)}

                  arrange(data %>%
                                filter(hp >= input$horses[1],
                                       hp <= input$horses[2],
                                       cyl == as.numeric(input$cylsInput[1])|
                                       cyl == as.numeric(input$cylsInput[2])|
                                       cyl == as.numeric(input$cylsInput[3])),
                          name)
            })
            
            # download dataset
            output$downloadData <- downloadHandler(
                  filename = "dataset.csv",
                  content = function(file) {
                        write.csv(tab(), file)})
                  
            # plot with regression line and correlation
            output$graph <- renderPlot({
                  if (is.null(tab())) {return()}
                  
                  model <- lm(mpg ~ wt, data = tab())
                  r <- round(cor(tab()$mpg, tab()$wt, method = "pearson"), digits = 2)

                  plot(tab()$wt, tab()$mpg,
                       xlab = "Weight (1000 lbs)",
                       ylab = "Miles / gallon(US)",
                       col = "red", pch = 19,
                       main = "Plot of cars with linear regression", 
                       xlim = c(1,6), ylim = c(10,35))
                  abline(model, col = "blue", lwd = 1)
                  legend("topright", "trendline", col = "blue", lwd = 1)
                  text(5.5, 31, paste("y =", 
                                      round(model$coefficients[[1]], digits = 2), "x + (", 
                                      round(model$coefficients[[2]], digits = 2), ")"))
                  text(5.5, 29, paste("r = ", r))
                  
            })
            
            # filtred table
            output$table <- renderTable({
                  tab()
            })
            
      }
)