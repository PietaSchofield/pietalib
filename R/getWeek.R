#' getWeek return the data for the week comencing
#'
#' get the time_sheet data for a particular week
#'
#' @param start date
#'
#' @export
getWeek <- function(startDate,projDir="/Users/pschofield/Projects/time_sheet/",
                    dbName="timeSheet.db"){
  db <- RSQLite::dbConnect(RSQLite::SQLite(), dbname=paste0(projDir,dbName))
  ses <- RSQLite::dbGetQuery(db,paste0("select * from sessions where End > '",startDate,"'"))
  plotDat <- melt(dcast(ses,Project~PI,value.var="Duration",sum))
  plotDat <- plotDat[which(plotDat$value>0),]
  plotDat$hours <- plotDat$value/60
  plotDat$percent <- round(100*plotDat$value/sum(plotDat$value))
  colnames(plotDat)[2:3] <- c("PI","minutes")
  plotDat
}
