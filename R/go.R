#' edit most recent note
#'
#' @export
go <- function(){
  cur <- list.files("/Users/pschofield/git_tree/notes",pattern="^note.*[.]Rmd$",
                    full=T)
  filename <- tail(cur[order(cur)],1)
  file.edit(filename)
  filename
}
