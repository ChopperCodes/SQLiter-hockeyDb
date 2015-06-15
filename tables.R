require(RSQLite);

tables<-
  function(table.names, sqlite.file){
    table.names<-
      c(table.names)
    
    db<-
      dbConnect(SQLite(), sqlite.file);
    
    for (tb in table.names){
      
      # a little friendlier on the database than using dfnTables since it is only connects and closses once
      txt<-
        paste(tb,"<<-dbGetQuery(db,'select * from", tb, "')"); #uses global operator
      
      eval(parse(text=txt));
    }
    
    dbDisconnect(db);
    
  }

