#' create a new project
#'
#' @param name
#' @param root
#' @param noidx
#' @param noDir
#' @param noWWW
#'
#' @export
newProject <- function(name=NULL,root="/Users/pschofield/git_tree/",noidx=F,noDir=F,noWWW=F){
  dir.create(paste0(root,name))
  if(!noDir){
    dir.create(paste0("/Users/pschofield/Projects/",name,"/web/notebook"),recursive=T)
  }
  if(!noWWW){
    dir.create(paste0("/homes/pschofield/Projects/",name,"/web/notebook"),recursive=T)
    rsh(paste0("ln -s /homes/pschofield/Projects/",name,"/web ",
               "/homes/pschofield/public_html/Projects/",name))
  }
  system(paste0("cp /Users/pschofield/git_hub/template.Rmd ",root,name,"/index.Rmd"))
  file.edit(paste0(root,name,"/index.Rmd"))
}
