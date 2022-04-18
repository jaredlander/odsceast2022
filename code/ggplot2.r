library(ggplot2)
library(readr)
library(dplyr)

# Get Data ####

house <- read_csv('https://jaredlander.com/data/housing.csv')
house

house <- house |>
    select(
        Neighborhood, Units=Total.Units,
        Year=Year.Built, SqFt=Gross.SqFt,
        Income=Estimated.Gross.Income, Expense=Estimated.Expense,
        Value=Full.Market.Value, Boro
    )

## ggplot2

# Scatterplot ####

ggplot(house)

ggplot(house, aes(x=SqFt, y=ValueSqFt))

ggplot(house, aes(x=SqFt, y=ValueSqFt)) + geom_point()
