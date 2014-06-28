library(shiny)

# Define UI for Body Mass Index
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("Please input your weight and height:"),
        
        sidebarPanel(
                h4("This Shiny App is used to calculate Body Mass Index (BMI) based on input.First 
                   users need to input their weight and height and select the correct unit for both 
                   weight and height on the left panel. Click submit button Calculate BMI. The BMI
                   value will shows in right panel as well as the BMI category. When the app starts
                   , the numbers in the textboxes are 1. These are the initial values. No worry about 
                   it."),
                
                numericInput('weight','Weight',1),
                selectInput("wt_unit", "Weight unit",c("lbs", "kgs")),
                numericInput('height','Height',1),
                selectInput("ht_unit", "Height unit",c("inches", "m")),
                submitButton('Calculate BMI')
        ),
        
        mainPanel(
                h4('Weight you entered:'),
                verbatimTextOutput("weight"),
                h4('Height you entered:'),
                verbatimTextOutput("height"),
                
                h4('Your BMI is '),
                verbatimTextOutput("BMI"),
                h4('Your BMI category:'),
                verbatimTextOutput("BMI_cat")
        )
        
))





