library(dplyr)
library(readr)

# sum(x)

house <- read_csv('https://jaredlander.com/data/housing.csv')
house

house <- house |>
    select(
        Neighborhood, Class=Building.Classification, Units=Total.Units,
        Year=Year.Built, SqFt=Gross.SqFt,
        Income=Estimated.Gross.Income, Expense=Estimated.Expense,
        Value=Full.Market.Value, Boro
    )
house

house |>
    select(1, 3, 7)
house

house |> select(-Class)

house |>
    select(where(is.character))
house
