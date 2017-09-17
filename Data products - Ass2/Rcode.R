rm(list = ls())
setwd("C:/Users/janne/Desktop/R - Coursera/Data products - Ass2")
library(leaflet)
Top10_pops = data.frame(Rank = c(1,2,3,4,5,6,7,8,9,10), Country = c("China","India",
                "U.S","Indonasia","Brazil","Pakistan","Nigeria","Bangladesh","Russia",
                "Mexico"),Polulation = c(1388232693,1342512706,326474013,
                                263510146,211243220,196744376,191835936,
                                164827718,143375006,130222815),lat = c(35.8617,
                                20.5937,37.0902,-0.7893,-14.2350,30.3753,9.0820,23.6850,61.5240,
                                23.6345),lng = c(104.1954,78.9629,-95.7129,113.9213,-51.9253,
                                        69.3451,8.6753,90.3563,105.3188,-102.5528))
head(Top10_pops)
str(Top10_pops)
Top10_pops$Polulation = as.numeric(Top10_pops$Polulation)
Top10_pops$pop = Top10_pops$Polulation/500
Top10_pops %>% 
        leaflet()%>%
        addTiles() %>%
        addMarkers(lat = Top10_pops$lat, lng = Top10_pops$lng,
                   popup = paste(Top10_pops$Rank,Top10_pops$Country,sep = ".")) %>%
        addCircles(weight=1,lat = Top10_pops$lat, lng = Top10_pops$lng,radius=Top10_pops$pop)

