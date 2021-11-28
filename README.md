popsheff
================

# Overview

popsheff is an R package containing population data for Sheffield.

# Installation

You can install the development version from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("scc-pi/popsheff")
```

If you work for Sheffield City Council you can install the binary
package from:

S:\\BI Team\\ShareToAll\\RPackages

Using RStudio you can does this via the *Tools \> Install packages…*
menu.

# Population data frames

``` r
library(popsheff)
```

## LA (Local Authority) level

### pop_la_yrs

``` r
head(pop_la_yrs)
```

    ##   Year Population
    ## 1 2020     589214
    ## 2 2019     584853
    ## 3 2018     582506
    ## 4 2017     577789
    ## 5 2016     574050
    ## 6 2015     569177

### pop_la_median_age

``` r
head(pop_la_median_age)
```

    ##   Year Median age
    ## 1 2020      35.28
    ## 2 2019      35.39
    ## 3 2018      35.40
    ## 4 2017      35.56
    ## 5 2016      35.73
    ## 6 2015      35.84

### pop_la_age

``` r
head(pop_la_age)
```

    ##        Age Persons
    ## 1 All ages  589214
    ## 2        0    5922
    ## 3        1    6095
    ## 4        2    6403
    ## 5        3    6643
    ## 6        4    6714

### pop_la_age_male

``` r
head(pop_la_age_male)
```

    ##        Age  Males
    ## 1 All ages 293715
    ## 2        0   3026
    ## 3        1   3123
    ## 4        2   3218
    ## 5        3   3375
    ## 6        4   3452

### pop_la_age_female

``` r
head(pop_la_age_female)
```

    ##        Age Females
    ## 1 All ages  295499
    ## 2        0    2896
    ## 3        1    2972
    ## 4        2    3185
    ## 5        3    3268
    ## 6        4    3262

## LSOA level

### pop_lsoa_age_band

``` r
head(pop_lsoa_age_band)
```

    ##   LSOA Code      LSOA Name Age band Population
    ## 1 E01007823 Sheffield 069A All Ages       1678
    ## 2 E01007823 Sheffield 069A     0-15        285
    ## 3 E01007823 Sheffield 069A    16-29        246
    ## 4 E01007823 Sheffield 069A    30-44        293
    ## 5 E01007823 Sheffield 069A    45-64        462
    ## 6 E01007823 Sheffield 069A      65+        392
