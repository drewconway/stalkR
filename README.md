# stalkR #

*stalkR is a set of simple convenience functions in R for exploring your iPhone or iPad location data*

## Description ##

As discovered by Alasdair Allan Pete Warden [http://petewarden.github.com/iPhoneTracker/](http://petewarden.github.com/iPhoneTracker/), iPhone and iPad devices have been silently recording the location of the device.  This package contains three convenience functions for parsing the location data and visualizing.

This is a simple set of function that will let you parse your own data in an R data frame, as well as another that will produce a basic visualization for you.

## Warning ##

This package with **only work on Mac OS X**, which is why I am not adding it to CRAN.  Remember, this is is just for fun :)

## Installation ##

Download the `stalkR_0.01.tar.gz` file above, and run the following command in the R console:

    > install.packages("stalkR_0.01.tar.gz", repos=NULL, type="source")

Remember: you must be in the same working directory as where you saved the source.

## Example ##

To run the code, you need only two bits of information:

1. You user name on your computer.  On Mac OS X this will be the directories listed under `/Users/`
2. The name of the device you wish to explore, exactly as it appears in iTunes.

In my case, we can visualize my travel in Maryland, MD, USA with the following commands:

    > library(stalkR)
    > drews.locs<-get.mylocations("my.name", "my.device")
    > viz.locations(drews.locs, "state", "maryland")

![Maryland Travel](http://www.drewconway.com/zia/wp-content/uploads/2011/04/my_maryland.png)
