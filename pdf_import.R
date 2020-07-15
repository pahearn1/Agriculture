#install.packages("pdftools")
#install.packages("tidyverse")
library(pdftools)
library(tidyverse)
library(ggplot2)

PDF=pdf_text("ANPP_county_stats_1981-2018.pdf") %>% 
  readr::read_lines()

PDF=PDF[-c(1:2)]
PDF=PDF[-c(33:33)]
PDF=PDF[-c(67:67)]
PDF=PDF[-c(79:87)]
PDF=PDF[-c(92:92)]
PDF=PDF[-c(111:151)]
PDF=PDF[-c(120:120)]
PDF=PDF[-c(124:311)]

all_county = PDF[1:133] %>%
  str_squish() %>%
  strsplit(split = " ")

all_county[[111]]=all_county[[111]][-3]
all_county[[112]]=all_county[[112]][-3]
all_county[[113]]=all_county[[113]][-3]
all_county[[114]]=all_county[[114]][-3]
all_county[[115]]=all_county[[115]][-3]
all_county[[116]]=all_county[[116]][-3]
all_county[[117]]=all_county[[117]][-3]
all_county[[118]]=all_county[[118]][-3]
all_county[[119]]=all_county[[119]][-3]
all_county[[120]]=all_county[[120]][-3]
all_county[[121]]=all_county[[121]][-3]
all_county[[122]]=all_county[[122]][-3]
all_county[[123]]=all_county[[123]][-3]
all_county[[111]][2] ="New_Mexico" 
all_county[[112]][2] ="New_Mexico"
all_county[[113]][2] ="New_Mexico"
all_county[[114]][2] ="New_Mexico"
all_county[[115]][2] ="New_Mexico"
all_county[[116]][2] ="New_Mexico"
all_county[[117]][2] ="New_Mexico"
all_county[[118]][2] ="New_Mexico"
all_county[[119]][2] ="New_Mexico"
all_county[[120]][2] ="New_Mexico"
all_county[[121]][2] ="New_Mexico"
all_county[[122]][2] ="New_Mexico"
all_county[[123]][2] ="New_Mexico"

df <- plyr::ldply(all_county) #create a data frame
head(df)

names(df) =c("FIPS","State","County","Years","mean_ANPP","median_ANPP","minYear","min_ANPP","maxYear","max_ANPP")

df$mean_ANPP=as.integer(df$mean_ANPP)
df$median_ANPP=as.integer(df$median_ANPP)
df$min_ANPP=as.integer(df$min_ANPP)
df$max_ANPP=as.integer(df$max_ANPP)

ggplot(data = df[1:24,],aes(x=reorder(County,-median_ANPP),y=median_ANPP))+geom_bar(stat = "identity",fill="skyblue",alpha=.7)+geom_errorbar( aes(x=County, ymin=min_ANPP, ymax=max_ANPP), width=0.4, colour="orange", alpha=0.9, size=1.3)+ggtitle("Colorado")
  

ggplot(data = df[51:78,],aes(x=reorder(County,-median_ANPP),y=median_ANPP))+geom_bar(stat = "identity",fill="skyblue",alpha=.7)+geom_errorbar( aes(x=County, ymin=min_ANPP, ymax=max_ANPP), width=0.4, colour="orange", alpha=0.9, size=1.3)+ggtitle("Kansas")

ggplot(data = df[79:110,],aes(x=reorder(County,-median_ANPP),y=median_ANPP))+geom_bar(stat = "identity",fill="skyblue",alpha=.7)+geom_errorbar( aes(x=County, ymin=min_ANPP, ymax=max_ANPP), width=0.4, colour="orange", alpha=0.9, size=1.3)+ggtitle("Montana")

ggplot(data = df[111:123,],aes(x=reorder(County,-median_ANPP),y=median_ANPP))+geom_bar(stat = "identity",fill="skyblue",alpha=.7)+geom_errorbar( aes(x=County, ymin=min_ANPP, ymax=max_ANPP), width=0.4, colour="orange", alpha=0.9, size=1.3)+ggtitle("New Mexico")
