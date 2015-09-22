library(shiny)

# Define UI for dataset viewer application
shinyUI(
  #pageWithSidebar(
  fluidPage(
    # Application title
    headerPanel("Lakers Analyzer"),
      fluidRow(
        column(4, 
          h4("2008 - 2009 Season"),
          sliderInput('game', 'Select games to analyze', min = 1, max = 78, 
                  value = c(1, 78))
        ),
        column(6,
          h2("Instructions:"),
          p("This application describes the wins and losses of the Los Angeles Lakers in the 2008-2009 season. Adjust the slider to select the games to view. Games are numbered chronologically by date. A win is a game in which the Lakers scored more points than their opponent.")
        )

      ),
      plotOutput('resultPlot')
  )
)

