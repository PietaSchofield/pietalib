#' edit a file
#'
#' @param filename
#' @param rstudio
#'
#' @export
go <- function(filename,rstudio=T){
  cur <- list.files("/Users/pschofield/git_tree/notes",pattern="^note.*[.]Rmd$",
                    full=T)
  filename <- tail(cur[order(cur)],1)
  file.edit(filename)
  filename
}
