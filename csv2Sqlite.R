require(RSQLite);

csv2Sqlite<-
  function(csv.files, sqlite.file, csv.dir){    
    
    db<-
      dbConnect(SQLite(), sqlite.file);
    
    for (csv in csv.files){
      txt<-
        paste(csv, "<-read.csv(paste('", csv.dir, csv, ".csv', sep=''), stringsAsFactors=FALSE);" , sep="");
      
      eval(parse(text=txt));
      
      txt<-
        paste("dbWriteTable(db, '",csv ,"', " , csv ," );", sep='');
      
      eval(parse(text=txt));
    }
    
    dbDisconnect(db);
  }
