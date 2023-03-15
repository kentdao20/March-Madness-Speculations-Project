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
