require(RSQLite);


#Return a df of view names. Assign it to variable of choosing, or just let it print
dViewNames<-
  function(sqlite.file){
    db<-
      dbConnect(SQLite(), sqlite.file);
    
    response<-
      dbGetQuery(db, "select name from sqlite_master where type='view'");
    
    dbDisconnect(db);
    
    return(response);
  }
