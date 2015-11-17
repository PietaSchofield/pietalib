#' edit a file
#'
#' @param filename
#' @param rstudio
#'
#' @export
e <- function(filename,rstudio=T){
  if(rstudio){
    file.edit(filename)
  }else{
    system(paste0("open -a /Applications/MacVim.app ",filename))
  }
}
