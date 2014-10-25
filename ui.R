library(shiny)
##### My project##### 
 
display_prediction <- function() {
  column(10,
      h4('Results of prediction'),
      verbatimTextOutput("team1_winpct_o"),
      verbatimTextOutput("team2_winpct_o")
  )
} 
 
shinyUI(
  fluidPage(
    # Application title
    titlePanel("Baseball Predictions"),
    sidebarLayout(
      sidebarPanel(
        #p("Provide input for the two teams and click on Predict button to find the winning percentage for each team"),
        
        fluidRow(
          column(6,
                 selectInput("team1_name", "Team 1", 
                             choices = c('Arizona Diamondbacks'='ARI','Atlanta Braves'='ATL',
                                         'Baltimore Orioles'='BAL','Boston Redsox'='BOS','Chicago Cubs'='CHC',
                                         'Chicago Whitesox'='CHW','Cincinnati Reds'='CIN','Cleveland Indians'='CLE',
                                         'Colorado Rockies'='COL','Detroit Tigers'='DET','Houston Astros'='HOU',
                                         'Kansas City Royals'='KCR','LA Angels'='LAA','LA Dodgers'='LAD',
                                         'Miami Marlins'='MIA','Milwaukee Brewers'='MIL','Minnesota Twins'='MIN',
                                         'Newyork Mets'='NYM','Newyork Yankees'='NYY','Oakland Athletics'='OAK',
                                         'Philadelphia Phillies'='PHI','Pittsburn Pirates'='PIT','Sandiego Padres'='SDP',
                                         'Seattle Mariners'='SEA','Sanfrancisco Giants'='SFG','St.Louis Cardinals'='STL',
                                         'Tampabay Rays'='TBR','Texas Rangers'='TEX','Toronto Bluejays'='TOR',
                                         'Washington Nationals'='WSN'),selected='ARI'
                 )
          ),
          column(6,
                 selectInput("team2_name", "Team 2", 
                             choices = c('Arizona Diamondbacks'='ARI','Atlanta Braves'='ATL',
                                         'Baltimore Orioles'='BAL','Boston Redsox'='BOS','Chicago Cubs'='CHC',
                                         'Chicago Whitesox'='CHW','Cincinnati Reds'='CIN','Cleveland Indians'='CLE',
                                         'Colorado Rockies'='COL','Detroit Tigers'='DET','Houston Astros'='HOU',
                                         'Kansas City Royals'='KCR','LA Angels'='LAA','LA Dodgers'='LAD',
                                         'Miami Marlins'='MIA','Milwaukee Brewers'='MIL','Minnesota Twins'='MIN',
                                         'Newyork Mets'='NYM','Newyork Yankees'='NYY','Oakland Athletics'='OAK',
                                         'Philadelphia Phillies'='PHI','Pittsburn Pirates'='PIT','Sandiego Padres'='SDP',
                                         'Seattle Mariners'='SEA','Sanfrancisco Giants'='SFG','St.Louis Cardinals'='STL',
                                         'Tampabay Rays'='TBR','Texas Rangers'='TEX','Toronto Bluejays'='TOR',
                                         'Washington Nationals'='WSN'), selected='ATL'
                 )
          )
        ),
        
        fluidRow(
          column(6, numericInput('team1_b_rpg','Runs Scored/Game', 3.80, min = 0.00, max = 100, step = 0.01)),
          column(6, numericInput('team2_b_rpg','Runs Scored/Game', 3.54, min = 0.00, max = 100, step = 0.01))
        ),
        
        fluidRow(
          column(6,numericInput('team1_b_hits','Total Hits', 1379, min = 0, max = 5000, step=1)),
          column(6,numericInput('team2_b_hits','Total Hits', 1316, min = 0, max = 5000, step=1))
        ),
        
        fluidRow(
          column(6,numericInput('team1_b_avg','Batting Avg', 0.248, min = 0.000, max = 1.000, step = 0.001)),
          column(6,numericInput('team2_b_avg','Batting Avg', 0.241, min = 0.000, max = 1.000, step = 0.001))
        ),
        
        fluidRow(
          column(6,numericInput('team1_p_rpg','Runs Given/Game', 4.58, min = 0.00, max = 100, step = 0.01)),
          column(6,numericInput('team2_p_rpg','Runs Given/Game', 3.69, min = 0.00, max = 100, step = 0.01))
        ),
        
        fluidRow(
          column(6,numericInput('team1_p_hits','Total Given Hits', 1467, min = 0, max = 5000, step=1)),
          column(6,numericInput('team2_p_hits','Total Given Hits', 1369, min = 0, max = 5000, step=1))
        ),
        
        fluidRow(
          column(6,numericInput('team1_p_era','Earned Run Avg', 4.26, min = 0.00, max = 100, step = 0.01)),
          column(6,numericInput('team2_p_era','Earned Run Avg', 3.38, min = 0.00, max = 100, step = 0.01))
        ),
        
        fluidRow(
          column(6, submitButton("Predict"))
        )

      ),
      
      mainPanel(
        tabsetPanel(type="tabs",
                    tabPanel("Prediction", display_prediction()), 
                    tabPanel("About", htmlOutput("about_o")),
                    tabPanel("Documentation", htmlOutput("help_o"))
        )
      )
    )
  )
)
