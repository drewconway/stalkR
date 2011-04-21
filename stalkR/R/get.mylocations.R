get.mylocations <-
function(user.name, device.name) {
    conn<-location.db(user.name, device.name)
    return(dbReadTable(conn, "CellLocation"))
}

