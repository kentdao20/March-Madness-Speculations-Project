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

df<-read.csv("2023 Tournament Data.csv")%>%
  select(TEAM, KENPOM ADJUSTED EFFICIENCY)