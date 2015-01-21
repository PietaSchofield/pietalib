#' Load data from OfficeTime export into my time recording DB
#
#' Takes a file name and squirts the info into the time recording database. It will check if
#' data already exists for the dates and stop rather than write duplicate entries.
#'
#' @param filename
#'
#' @export
logTime <- function(fileName=NULL,
                    projDir="/Users/pschofield/Projects/time_sheet/",
                    dbName="timeSheet.db"){
  db <- RSQLite::dbConnect(RSQLite::SQLite(), dbname=paste0(projDir,dbName))
  outFile <- paste0(projDir,format(Sys.time(),"%Y_%m_%d"),".txt")
  uploads <- as.data.frame(cbind(date=format(Sys.time(),"%Y_%m_%d"),
                                 infile=fileName,outFile=outFile)
  system(paste0("iconv -f UTF-16 -t UTF-8 < ",inFile," > ",outFile),intern=T)
  dat <- read.delim(outFile,head=T,stringsAsFactors=F)[,c(-1,-2)]
  dat$End.Time <- lubridate::dmy_hm(dat$End.Time)
  dat$Start.Time <- lubridate::dmy_hm(dat$Start.Time)
  dat$Duration <- dat$Duration*60
  dat$Cost <- sapply(dat$Category,function(x) tail(strsplit(x,",")[[1]],1))
  dat$Category <- sapply(dat$Category,function(x) head(strsplit(x,",")[[1]],1))
  colnames(dat) <- c("Project","Start","End","Duration","PI","Division","Notes")
  if(!("sessions"%in%dbListTables(db))){
    dbWriteTable(db,"sessions",dat)
  }else{
    sql <- paste0("insert into sessions (",dbListField(db,sessions),") values (",
                  dat)
  } 
  if(!("uploads"%in%dbListTables(db))){
    dbWriteTable(db,"uploads",uploads)
  }else{

  }
  RSQLite::dbListTables(db)
}
