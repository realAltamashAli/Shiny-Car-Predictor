library(shiny)
library(ggplot2)

# Global data prep
data(mtcars)
mtcars$cyl <- as.factor(mtcars$cyl)
fit <- lm(mpg ~ hp + wt + cyl, data = mtcars)

shinyServer(function(input, output) {
  
  # Reactive MPG Prediction
  pred_mpg <- reactive({
    predict(fit, newdata = data.frame(
      hp = input$hp,
      wt = input$wt,
      cyl = factor(input$cyl, levels = c("4", "6", "8"))
    ))
  })
  
  output$mpg_val <- renderText({
    paste(round(pred_mpg(), 2), "MPG")
  })
  
  # Reactive Cost Calculation
  output$cost_val <- renderText({
    cost <- (input$dist / pred_mpg()) * input$price
    paste("$", round(cost, 2))
  })
  
  # Visualization
  output$plot <- renderPlot({
    ggplot(mtcars, aes(x = hp, y = mpg)) +
      geom_point(aes(color = cyl), size = 3) +
      geom_hline(yintercept = pred_mpg(), color = "red", linetype = "dashed") +
      labs(title = "HP vs MPG (Red line = Your Prediction)", x = "Horsepower", y = "MPG") +
      theme_minimal()
  })
})