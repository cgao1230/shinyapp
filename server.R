library(shiny)
library(datasets)

shinyServer(function(input, output) {
        
        output$weight <- renderPrint({input$weight})
        output$height <- renderPrint({input$height})
        a <- reactive ({ if (input$wt_unit == 'lbs') { input$weight/2.205 }
        else { input$weight }
        })
        
        b <- reactive ({ if (input$ht_unit == 'inches') { 0.0254*input$height }
        else { input$height }
        })
        output$BMI <- renderText({ a() / (b() * b() ) })
        output$BMI_cat <- renderText({
                if (a() / (b() * b()) <= 18.5) "underweight"
                else if (a() / (b() * b()) >18.5 & a() / (b() * b()) <= 24.9) "normal"
                else if (a() / (b() * b()) >24.9 & a() / (b() * b()) <= 30) "overweight"
                else "obesity"
        })
})