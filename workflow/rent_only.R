

```{r}
ggplot(filter(sf_housing.yearly,year>=2010),aes(x=zri_sqft)) +
    geom_histogram(fill="skyblue3",bins=25) +
    plotTheme() +
    scale_x_continuous(labels=dollar_format(prefix="$")) +
    labs(title="Distribution of neighborhood rent per square foot",
         subtitle="2010-2018 Zillow Rent Indices",
         x="Monthly rent per square foot",
         y="Freq")
```

```{r}
max(sf_housing.yearly$zri_sqft,na.rm=T)
```
