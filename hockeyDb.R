
####Values######
dir<-
  "hockey db/";

dbName<-
  "hdb-2012-06-23-testing123.sqlite";

sqlite.file<-
  paste(dir, dbName, sep='');

R.dir<-
  paste(dir, "R/", sep="");

csv.dir<-
  paste(dir, "csv/", sep="");

##In order to work these files need to be present in the csv.dir location
##They can be downloaded from: 
#########################################################################
##                http://www.opensourcesports.com/hockey/
#########################################################################
csv.files<-
  c(
    "abbrev"
    , "AwardsCoaches"
    , "AwardsMisc"
    , "AwardsPlayers"
    , "Coaches"
    , "Coaches_beta"
    , "CombinedShutouts"
    , "Goalies"
    , "GoaliesSC"
    , "GoaliesShootout"
    , "HOF"
    , "Master"
    , "Scoring"
    , "ScoringSC"
    , "ScoringShootout"
    , "ScoringSup"
    , "SeriesPost"
    , "Teams"
    , "TeamsHalf"
    , "TeamSplits"
    , "TeamsPost"
    , "TeamsSC"
    , "TeamVsTeam"
  );

##Uncomment the lines as needed.

##Step 1 Convert several csv files to 1 sqlite db file
source( paste(R.dir, "csv2Sqlite.R", sep="") );
#csv2Sqlite( csv.files=csv.files, sqlite.file=sqlite.file, csv.dir=csv.dir);

##Step 2 Return a data.frame of table names. 
##       Assign it to variable of choosing, or just let it print
source( paste(R.dir, "dTableNames.R", sep="") );
#tableNames.1<-
#  dTableNames(sqlite.file=sqlite.file);

##Step 2.1 Alternatively, publish a data.frame with the table names to the global environment
##         Depends on loading dTableNames.R
source( paste(R.dir, "tableNames.R", sep="") );
#tableNames(R.dir=R.dir, sqlite.file=sqlite.file);

##step 3 Returns the data from a specified table. Assign to variable of choosing, just let it print
source( paste(R.dir, "dTable.R", sep="") );
#abbrev<-
#  dTable(table.name="abbrev", sqlite.file=sqlite.file);

##Step 4 Publishes the data from each table into global data frames named as the respective 
##       table names in the database
source( paste(R.dir, "tables.R", sep="") );
#tables(csv.files, sqlite.file);

##Step 5 Return a data.frame of view names. Assign it to variable of choosing, or just let it print
##       First create a view within the sqlite file.
###########################Execute this code in the sqlite file##########################
##       CREATE VIEW v_year_lgId AS SELECT YEAR ,lgId FROM Teams GROUP BY YEAR ,lgId;
#########################################################################################

source( paste(R.dir, "dViewNames.R", sep="") );
#views<-
#  dViewNames(sqlite.file=sqlite.file);

##Step 6 Publishes a data.frame of view names. Assigns it to global variable 'viewNames'
source( paste(R.dir, "viewNames.R", sep="") );
#viewNames(R.dir=R.dir, sqlite.file=sqlite.file);
