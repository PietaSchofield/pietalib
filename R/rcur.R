#' render the current document  
#'
#' @param pname project name
#' @param fname file name
#' @param tname tree name
#' @param rname root of tree
#' @param oflag open a file
#'
#' @export
rcur <- function(fileName=.curFile,projDir=.curProj,inDir="Code",outDir="Notes/Projects"){
  homeDir <- "/home/pschofield"
  rmarkdown::render(file.path(homeDir,inDir,projDir,paste0(fileName,".Rmd")),
                    output_dir=file.path(homeDir,outDir,projDir))
}
