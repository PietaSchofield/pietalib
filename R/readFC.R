#' readFC read a featureCount File
#'
#' @param file
#'
#' @export
readFC <- function(file){
  dat <- read.delim(file,head=T,skip=1,sep="\t")
  dat
}

