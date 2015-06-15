require(RSQLite);

#Return a df of table names. Assign it to variable of choosing, or just let it print
dTableNames<-
  function(sqlite.file){
    db<-
      dbConnect(SQLite(), sqlite.file);
    
    response<-
      dbGetQuery(db, "select name from sqlite_master where type='table'");
    
    dbDisconnect(db);
    
    return(response);
  }
