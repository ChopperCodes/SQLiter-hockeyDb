require(RSQLite);

dTable<-
  function(table.name, sqlite.file){
    
    db<-
      dbConnect(SQLite(), sqlite.file);
    
    qs<-
      paste("select * from", table.name);
    
    response<-
      dbGetQuery(db, qs )
    
    dbDisconnect(db);
    
    return(response);
  }
