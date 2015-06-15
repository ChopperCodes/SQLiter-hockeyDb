require(RSQLite);

viewNames<-
  function(R.dir, sqlite.file){
    source(paste(R.dir, "dViewNames.R", sep=""))
    viewNames<<-
      dViewNames(sqlite.file=sqlite.file);
  }
