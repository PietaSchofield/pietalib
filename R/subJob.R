#' Submit a job to the cluster
#'
#' This functions submits a job in the form of a scriptfile to the cluster via ssh
#'
#' @param batchFile a string representing the name of the script file to be submitted
#' @param user a string with the user name of the person making the ssh connection
#' @param host a string with the name of the login host for the cluster
#' @param logDir a string with the location of where the job logs files will be stored
#' @param queue queue name
#' @param mcCores an integer for the number of cores to request
#' @param email job status email setting
#' @param emailAddress where to send job status emails
#' @param args any arguments to add to the job submission string
#'
#' @export
subJob <- function(scriptfile,user="pschofield", host="troodon.scicom.picr.man.ac.uk",
                   qsubString="qsub",args=NULL, noSub=T )
{
  jobString <- paste0("'source /etc/bashrc;", qsubString," ",scriptfile, " ",args," ")
  sshString <- paste0("ssh ",user,"@",host," ",jobString,"'")
  if(noSub){
    sshString
  }else{
    list(jobid=system(sshString), jobstring=sshString)
  }
}


