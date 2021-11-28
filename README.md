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
