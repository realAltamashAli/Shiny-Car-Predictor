# Vehicle Fuel Efficiency Predictor
### Developing Data Products - Course Project

This repository contains the source code for a Shiny Application that predicts vehicle fuel efficiency (MPG) based on user-defined parameters.

## Links
- `Live Application  :`  [View App on Shinyapps.io](https://altamashali.shinyapps.io/FuelPredictor/)
- `Pitch Deck        :`  [View Presentation on RPubs](http://rpubs.com/realAltamashAli/Shiny-Car-Predictor)

## Project Overview
The application uses a linear regression model trained on the `mtcars` dataset to estimate a car's MPG. It features:
- `Interactive Inputs    :  ` Adjust horsepower, weight, and cylinder count.
- `Reactive Calculations :  ` Real-time updates for predicted MPG and estimated trip costs.
- `Dynamic Visualization :  ` A plot comparing the user's input against historical data trends.

## Files
- `ui.R      :`  Handles the user interface, sidebar layout, and themes.
- `server.R  :` Contains the logic for the linear regression model and reactive outputs.

## How to Run Locally
To run this application on your machine, clone this repository and run the following in R:
```R
library(shiny)
runApp()
```
