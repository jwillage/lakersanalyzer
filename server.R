library(lubridate)
library(ggplot2)
library(dplyr)
#library(reshape2)


data(lakers)

#filter data to only scoring plays, group by game (date) and sum the points.
#this will give us a new column, 'total', which is the total score for each team
scores <- lakers %>% filter(team != 'OFF') %>% group_by(date, team) %>% 
  summarize(total = sum(points))

#make teams factor and relevel. This will allow LAL to always be first in chart
scores$team <- as.factor(scores$team)
scores$team <- relevel(scores$team, 'LAL')

#add a game id for each game. This is easier to work with than the date
scores$game <- rep(1 : (nrow(scores)/2), each = 2)

#make lakers the first team so they are always the same column when broken out
# scores.newteam <- scores
# scores.newteam$team <- gsub('LAL', '_LAL', scores$team)
# scores.newteam <- scores.newteam[order(scores.newteam$date, scores.newteam$team),]
# scores.newteam <- aggregate(scores$total, by = list(scores$game), FUN=head, 2)
# names(scores.newteam) <- c("game", "lakers", "opp")


#create vector of each team's primary color for graph display
team.colors = c(ATL = "#e13a3e", BOS = "#008348", CHA = "#008ca8", 
                CHI = "#ce1141", CLE = "#860038", DAL = "#007dc5", 
                DEN = "#4d90cd", DET = "#ed174c", GSW = "#fdb927", 
                HOU = "#ce1141", IND = "#ffc633", LAC = "#ed174c", 
                LAL = "#552582", MEM = "#7399c6", MIA = "#98002e", 
                MIL = "#00471b", MIN = "#005083", NJN = "#2226A8",
                NOH = "#49CBF2", NYK = "#f58426", OKC = "#007dc3", 
                ORL = "#c4ced3", PHI = "#ed174c", PHX = "#e56020", 
                POR = "#e03a3e", SAC = "#724c9f", SAS = "#bac3c9", 
                TOR = "#ce1141", UTA = "#663C82", WAS = "#002b5c")

shinyServer(
  function(input, output, session) {
    output$resultPlot <- renderPlot({
      
      #subset the scores df to only the games selected in the slider
      scores.subset <- subset(scores, 
                              game >= input$game[1] & game <= input$game[2])
      
      #n<-nPlot(total ~ game, group = 'team', type = 'multiBarChart', data = scores.subset)
      #n
      
      g <- ggplot(scores.subset, aes(x = game, y=total, fill=team)) + 
        geom_bar(stat = "identity", position = "dodge") + 
        scale_fill_manual(values = team.colors) +
        labs(title = 'Points scored by game', x = 'Game Number', y = 'Points')
      g
    })
  }
)
