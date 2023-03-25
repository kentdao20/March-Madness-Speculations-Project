#Group: Kent, Josh, Sally
library(tidyverse)
library(tidytext)
library(textdata)
#library(janeaustenr)
library(dplyr)
library(stringr)
library(reshape2)
library(shiny)
library(ggplot2)
library(patchwork)
rm(list=ls())

setwd("C:/Data 332 project 2/March-Madness-Speculations-Project")
#setwd("D:/DATA 332/Github Project 1/March-Madness-Speculations-Project")
#setwd("~/Desktop/DATA 332/March-Madness-Speculations-Project")

#opened the csv file and proceeded in the data cleaning process

df<-read.csv("2023 Tournament Data.csv")
colnames(df)[6]<-"K_efficiency"
colnames(df)[7]<-"K_offense"
colnames(df)[8]<-"K_defense"
colnames(df)[9]<-"K_tempo"
colnames(df)[10]<-"B_efficiency"
colnames(df)[11]<-"B_offense"
colnames(df)[12]<-"B_defense"
colnames(df)[15]<-"B_tempo"


df2<-df%>%
  select(SEED, TEAM, K_efficiency,K_offense,K_defense,K_tempo,B_efficiency,B_offense,B_defense,B_tempo)

#I added seed so we can know which team is which seed, but we need to fix since there has been ranking changes


#df2$sum_efficiency<-as.numeric(df2$K_efficiency)+ as.numeric(df2$B_efficiency)
#df2$average_efficiency<-df2$sum_efficiency/2  
df2$sum_offense<-as.numeric(df2$K_offense)
df2$average_offense<-df2$sum_offense
df2$sum_defense<-as.numeric(df2$K_defense)
df2$average_defense<-df2$sum_defense
#df2$sum_tempo<-as.numeric(df2$K_tempo)+ as.numeric(df2$B_tempo)
#df2$average_tempo<-df2$sum_tempo/2
df2$K_average<-(df2$average_offense+df2$average_defense)/2


#1st: We will only take average of off and def
#2nd: We will compare  their tempo and ...

south_df <- df2%>%
  
  filter((TEAM == "Alabama") | (TEAM =="Texas A&M-Corpus Christi") | (TEAM == "Maryland") | (TEAM == "West Virginia") | (TEAM == "San Diego State") | 
           (TEAM == "College of Charleston") | (TEAM == "Virginia") | (TEAM == "Furman") | (TEAM == "Creighton") | (TEAM == "North Carolina State") | 
           (TEAM == "Baylor") | (TEAM =="UCSB") | (TEAM == "Missouri") | (TEAM == "Utah St.") | (TEAM == "Arizona") | (TEAM == "Princeton"))

east_df <- df2%>%
  filter((TEAM == "Purdue")|(TEAM == "Fairleigh Dickinson")|(TEAM == "Memphis")|(TEAM == "Duke")|
           (TEAM == "Oral Roberts")|(TEAM == "Florida Atlantic")|(TEAM == "Tennessee")|(TEAM == "Louisiana")|
           (TEAM == "Kentucky")|(TEAM == "Providence")|(TEAM == "Kansas State")|(TEAM == "Montana")|
           (TEAM == "Michigan State")|(TEAM == "USC")|(TEAM == "Marquette")|(TEAM == "Vermont"))

#Compare by efficiency as it is the best scale, not the average rating
midwest_df <- df2%>%
  filter((TEAM == "Houston")|(TEAM == "Northern Ky.")|(TEAM == "Iowa")|(TEAM == "Auburn")|
           (TEAM == "Miami (FLA.)")|(TEAM == "Drake")|(TEAM == "Indiana")|(TEAM == "Kent St.")|
           (TEAM == "Iowa State")|(TEAM == "Pittsburgh")|(TEAM == "Xavier")|(TEAM == "Kennesaw St.")|
           (TEAM == "Texas A&M")|(TEAM == "Penn St.")|(TEAM == "Texas")|(TEAM == "Colgate"))

west_df<- df2%>%
  filter((TEAM == "Kansas")|(TEAM == "Howard")|(TEAM == "Arkansas")|(TEAM == "Illinois")|
           (TEAM == "Iona")|(TEAM == "Connecticut")|(TEAM == "VCU")|(TEAM == "St. Mary's (CA)")|
           (TEAM == "TCU")|(TEAM == "Arizona State")|(TEAM == "Gonzaga")|(TEAM == "Grand Canyon")|
           (TEAM == "UNC Asheville")|(TEAM == "UCLA")|(TEAM == "Boise State")|(TEAM == "Northwestern"))

#comparing them by efficiency
df3<-df2[order(df2$average_offense, decreasing = TRUE),]

#ggplot for south, east, Midwest, and west df to compare the sum offense and defense for each region's teams

p1 <- ggplot(south_df, aes(x = sum_offense, y = sum_defense)) +
  geom_point() +
  labs(title = "offense vs defense for South Region Teams")

p2 <- ggplot(east_df, aes(x = sum_offense, y = sum_defense)) +
  geom_point() +
  labs(title = "offense vs defense for East Region Teams")

p3 <- ggplot(midwest_df, aes(x = sum_offense, y = sum_defense)) +
  geom_point() +
  labs(title = "offense vs defense for Midwest Region Teams")

p4 <- ggplot(west_df, aes(x = sum_offense, y = sum_defense)) +
  geom_point() +
  labs(title = "offense vs defense for West Region Teams")

p1 + p2 + p3 + p4 + plot_layout(ncol = 2, nrow = 2)

#making the sweet 16 list 

#filtering east region 
east_df$total_score <- rowSums(east_df[, c("average_defense", "average_offense", "K_average")])
Top4_east <- head(east_df[order(-east_df$total_score),], 4)

#filtering west region 
west_df$total_score <- rowSums(west_df[, c("average_defense", "average_offense", "K_average")])
Top4_west <- head(east_df[order(-west_df$total_score),], 4)

#filtering Midwest region 
midwest_df$total_score <- rowSums(midwest_df[, c("average_defense", "average_offense", "K_average")])
Top4_midwest <- head(midwest_df[order(-midwest_df$total_score),], 4)

#filtering south region 
south_df$total_score <- rowSums(south_df[, c("average_defense", "average_offense", "K_average")])
Top4_south <- head(south_df[order(-south_df$total_score),], 4)

Sweet16 <- rbind(Top4_east, Top4_south, Top4_west, Top4_midwest)

df_sweet16 <- Sweet16 %>%
  select(SEED, TEAM, average_defense, average_offense, K_average, total_score)

df_sweet16$region <- c(rep("East", 4), rep("West", 4), rep("Midwest", 4), rep("South", 4))
 
#boxplot of average defense for each region 
ggplot(df_sweet16, aes(x = region, y = average_defense)) +
  geom_boxplot() +
  labs(x = "Region", y = "Average Defense",
       title = "Box Plot of Average Defense by Region in Sweet 16") +
  theme_bw()


#boxplot of average offense for each region  
ggplot(df_sweet16, aes(x = region, y = average_offense)) +
  geom_boxplot() +
  labs(x = "Region", y = "Average offense",
       title = "Box Plot of Average offense by Region in Sweet 16") +
  theme_bw()


find_highest_score <- function(south_df, K_average) {
  max_score <- max(south_df[[K_average]])
  highest_score_row <- south_df[south_df[[K_average]] == max_score, "TEAM"]
  cat("The winner in the south by an average of", max_score, "is", highest_score_row, "\n")
}

# Call the find_highest_score function with the modulus dataset and the "score" column
find_highest_score(south_df, "K_average")



find_highest_score <- function(east_df, K_average) {
  max_score <- max(east_df[[K_average]])
  highest_score_row <- east_df[east_df[[K_average]] == max_score, "TEAM"]
  cat("The winner in the east by an average of", max_score, "is", highest_score_row, "\n")
}

# Call the find_highest_score function with the modulus dataset and the "score" column
find_highest_score(east_df, "K_average")


find_highest_score <- function(midwest_df, K_average) {
  max_score <- max(midwest_df[[K_average]])
  highest_score_row <- midwest_df[midwest_df[[K_average]] == max_score, "TEAM"]
  cat("The winner in the midwest by an average of", max_score, "is", highest_score_row, "\n")
}

# Call the find_highest_score function with the modulus dataset and the "score" column
find_highest_score(midwest_df, "K_average")




find_highest_score <- function(west_df, K_average) {
  max_score <- max(west_df[[K_average]])
  highest_score_row <- west_df[west_df[[K_average]] == max_score, "TEAM"]
  cat("The winner in the west by an average of", max_score, "is", highest_score_row, "\n")
}

# Call the find_highest_score function with the modulus dataset and the "score" column
find_highest_score(west_df, "K_average")



# Create an empty table with columns for names and variables
#south_winner <- data.frame(name = character(), var1 = character(), stringsAsFactors = FALSE)

# Add new observations to the table using rbind
#south_winner <- rbind(south_winner, c("winner", "Texas_am"))
#south_winner <- rbind(south_winner, c("winner", "value3"))

# Store the table in the environment
#assign("south_winner", south_winner)
