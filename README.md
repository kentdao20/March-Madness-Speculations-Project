# March-Madness-Speculations-Project
# Author: Kent Dao, Sally Boutaleb, Joshua Chalachew

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

**2. Clean data

In R, as we already see that there are no N/A columna and all the data are being used in the same unit, we change the name of each column for easier reading and put the teams into the conference where they belong, using the select and filter to put the right column
