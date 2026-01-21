library(shiny)
library(shinythemes)

# Using your preferred 'flatly' theme for a professional look
shinyUI(navbarPage(
  theme = shinytheme("flatly"),
  "Fuel Economy Predictor",
  
  # Main App Tab
  tabPanel("App",
           sidebarLayout(
             sidebarPanel(
               h4("Vehicle Specifications"),
               sliderInput("hp", "Gross Horsepower:", 50, 340, 110),
               numericInput("wt", "Weight (1000 lbs):", 3.0, min=1, max=6, step=0.1),
               radioButtons("cyl", "Cylinders:", c("4" = 4, "6" = 6, "8" = 8), inline = TRUE),
               hr(),
               h4("Trip Parameters"),
               numericInput("dist", "Trip Distance (miles):", 100),
               numericInput("price", "Gas Price ($/gal):", 3.50)
             ),
             mainPanel(
               h3("Calculation Results"),
               wellPanel(
                 h4("Predicted Fuel Efficiency:"),
                 textOutput("mpg_val"),
                 h4("Estimated Trip Cost:"),
                 textOutput("cost_val")
               ),
               plotOutput("plot")
             )
           )
  ),
  
  # Documentation Tab (Rubric Requirement)
  tabPanel("Instructions & Documentation",
           mainPanel(
             h2("About this Application"),
             p("This app predicts a vehicle's Miles Per Gallon (MPG) based on its specs using a linear regression model."),
             h3("How to use:"),
             tags$ol(
               tags$li("Use the sidebar to input the vehicle's Horsepower, Weight, and Cylinders."),
               tags$li("Adjust the 'Trip Parameters' to see how much a specific drive will cost."),
               tags$li("Results update automatically (reactively) in the main panel.")
             ),
             h3("Methodology:"),
             p("The model is trained on the standard 'mtcars' dataset. The prediction formula used is:"),
             helpText("$$MPG = \beta_0 + \beta_1(HP) + \beta_2(WT) + \beta_3(CYL)$$")
           )
  )
))