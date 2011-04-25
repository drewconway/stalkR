# stalkR #

*stalkR is a set of simple convenience functions in R for exploring your iPhone or iPad location data*

*Last update: 2011-04-25*

ChangeLog:

* Removed dependency on R 2.13 list.dirs() function

* Fixed bug on weird apostrophe's on my iDevice names

* Added NAMESPACE

* Added ChangeLog 

## Description ##

As discovered by Alasdair Allan and Pete Warden ([http://petewarden.github.com/iPhoneTracker/](http://petewarden.github.com/iPhoneTracker/)), iPhone and iPad devices have been silently recording the location of the device.  This package contains three convenience functions for parsing the location data and visualizing it.

## Warning ##

This package **only works on Mac OS X**, which is why I am not adding it to CRAN.  Remember, this is is just for fun :)

Also, this was thrown together pretty fast, so please let me know when it breaks.

## Installation ##

Download the `stalkR_0.02.tar.gz` file above, and run the following command in the R console:

    > install.packages("stalkR_0.02.tar.gz", repos=NULL, type="source")

Remember: you must be in the same working directory as where you saved the source.

## Example ##

To run the code, you need only two bits of information:

1. You user name on your computer.  On Mac OS X this will be the directories listed under `/Users/`
2. The name of the device you wish to explore, exactly as it appears in iTunes.

In my case, we can visualize my travel in Maryland, MD, USA with the following commands:

    > library(stalkR)
    > drews.locs<-get.mylocations("agconway", "Drew Conway's iPhone")
    > viz.locations(drews.locs, "state", "maryland")

![Maryland Travel](http://www.drewconway.com/zia/wp-content/uploads/2011/04/my_maryland.png)
