#' edit a file
#'
#' @param filename filename to edit
#' @param rstudio open in Rstudio (if not open in MacVim)
#'
#' @export
e <- function(filename,rstudio=T){
  if(rstudio){
    file.edit(filename)
  }else{
    system(paste0("open -a /Applications/MacVim.app ",filename))
  }
}
