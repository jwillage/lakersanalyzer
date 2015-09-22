---
title       : Lakers Analyzer
subtitle    : 
author      : J. Willage
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Problem Background




- The `lakers` dataset that comes with the lubridate R package contains all the 
play-by-play information of the Lakers 2008-2009 season.  
- The Lakers won the NBA Championship this season, so it would be useful to 
analyze this data to see what makes for an NBA champion.  
- The data contains 34,624 rows and is not useful in this state for 
analysis over a season.


```r
head(lakers, 3)
```

```
##       date opponent game_type  time period     etype team
## 1 20081028      POR      home 12:00      1 jump ball  OFF
## 2 20081028      POR      home 11:39      1      shot  LAL
## 3 20081028      POR      home 11:37      1   rebound  LAL
##                player result points type  x  y
## 1                                 0      NA NA
## 2           Pau Gasol missed      0 hook 23 13
## 3 Vladimir Radmanovic             0  off NA NA
```

---  

## Context/Technical Background

- The app uses the dplyr package to get the dataset into a usable format.  
- The total points are calculated as a sum for each team per date.  

```
## Source: local data frame [6 x 3]
## Groups: date
## 
##       date team total
## 1 20081028  LAL    96
## 2 20081028  POR    76
## 3 20081029  LAC    79
## 4 20081029  LAL   117
## 5 20081101  DEN    97
## 6 20081101  LAL   104
```
- A ggplot bargraph is output based on the user's selection of games, which
showcases the Lakers and their opponents points for that game.

--- 

## Solution

- The Lakers Analyzer app lets the user explore the Lakers 2008-2009 season on a 
game by game basis.
- The app allows the user to view the score of each Lakers game, looking for 
trends as the season progresses.

![width](assets/img/screenshot.png)

--- .class #id 

## Conclusions

- With a better understanding of how the Lakers performed over the season, an
analyst can drill into a particular trend to explore.
- For instance, we can see that the team started off the season with a 13 - 1
run. Now we can use further analysis techniques to see what the Lakers did in
those first 14 games and try to replicate that performance. 
