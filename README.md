# March-Madness-Speculations-Project
## Author: Kent Dao, Sally Boutaleb, Joshua Chalachew

![image](https://user-images.githubusercontent.com/118495124/226211913-7b106287-ce1f-4a89-b5f8-36347a97f3e9.png)

## Overview:

Every year, March Madness is a big basketball Tournament for colleges from different conference around the USA to compete for the national championship. This Tournament is very important, as it shows who is the best of the best, and giving NBA recruit and basketball player a ground to show their skillset before the Draft. A lot of unkown name make a voice for themself through this tournament with their skillset and putting themself out for a chance to go to the NBA. Since every year, team changes their player, play style and coach, we decide to use the most recent and only 2023 data instead of historical data in this bracket to see which team will win each game and the champion.

### Data set decision:

**1. March Madness 2023 Tournament data**

This dataset have 68 speculations team that might get into the March Madness Tournament for the 2023 season, but at the end, base on the rating and judgement of the comittee, there are some changes that happen and some teams make it further than expected. This data was very useful, but require a lot of changes. This data set has all the rating base on their performance for this year, as every year, the team changes a lot of player.


## Process:

**1. Additional input**

![add new data](https://user-images.githubusercontent.com/118495124/226212055-e75873f2-b23d-4f61-8dc4-22a4f068505b.png)

For March Madness 2023 Tournament data set, we have to include extra 11 teams that was not inside the data sets that made it to March Madness. We go and research on Kenpom and Batrovik websites for these data and put it manually in  

**2. Clean data**

In R, as we already see that there are no N/A columna and all the data are being used in the same unit, we change the name of each column for easier reading and put the teams into the conference where they belong, using the select and filter to put the right column

**3. Separate by each region**

Each region have their own 16 seed ranking base on their potential and how they are performing in the most recent game.

**4. Comparing the teams selected by region** 

First, We created four separate ggplot objects, one for each region's dataframe (South, East, Midwest, and West) with the x-axis representing the sum of offense and the y-axis representing the sum of defense for each team in that region. Then, each ggplot object is customized with a title using the labs() function. Finally, the four plots are combined using the + operator, and arranged in a 2x2 grid using plot_layout(). The resulting output will show a scatter plot for each region, comparing the sum of offense and defense for each team in that region. The grid layout makes it easy to compare the four plots side-by-side.

![103e0389-98ca-4060-b503-da6c81fe1049](https://user-images.githubusercontent.com/118493723/227686037-329b82b2-d5f6-4ad1-b88a-60fb69f39e1d.png)

## Filtering the data:

**1. Sweet 16**

We've filtered the top 4 teams from each region based on their total score calculated from their average defense, offense, and K_average. Then we combined them into a Sweet16 dataframe by using the rbind function to stack the filtered dataframes on top of each other.

<img width="644" alt="Screenshot 2023-03-25 at 5 00 51 PM" src="https://user-images.githubusercontent.com/118493723/227744391-8411a38b-0042-4149-95ae-9887da196298.png">

**2. Boxplot** 

We generated two box plots showing the distribution of average defense and average offense for the Sweet 16 teams by region. 

Together, these two plots provide a visual comparison of the distribution of average defense and average offense across the different regions in the Sweet 16.

![4e7cbe83-2db8-4bd5-82c7-2ffbbcfa276d](https://user-images.githubusercontent.com/118493723/227747178-406e1754-a566-4985-95ae-12939a9f757e.png)

![94a92b95-df16-4aa6-ab7d-53d600dedf35](https://user-images.githubusercontent.com/118493723/227747184-b3bc57e5-da46-4b98-93c7-15b70602c2ec.png)

## The selection process:

Through this series of functions we tried to find the team with the highest value of a given variable ("K_average") in different regions of a sports tournament. The functions take as input a dataframe for each region (south_df, east_df, midwest_df, west_df) and the name of the variable to be evaluated. The output of each function is a message that indicates the winner for that region. Then, we created an empty table called "winners" with columns for names and variables. It adds new observations to the table using rbind to indicate the winners of each region and the finalists of the tournament. 
After that, we created another table called "semi" to indicate the semi-final matches, and another one called "final" to indicate the final match. These tables are also stored in the environment.
Finally, the code uses the dataset "df2" to filter the teams that made it to the semi-finals and finals based on their region and the "K_average" variable. The resulting teams are ordered by their K_average score in decreasing order. Then, through a table called "done" we indicated the winner of the tournament based on the results of the final match; the table is stored in the environment as "the winner".
```r
find_highest_score <- function(south_df, K_average) {
  max_score <- max(south_df[[K_average]])
  highest_score_row <- south_df[south_df[[K_average]] == max_score, "TEAM"]
  cat("The winner in the south by an average of", max_score, "is", highest_score_row, "\n")
}
```
## Call the find_highest_score function with the modulus dataset and the "score" column
find_highest_score(south_df, "K_average")


```r
find_highest_score <- function(east_df, K_average) {
  max_score <- max(east_df[[K_average]])
  highest_score_row <- east_df[east_df[[K_average]] == max_score, "TEAM"]
  cat("The winner in the east by an average of", max_score, "is", highest_score_row, "\n")
}
```
## Call the find_highest_score function with the modulus dataset and the "score" column
find_highest_score(east_df, "K_average")

```r
find_highest_score <- function(midwest_df, K_average) {
  max_score <- max(midwest_df[[K_average]])
  highest_score_row <- midwest_df[midwest_df[[K_average]] == max_score, "TEAM"]
  cat("The winner in the midwest by an average of", max_score, "is", highest_score_row, "\n")
}
```
## Call the find_highest_score function with the modulus dataset and the "score" column
find_highest_score(midwest_df, "K_average")



```r
find_highest_score <- function(west_df, K_average) {
  max_score <- max(west_df[[K_average]])
  highest_score_row <- west_df[west_df[[K_average]] == max_score, "TEAM"]
  cat("The winner in the west by an average of", max_score, "is", highest_score_row, "\n")
}
```
## Call the find_highest_score function with the modulus dataset and the "score" column
find_highest_score(west_df, "K_average")



## Create an empty table with columns for names and variables
winners <- data.frame(name = character(), var1 = character(), stringsAsFactors = FALSE)

## Add new observations to the table using rbind
```r
winners <- rbind(winners, c("winner", "winners"))
winners <- rbind(winners, c("winner of south", "Texas A&M-Corpus Christi"))
winners <- rbind(winners, c("winner of east", "Fairleigh Dickinson"))
winners <- rbind(winners, c("winner of midwest", "Iowa"))
winners <- rbind(winners, c("winner of west", "Gonzaga"))
## Store the table in the environment
assign("winners", winners)

winners <- winners[-1,]
```
#who will face who?
```r
semi <- data.frame(name = character(), var1 = character(), stringsAsFactors = FALSE)
semi<-rbind(semi, c("semi finals","semi finals"))
semi<-rbind(semi, c("first match", "Texas A&M-Corpus Christi vs Iowa"))
semi<-rbind(semi, c("second match","Fairlegh Dickinson vs Gonzaga"))
assign("semi", semi)
semi<-semi[-1,]
```
#comparison
```r
semi_finals<-df2%>%
  filter((TEAM =="Texas A&M-Corpus Christi") | (TEAM =="Iowa") | (TEAM == "Fairleigh Dickinson") | (TEAM == "Gonzaga"))

semi_finals<-semi_finals[order(semi_finals$K_average, decreasing = TRUE),]
```
#finalist
```r
final <- data.frame(name = character(), var1 = character(), stringsAsFactors = FALSE)
final<-rbind(final, c("finals","finals"))
final<-rbind(final, c("final match","Fairlegh Dickinson vs Texas A&M-Corpus Christi"))
assign("final", final)
final<-final[-1,]

finals<-df2%>%
  filter((TEAM =="Texas A&M-Corpus Christi") | (TEAM =="Fairlegh Dickinson"))

done <- data.frame(name = character(), var1 = character(), stringsAsFactors = FALSE)
done<-rbind(done, c("finals","finals"))
done<-rbind(done, c("march madness winner", "Texas A&M-Corpus Christi"))
assign("the winner", done)
done<-done[-1,]

```
# ShinyApp 

This Shiny app allows users to explore a dataset related to March Madness. The app displays a title panel and a header that asks the user to choose which team will win. We chose three select inputs, where users can choose which variables to display on the X and Y axes of a plot and how to split the data by a categorical variable. We, then,  generated a plot and a table based on the user's input. The plot shows the relationship between the two chosen variables, and the table displays the data in a tabular format with the selected variables and split by the categorical variable. 


<img width="906" alt="Screenshot 2023-03-27 at 1 01 57 AM" src="https://user-images.githubusercontent.com/118493723/227853826-ce0852a5-0480-4e2d-aa38-9424aceb663e.png">


