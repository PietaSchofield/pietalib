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
subJob <- function(scriptfile,user="pschofield", host="login.compbio.dundee.ac.uk",
                   logdir="/homes/pschofield/tmp/", mcCores=1,email="as",queue=NULL,
                   emailAddress="p.schofield@dundee.ac.uk",args=NULL, ramSize="4G")
{
  jobString <- paste0("chmod +x ",scriptfile,";\n",
                      "/gridware/sge/bin/lx-amd64/qsub",
                      ifelse(is.null(queue)," ",paste0(" -q ",queue)),
                      " -l ram=",ramSize,
                      " -o ",logdir,
                      " -e ",logdir,
                      " -pe smp ",mcCores,
                      " -M ",emailAddress,
                      " -m ",email,
                      " -R yes ",scriptfile)
  if(!is.null(args)) jobString=paste0(jobString," ",args)
  list(jobid=system(paste0("ssh -T ",user,"@",host," '",jobString,"'"),intern=T),
       jobstring=jobString)
}


