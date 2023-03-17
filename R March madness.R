#Group: Kent, Josh, Sally
library(tidyverse)
library(tidytext)
library(textdata)
library(janeaustenr)
library(dplyr)
library(stringr)
library(reshape2)
library(shiny)
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
  select(TEAM, K_efficiency,K_offense,K_defense,K_tempo,B_efficiency,B_offense,B_defense,B_tempo)

south_df <- df2%>%
  dplyr::filter(TEAM == "Alabama")
df2$sum_efficiency<-as.numeric(df2$K_efficiency)+ as.numeric(df2$B_efficiency)
df2$average_efficiency<-df2$sum_efficiency/2  
df2$sum_offense<-as.numeric(df2$K_offense)+ as.numeric(df2$B_offense)
df2$average_offense<-df2$sum_offense/2
df2$sum_defense<-as.numeric(df2$K_defense)+ as.numeric(df2$B_defense)
df2$average_defense<-df2$sum_defense/2
df2$sum_tempo<-as.numeric(df2$K_tempo)+ as.numeric(df2$B_tempo)
df2$average_tempo<-df2$sum_tempo/2
df2$all_average<-(df2$average_efficiency+df2$average_offense+df2$average_defense+df2$average_tempo)/2
#comparing them by offense
df3<-df2[order(df2$average_offense, decreasing = TRUE),]

#comparing them by defense
#df4<-df2[order(df2$average_defense, decreasing = TRUE),]

#comparing them by all average
#df5<-df2[order(df2$all_average, decreasing = TRUE),]
  


