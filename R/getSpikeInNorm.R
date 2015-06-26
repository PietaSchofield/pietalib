#' get results from nicks spike-in db
#'
#' @param expid 
#' @param custom custom sql string
#'
#' @export
getSpikeInNorm <- function(expID=NULL,custom=NULL){
  require(RMySQL)
  drv <- DBI::dbDriver("MySQL")
  dbCon <- tryCatch(RMySQL::dbConnect(drv,group="spikein"),
                    condition = function(c){
                                 stop("could not open database")
                                }
                    )

  if(is.null(expID)){
    if(is.null(custom)){
      sSQL <- "SELECT id, title FROM spikeinDB_experiment"
    }else{
      sSQL=custom
    }
  }else{
    sSQL <- paste0("SELECT DISTINCT e.id, n.group_id, n.name, n.value ",
                   "FROM spikeinDB_experiment e, spikeinDB_sample s, ", 
                   "spikeinDB_group g, spikeinDB_sample_groups sg, ",
                   "spikeinDB_normalization n ",
                   "WHERE e.id = s.experiment_id and s.id=sg.sample_id and ",
                   "sg.group_id=g.id and n.group_id=g.id and ",
                   "sg.group_id=n.group_id and e.id= ",expID," ",
                   "ORDER by g.id")
  }
  rset <- RMySQL::dbSendQuery(dbCon,sSQL)
  res <- RMySQL::fetch(rset)
  RMySQL::dbClearResult(rset)
  RMySQL::dbDisconnect(dbCon)
  detach("package:RMySQL")
  res
}


