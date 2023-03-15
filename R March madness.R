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
#colnames(13)<-"B-tempo"

df2<-df%>%
  select(K_efficiency,K_offense,K_defense,K_tempo,B_efficiency,B_offense,B_defense)
