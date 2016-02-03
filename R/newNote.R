#' create a new notebook file
#'
#' @param name project name
#' @param root default project root directory
#'
#' @export
newNote <- function(name=NULL,root="/Users/pschofield/git_tree/"){
  projDir <- paste0("/Users/pschofield/Projects/",name)
  wwwDir <- paste0("/homes/pschofield/Projects/",name)
  fname<-paste0("note_",format(Sys.time(), "%Y_%m"))
  if(!file.exists(paste0(wwwDir,"web/notebook"))){
    dir.create(paste0(wwwDir,name,"/web/notebook"),recursive=T)
  }
  if(!file.exists(paste0(projDir,"web/notebook"))){
    dir.create(paste0(projDir,"/web/notebook"),recursive=T)
  }
  system(paste0("cp /Users/pschofield/git_hub/template.Rmd ",root,name,"/",fname,".Rmd"))
  file.edit(paste0(root,name,"/",fname,".Rmd"))
}
