viz.locations <-
function(location.df, map="world", region=".") {
    the.map<-map_data(map,region)
    location.df<-subset(location.df, Longitude >= min(the.map$long) & Longitude <= max(the.map$long) & 
        Latitude >= min(the.map$lat) & Latitude <= max(the.map$lat))
    loc.freq<-ddply(location.df,.(Longitude, Latitude), summarise, Freq=length(Timestamp))
    loc.plot<-ggplot(the.map, aes(long,lat))+geom_path(aes(group=group))
    loc.plot<-loc.plot+geom_point(data=loc.freq, aes(x=Longitude, y=Latitude, size=Freq, color=Freq, alpha=0.65))
    loc.plot<-loc.plot+scale_size_continuous(legend=FALSE)+scale_colour_continuous(legend=FALSE)+scale_alpha(legend=FALSE)
    loc.plot<-loc.plot+scale_x_continuous(breaks=NA)+scale_y_continuous(breaks=NA)
    loc.plot<-loc.plot+xlab("")+ylab("")+coord_map()+theme_bw()
    print(loc.plot)
}

