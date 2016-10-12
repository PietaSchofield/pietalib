#' Submit a job to the cluster
#'
#' This functions submits a job in the form of a scriptfile to the cluster via ssh
#'
#' @param batchFile a string representing the name of the script file to be submitted
#' @param user a string with the user name of the person making the ssh connection
#' @param host a string with the name of the login host for the cluster
#' @param qsubstring the submission string for the torque system
#' @param args any arguments to add to the job submission string
#' @param noSub unless set to false will merely display the command rather than submit it.
#'
#' @export
subJobCRUK <- function(scriptfile,user="pschofield", host="troodon.scicom.picr.man.ac.uk",
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


