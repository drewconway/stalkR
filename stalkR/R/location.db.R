list.dirs <- function(path=".", pattern=NULL, all.dirs=FALSE, ignore.case=FALSE) {
  all <- list.files(path, pattern, all.dirs, full.names=TRUE, recursive=FALSE, ignore.case)
  all[file.info(all)$isdir]
}

location.db<-
function(user.name, device.name) {
		list.dirs <- function(path) {
			files <- list.files(path, full.names = TRUE)
			files[file_test('-d', files)]
		}
    # Locate mobile sync data files that were modified most recently and contain data on 
    # the device listed above.

    # Get folders, and order by modication date
    mobile.files<-list.dirs(paste("/Users/",user.name,"/Library/Application Support/MobileSync/Backup/",sep=""))
    mod.dates<-do.call(rbind, lapply(mobile.files, file.info))
    mod.dates<-tryCatch(mod.dates[with(mod.dates, order(mtime)),], error=function(e) return(FALSE))
   
    if(class(mod.dates)=="logical") {
        stop(paste("No path to user '",user.name,"', please check your Home directory.", sep=""))
    }

    # Find the folder that has the device of interest. 

    # Create a function that checks if the Info.plist file is the correct one.
    is.device<-function(path, device) {
      # just to make sure, convert any nasty apostrophes from the device name
        device.xml<-tryCatch(
          suppressMessages(
            xmlTreeParse(paste(path,"/Info.plist",sep=""), useInternalNodes=TRUE)
          ), 
          error=function(e) return(FALSE)
        )
        if(length(class(device.xml))>1) {
            path.strings<-getNodeSet(device.xml, "//dict/string")
            path.values<-sapply(path.strings, xmlValue)
            # protect user from posh apostrophes
            test_device = gsub("’","'",path.values[2])
            return(ifelse(test_device==gsub("’","'",device), TRUE, FALSE))
        }
        else {
            return(FALSE)
        }
    }

    # Find file
    found.file<-FALSE
    for(i in rev(1:nrow(mod.dates))) {
        if(!found.file) {
            if(is.device(row.names(mod.dates)[i],device.name)) {
                found.file<-TRUE
                file.index<-i
            }
        }
    }
        
    if(found.file==FALSE) {
        stop(paste("No device for '",device.name,"' found. Check that the name is correct",sep=""))
    }
    
    device.path<-row.names(mod.dates)[file.index]
    # Do some magic Manifest parsing! Thanks to 
    # http://stackoverflow.com/questions/3085153/how-to-parse-the-manifest-mbdb-file-in-an-ios-4-0-itunes-backup
    cur.dir<-getwd()
    package.dir<-.path.package('stalkR')
    setwd(device.path)
    consolidated.db<-system(paste("python ",package.dir,"/Python/manifest_parse.py | grep 'consolidated'",sep=""),intern=TRUE)
    setwd(cur.dir)
    db.file<-strsplit(consolidated.db, "[\\(\\)]")[[1]][2] # The SQLite db file!

    # Create connection to SQLite db and return it
    return(dbConnect("SQLite", paste(device.path,"/",db.file,sep="")))
}
