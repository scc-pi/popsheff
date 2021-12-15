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
package for Windows from:

> S:\\BI Team\\ShareToAll\\RPackages

Using RStudio you can does this via the *Tools \> Install packages…*
menu.

# Source & format

The data is from ONS. It has has been transformed into a [tidy
data](https://r4ds.had.co.nz/tidy-data.html) format (or a tidier, longer
format) so it is ready to use with
[tidyverse](https://www.tidyverse.org/) R packages.

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

### pop_la_yrs_age_gender

``` r
head(pop_la_yrs_age_gender)
```

    ##   Gender Age Year Persons
    ## 1      M   0 2001    2777
    ## 2      M   0 2002    2846
    ## 3      M   0 2003    2828
    ## 4      M   0 2004    3131
    ## 5      M   0 2005    3175
    ## 6      M   0 2006    3124

## LAC (Local Area Committee) level

LAC boundaries are the same as ASC (Adult Social Care) localities.

### pop_lac_age

``` r
head(pop_lac_age)
```

    ##      ca_name ca_number   asc_name Age Persons
    ## 1    Central         3 Locality 5   0     684
    ## 2       East         4 Locality 6   0    1058
    ## 3      North         1 Locality 1   0     613
    ## 4 North East         2 Locality 2   0    1271
    ## 5      South         7 Locality 4   0    1037
    ## 6 South East         5 Locality 7   0     679

### pop_lac_age_male

``` r
head(pop_lac_age_male)
```

    ##      ca_name ca_number   asc_name .groups Age Males
    ## 1    Central         3 Locality 5    drop   0   344
    ## 2       East         4 Locality 6    drop   0   517
    ## 3      North         1 Locality 1    drop   0   337
    ## 4 North East         2 Locality 2    drop   0   647
    ## 5      South         7 Locality 4    drop   0   545
    ## 6 South East         5 Locality 7    drop   0   333

### pop_lac_age_female

``` r
head(pop_lac_age_female)
```

    ##      ca_name ca_number   asc_name .groups Age Females
    ## 1    Central         3 Locality 5    drop   0     340
    ## 2       East         4 Locality 6    drop   0     541
    ## 3      North         1 Locality 1    drop   0     276
    ## 4 North East         2 Locality 2    drop   0     624
    ## 5      South         7 Locality 4    drop   0     492
    ## 6 South East         5 Locality 7    drop   0     346

### pop_lac_yrs

``` r
head(pop_lac_yrs)
```

    ##      ca_name ca_number   asc_name Year Persons
    ## 1    Central         3 Locality 5 2001   64711
    ## 2       East         4 Locality 6 2001   76599
    ## 3      North         1 Locality 1 2001   70610
    ## 4 North East         2 Locality 2 2001   83787
    ## 5      South         7 Locality 4 2001   74330
    ## 6 South East         5 Locality 7 2001   70900

### pop_lac_yrs_age_gender

``` r
head(pop_lac_yrs_age_gender)
```

    ##      ca_name ca_number   asc_name Year Age Gender Persons
    ## 1    Central         3 Locality 5 2001   0      F     295
    ## 2       East         4 Locality 6 2001   0      F     474
    ## 3      North         1 Locality 1 2001   0      F     320
    ## 4 North East         2 Locality 2 2001   0      F     585
    ## 5      South         7 Locality 4 2001   0      F     424
    ## 6 South East         5 Locality 7 2001   0      F     349

## Ward level

### pop_ward_age

``` r
head(pop_ward_age)
```

    ##   Ward Code               Ward Name      Age Persons
    ## 1 E05010857 Beauchief and Greenhill All Ages   19732
    ## 2 E05010857 Beauchief and Greenhill        0     257
    ## 3 E05010857 Beauchief and Greenhill        1     231
    ## 4 E05010857 Beauchief and Greenhill        2     270
    ## 5 E05010857 Beauchief and Greenhill        3     277
    ## 6 E05010857 Beauchief and Greenhill        4     277

### pop_ward_age_male

``` r
head(pop_ward_age_male)
```

    ##   Ward Code               Ward Name      Age Males
    ## 1 E05010857 Beauchief and Greenhill All Ages  9429
    ## 2 E05010857 Beauchief and Greenhill        0   135
    ## 3 E05010857 Beauchief and Greenhill        1   117
    ## 4 E05010857 Beauchief and Greenhill        2   131
    ## 5 E05010857 Beauchief and Greenhill        3   144
    ## 6 E05010857 Beauchief and Greenhill        4   138

### pop_ward_age_female

``` r
head(pop_ward_age_female)
```

    ##   Ward Code               Ward Name      Age Females
    ## 1 E05010857 Beauchief and Greenhill All Ages   10303
    ## 2 E05010857 Beauchief and Greenhill        0     122
    ## 3 E05010857 Beauchief and Greenhill        1     114
    ## 4 E05010857 Beauchief and Greenhill        2     139
    ## 5 E05010857 Beauchief and Greenhill        3     133
    ## 6 E05010857 Beauchief and Greenhill        4     139

### pop_ward_yrs

``` r
head(pop_ward_yrs)
```

    ##   Ward Code               Ward Name Year Persons
    ## 1 E05010857 Beauchief and Greenhill 2001   18979
    ## 2 E05010857 Beauchief and Greenhill 2002   18875
    ## 3 E05010857 Beauchief and Greenhill 2003   18821
    ## 4 E05010857 Beauchief and Greenhill 2004   18801
    ## 5 E05010857 Beauchief and Greenhill 2005   19038
    ## 6 E05010857 Beauchief and Greenhill 2006   19132

### pop_ward_yrs_age_gender

``` r
head(pop_ward_yrs_age_gender)
```

    ##   Ward Code               Ward Name Year Gender Age Persons
    ## 1 E05010857 Beauchief and Greenhill 2001      M   0     106
    ## 2 E05010857 Beauchief and Greenhill 2001      M   1     113
    ## 3 E05010857 Beauchief and Greenhill 2001      M   2     114
    ## 4 E05010857 Beauchief and Greenhill 2001      M   3     126
    ## 5 E05010857 Beauchief and Greenhill 2001      M   4     132
    ## 6 E05010857 Beauchief and Greenhill 2001      M   5     112

## Neighbourhood level

### pop_nhood_age

``` r
head(pop_nhood_age)
```

    ##   nhood_code nhood_name      Age Persons
    ## 1          1 High Green All ages    9493
    ## 2          1 High Green        0     101
    ## 3          1 High Green        1      94
    ## 4          1 High Green        2      88
    ## 5          1 High Green        3     104
    ## 6          1 High Green        4     122

### pop_nhood_age_male

``` r
head(pop_nhood_age_male)
```

    ##   nhood_code nhood_name      Age Males
    ## 1          1 High Green All ages  4613
    ## 2          1 High Green        0    53
    ## 3          1 High Green        1    53
    ## 4          1 High Green        2    40
    ## 5          1 High Green        3    53
    ## 6          1 High Green        4    68

### pop_nhood_age_female

``` r
head(pop_nhood_age_female)
```

    ##   nhood_code nhood_name      Age Females
    ## 1          1 High Green All ages    4880
    ## 2          1 High Green        0      48
    ## 3          1 High Green        1      41
    ## 4          1 High Green        2      48
    ## 5          1 High Green        3      51
    ## 6          1 High Green        4      54

### pop_nhood_yrs_age

``` r
head(pop_nhood_yrs_age)
```

    ##   nhood_code nhood_name Year      Age Persons
    ## 1          1 High Green 2020 All ages    9493
    ## 2          1 High Green 2020        0     101
    ## 3          1 High Green 2020        1      94
    ## 4          1 High Green 2020        2      88
    ## 5          1 High Green 2020        3     104
    ## 6          1 High Green 2020        4     122

### pop_nhood_yrs_age_gender

``` r
head(pop_nhood_yrs_age_gender)
```

    ##   nhood_code nhood_name Year      Age Gender Persons
    ## 1          1 High Green 2020 All ages      M    4613
    ## 2          1 High Green 2020        0      M      53
    ## 3          1 High Green 2020        1      M      53
    ## 4          1 High Green 2020        2      M      40
    ## 5          1 High Green 2020        3      M      53
    ## 6          1 High Green 2020        4      M      68

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
