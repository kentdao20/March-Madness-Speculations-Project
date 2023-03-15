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

#setwd("C:/Data 332 project 2/March-Madness-Speculations-Project")
#setwd("D:/DATA 332/Github Project 1/March-Madness-Speculations-Project")
setwd("~/Desktop/DATA 332/March-Madness-Speculations-Project")

#opened the csv file and proceeded in the data cleaning process

df<-read.csv("2023 Tournament Data.csv")%>%
  
  select(TEAM, KENPOM.ADJUSTED.EFFICIENCY)

colnames
df<-read.csv("2023 Tournament Data.csv")
colnames(6)<-"K efficiency"
colnames(7)<-"K offense"
colnames(8)<-"K defense"
colnames(9)<-"K tempo"
colnames(10)<-"B efficiency"
colnames(11)<-"B offense"
colnames(12)<-"B defense"
colnames(13)<-"B tempo"

#select(TEAM, KENPOM.ADJUSTED.EFFICIENCY,KENPOM.ADJUSTED.OFFENSE, KENPOM.ADJUSTED.DEFENSE, KENPOM.ADJUSTED.TEMPO, BAR.ADJUSTED.EFFICIENCY)