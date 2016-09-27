#' render the current document  
#'
#' @param pname project name
#' @param fname file name
#' @param tname tree name
#' @param rname root of tree
#' @param oflag open a file
#' @param rootdir root
#'
#' @export
rcur <- function(fileName=.curFile,projDir=.curProj,
                 inDir=NULL, outDir="Notes/Projects",
                 rootDir="/Volumes/pschofield",
                 codeDir="/Users/pschofield/Code/bb/CRUK"){
  if(!is.null(projDir)){
    infile <- file.path(codeDir,projDir,paste0(fileName,".Rmd"))
    outfile <- file.path(rootDir,outDir,projDir)
  }else{
    infile <- file.path(codeDir,inDir,paste0(fileName,".Rmd"))
    outfile <- file.path(rootDir,outDir)
  }
  print(paste(infile,outfile,sep=" "))
  rmarkdown::render(input=infile,output_dir=outfile)
}
