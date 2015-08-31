#' subScript will submit a script to the cluster
#'
#' calls subJob to submit a script to the cluster as a temporary file it relies on the temporary
#' directory where the temporary file will be written to being mounted to the local machine.
#' I could get round this by writing it locally and then copying it with scp but at the moment
#' this is not worth the effort.
#'
#' @param scriptstub the stub for the temporary file name
#' @param script the content of the script as a vector of strings
#' @param tmpdir location for the temporary file
#' @param scriptext extention for the temporary file
#' @param logdir location for the batch job logs
#' @param cores number of cores
#' @param nosub boolean to switch off actual submission but to create the tempfiles
#'
#' @export
subScript <- function(scriptstub="ssh",script=c("#!/bin/bash","hostname"),scriptext=".sh",
                      tmpdir="/homes/pschofield/tmp/",logdir="",cores=8,nosub=FALSE,
                      args=NULL)
{
  batchJob <- tempfile(pattern=scriptstub,tmpdir=tmpdir,fileext=scriptext)
  filecon <- file(batchJob)
  writeLines(script, filecon)
  close(filecon)
  if(!nosub) subJob(scriptfile=batchJob,logdir=logdir,mcCores=cores,args=args)
}


