library(shiny)

#                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    4.48e-01   7.46e-02    6.00  1.6e-08 ***
## batting_rpg    9.92e-02   6.60e-03   15.04  < 2e-16 ***
## batting_hits  -2.18e-04   1.37e-04   -1.59  0.11343    
## batting_avg    1.41e+00   9.23e-01    1.53  0.12767    
## pitching_rpg  -9.12e-02   2.56e-02   -3.56  0.00051 ***
## pitching_era  -2.27e-02   2.62e-02   -0.87  0.38753    
## pitching_hits  3.89e-05   4.80e-05    0.81  0.41867    


shinyServer(
  function(input, output) {
    
    output$team1_name_o <- renderPrint({input$team1_name})
    output$team1_b_rpg_o <- renderPrint({input$team1_b_rpg})
    output$team1_b_hits_o <- renderPrint({input$team1_b_hits})
    output$team1_b_avg_o <- renderPrint({input$team1_b_avg})
    output$team1_p_rpg_o <- renderPrint({input$team1_p_rpg})
    output$team1_p_hits_o <- renderPrint({input$team1_p_hits})
    output$team1_p_era_o <- renderPrint({input$team1_p_era})
        
    output$team2_name_o <- renderPrint({input$team2_name})
    output$team2_b_rpg_o <- renderPrint({input$team2_b_rpg})
    output$team2_b_hits_o <- renderPrint({input$team2_b_hits})
    output$team2_b_avg_o <- renderPrint({input$team2_b_avg})
    output$team2_p_rpg_o <- renderPrint({input$team2_p_rpg})
    output$team2_p_hits_o <- renderPrint({input$team2_p_hits})
    output$team2_p_era_o <- renderPrint({input$team2_p_era})

    team1_prediction <- reactive({
                        (4.48e-01) + 
                        (9.92e-02*input$team1_b_rpg) + (-2.18e-04*input$team1_b_hits) + 
                        (1.41e+00*input$team1_b_avg) + (-9.12e-02*input$team1_p_rpg) + 
                        (-2.27e-02*input$team1_p_era) + (3.89e-05*input$team1_p_hits)
    })

    team2_prediction <- reactive({
                        (4.48e-01) + 
                        (9.92e-02*input$team2_b_rpg) + (-2.18e-04*input$team2_b_hits) + 
                        (1.41e+00*input$team2_b_avg) + (-9.12e-02*input$team2_p_rpg) + 
                        (-2.27e-02*input$team2_p_era) + (3.89e-05*input$team2_p_hits)
    })

    team1_winpct <- reactive({
        team1p <- team1_prediction()
        team2p <- team2_prediction()
        100 * team1p/(team1p + team2p)
    })

    team2_winpct <- reactive({
        team1p <- team1_prediction()
        team2p <- team2_prediction()
        100 * team2p/(team1p + team2p)
    })

    output$team1_prediction_o <- renderPrint({
        team1p <- team1_prediction()
        team1p
    })
    
    output$team2_prediction_o <- renderPrint({
      team2p <- team2_prediction()
      team2p
    })

    output$team1_winpct_o <- renderText({
      team1p <- team1_prediction()
      team2p <- team2_prediction()
      paste(input$team1_name,"has", round(100*team1p/(team1p + team2p),2), "percent chance of winning")
    })

    output$team2_winpct_o <- renderText({
      team1p <- team1_prediction()
      team2p <- team2_prediction()
      paste(input$team2_name,"has", round(100*team2p/(team1p + team2p),2), "percent chance of winning")
    })
    
    output$help_o <-renderUI({includeHTML("app_help.html")})
    output$about_o <-renderUI({includeHTML("app_about.html")})
    
    
  }
)
