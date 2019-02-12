library(tidyverse)

## smoothed median home price dataset
zhvi <- read.csv("data/zillow/Neighborhood_Zhvi_AllHomes.csv",stringsAsFactors=FALSE)
## smoothed median neighborhood rent dataset
zri <- read.csv("data/zillow/Neighborhood_Zri_AllHomesPlusMultifamily.csv",stringsAsFactors=FALSE)
## smoothed median rent per square foot dataset
zri_sqft <- read.csv("data/zillow/Neighborhood_ZriPerSqft_AllHomes.csv",stringsAsFactors=FALSE)
## ratio of estimated home value to 12*monthly rent, renters would want this to be smaller
price_to_rent <- read.csv("data/zillow/Neighborhood_PriceToRentRatio_AllHomes.csv",stringsAsFactors=FALSE)


zhvi.sf <- zhvi[zhvi$City=="San Francisco",]
zhvi.sf <- gather(zhvi.sf,date,zhvi,8:ncol(zhvi.sf)) %>%
    mutate(date=str_sub(date,start=2),
           year=str_sub(date,1,4),
           month=str_sub(date,-2,-1)) %>%
    rename(neighborhood=RegionName) %>%
    select(neighborhood,year,month,zhvi)

zri.sf <- zri[zri$City=="San Francisco",]
zri.sf <- zri.sf %>%
    gather(date,zri,8:ncol(zri.sf)) %>%
    mutate(date=str_sub(date,start=2),
           year=str_sub(date,1,4),
           month=str_sub(date,-2,-1)) %>%
    rename(neighborhood=RegionName,city=City) %>%
    select(neighborhood,year,month,zri)

zri_sqft.sf <- zri_sqft[zri_sqft$City=="San Francisco",]
zri_sqft.sf <- zri_sqft.sf %>% 
    gather(date,zri_sqft,8:ncol(zri_sqft)) %>%
    mutate(date=str_sub(date,start=2),
           year=str_sub(date,1,4),
           month=str_sub(date,-2,-1)) %>%
    rename(neighborhood=RegionName) %>%
    select(neighborhood,year,month,zri_sqft)

price_to_rent.sf <- price_to_rent[price_to_rent$City=="San Francisco",]
price_to_rent.sf <- price_to_rent.sf %>%
    gather(date,price_to_rent,8:ncol(price_to_rent.sf)) %>%
    mutate(date=str_sub(date,start=2),
           year=str_sub(date,1,4),
           month=str_sub(date,-2,-1)) %>%
    rename(neighborhood=RegionName) %>%
    select(neighborhood,year,month,price_to_rent)

names(zhvi.sf)
names(zri.sf)
names(zri_sqft.sf)
names(price_to_rent.sf)

sf_housing <- left_join(zhvi.sf,zri.sf,by=c("neighborhood","year","month")) %>%
    left_join(.,zri_sqft.sf,by=c("neighborhood","year","month")) %>%
    left_join(.,price_to_rent.sf,by=c("neighborhood","year","month"))

sf_housing$year <- as.integer(sf_housing$year)
sf_housing$month <- as.integer(sf_housing$month)

sf_housing.yearly <- sf_housing %>%
    group_by(neighborhood,year) %>%
    summarize(mean.zhvi=mean(zhvi,na.rm=TRUE),
              mean.zri=mean(zri,na.rm=TRUE),
              mean.zri_sqft=mean(zri_sqft,na.rm=TRUE),
              mean.price_to_rent=mean(price_to_rent,na.rm=TRUE))

