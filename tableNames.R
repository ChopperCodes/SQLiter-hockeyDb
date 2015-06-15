require(RSQLite);

tableNames<-
  function(R.dir, sqlite.file){
    source(paste(R.dir, "dTableNames.R", sep=""));
    
    tableNames<<-
      dTableNames(sqlite.file);
  }
