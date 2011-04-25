.onLoad<-function(libname, pkgname) {
    cur.ver<-R.version
    if(as.numeric(cur.ver$major) < 2 | as.numeric(cur.ver$minor) < 12.0) {
        stop("stalkR requires R version 2.12, please upgrade at http://cran.r-project.org/mirrors.html")
    }
}
