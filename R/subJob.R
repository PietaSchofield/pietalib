#' Submit a job to the cluster
#'
#' This functions submits a job in the form of a scriptfile to the cluster via ssh 
#'
#' @param batchFile a string representing the name of the script file to be submitted
#' @param user a string with the user name of the person making the ssh connection
#' @param host a string with the name of the login host for the cluster
#' @param logDir a string with the location of where the job logs files will be stored
#' @param mcCores an integer for the number of cores to request
#'
#' @export 
subJob <- function(scriptfile,user="pschofield", host="login.compbio.dundee.ac.uk",
                   logdir="/homes/pschofield/tmp/", mcCores=1)
{
  jobString <- paste0("chmod +x ",scriptfile,";\n",
                      "/gridware/sge/bin/lx-amd64/qsub",
                      " -o ",logdir,
                      " -e ",logdir,
                      " -pe smp ",mcCores,
                      " -R yes ",scriptfile)
  system(paste0("ssh -T ",user,"@",host," '",jobString,"'"),intern=T) 
}


