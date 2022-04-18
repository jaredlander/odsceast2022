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

# Add color ####

ggplot(house, aes(x=SqFt, y=ValueSqFt)) + geom_point(aes(color=Year))
ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Year)) + geom_point()

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) + geom_point()

# Point shape and size ####

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(shape=1)

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(shape=1, size=1)

# Deal with overplotting ####

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(shape=1, size=1, alpha=1/3)

# Zoom in ####

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_jitter(shape=1, size=1)

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(shape=1, size=1) +
    scale_x_continuous(limits=c(NA, 1000000))

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(shape=1, size=1) +
    xlim(NA, 1000000)

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(shape=1, size=1) +
    coord_cartesian(xlim=c(NA, 1000000))

# Smoothing Line ####

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(shape=1, size=1) +
    coord_cartesian(xlim=c(NA, 1000000)) +
    geom_smooth()


ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1, aes(color=Boro)) +
    coord_cartesian(xlim=c(NA, 1000000)) +
    geom_smooth()

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1, aes(color=Boro)) +
    coord_cartesian(xlim=c(NA, 1000000)) +
    geom_smooth(color='black') +
    geom_smooth(aes(color=Boro))

# Small Multiples ####

# Trellis
# Facets

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1, aes(color=Boro)) +
    coord_cartesian(xlim=c(NA, 1000000)) +
    geom_smooth(color='black') +
    geom_smooth(aes(color=Boro)) +
    facet_wrap( ~ Boro )

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1, aes(color=Boro), show.legend=FALSE) +
    coord_cartesian(xlim=c(NA, 1000000)) +
    geom_smooth(color='black') +
    geom_smooth(aes(color=Boro), show.legend=FALSE) +
    facet_wrap( ~ Boro )

# Legends ####

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1, aes(color=Boro)) +
    coord_cartesian(xlim=c(NA, 1000000)) +
    geom_smooth(color='black') +
    geom_smooth(aes(color=Boro)) +
    facet_wrap( ~ Boro ) +
    # theme(legend.position='bottom')
    theme(legend.position='none')

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(aes(color=Boro, size=Value, shape=Boro)) +
    coord_cartesian(xlim=c(NA, 1000000)) +
    geom_smooth(color='black') +
    geom_smooth(aes(color=Boro)) +
    facet_wrap( ~ Boro )

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(aes(color=Boro, size=Value, shape=Boro)) +
    coord_cartesian(xlim=c(NA, 1000000)) +
    geom_smooth(color='black') +
    geom_smooth(aes(color=Boro)) +
    facet_wrap( ~ Boro ) +
    scale_color_discrete(guide=NULL) +
    scale_shape(guide=NULL) +
    theme(legend.position='bottom')


# Themes ####

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1, aes(color=Boro)) +
    coord_cartesian(xlim=c(NA, 1000000)) +
    geom_smooth(color='black') +
    geom_smooth(aes(color=Boro)) +
    facet_wrap( ~ Boro ) +
    theme(legend.position='none')

library(ggthemes)

p <- ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1, aes(color=Boro)) +
    coord_cartesian(xlim=c(NA, 1000000)) +
    geom_smooth(color='black') +
    geom_smooth(aes(color=Boro)) +
    facet_wrap( ~ Boro ) +
    theme(legend.position='none')
p

p + theme(legend.position='bottom')

p + theme_economist()
p + theme_economist() + scale_color_economist()

p + theme_stata() + scale_color_stata()

p + theme_excel() + scale_color_excel()
p + theme_excel_new() + scale_color_excel_new()

p


# Histograms and Densities ####

house
ggplot(house, aes(x=ValueSqFt)) +
    geom_histogram()

ggplot(house, aes(x=ValueSqFt)) +
    geom_histogram(bins=10)

ggplot(house, aes(x=ValueSqFt)) +
    geom_histogram(bins=100)

ggplot(house, aes(x=ValueSqFt)) +
    geom_histogram(bins=50)

ggplot(house, aes(x=ValueSqFt)) +
    geom_histogram(binwidth=15)
ggplot(house, aes(x=ValueSqFt)) +
    geom_histogram(binwidth=50)

ggplot(house, aes(x=ValueSqFt)) +
    geom_histogram(binwidth=15)

ggplot(house, aes(x=ValueSqFt, color=Boro)) +
    geom_histogram(binwidth=15)

ggplot(house, aes(x=ValueSqFt, fill=Boro)) +
    geom_histogram(binwidth=15)

ggplot(house, aes(x=ValueSqFt, fill=Boro)) +
    geom_histogram(binwidth=15, show.legend=FALSE) +
    facet_wrap( ~ Boro )

ggplot(house, aes(x=ValueSqFt)) +
    geom_density()

ggplot(house, aes(x=ValueSqFt)) +
    geom_density(aes(fill=Boro))

ggplot(house, aes(x=ValueSqFt)) +
    geom_density(aes(fill=Boro), alpha=1/2)

ggplot(house, aes(x=ValueSqFt)) +
    geom_density(aes(fill=Boro), show.legend=FALSE) +
    facet_wrap( ~ Boro )

ggplot(house, aes(x=ValueSqFt, fill=Boro)) +
    geom_histogram(aes(y=..density..), show.legend=FALSE, binwidth=15) +
    geom_density(show.legend=FALSE) +
    facet_wrap( ~ Boro )

ggplot(house, aes(x=ValueSqFt, fill=Boro)) +
    geom_histogram(aes(y=..density..), show.legend=FALSE, binwidth=15) +
    geom_density(show.legend=FALSE, alpha=1/3) +
    facet_wrap( ~ Boro )

ggplot(house, aes(x=ValueSqFt)) +
    geom_histogram(aes(fill=Boro, y=..density..), binwidth=15, alpha=1/2) +
    geom_density(aes(color=Boro)) +
    facet_wrap( ~ Boro , ncol=2) +
    theme(legend.position='none')

# Barplots ####

house |>
    count(Boro)

ggplot(house |> count(Boro), aes(x=Boro, y=n)) +
    geom_col()

ggplot(house, aes(x=Boro)) +
    geom_bar()

ggplot(house, aes(x=Boro)) +
    geom_bar() +
    geom_label(data=house |> count(Boro), aes(y=n, label=n))
