#' rebuild a package
#'
#' @param pkgname
#'
#' @param rstudio
#'
#' @export
rb <- function(pkgName){
  curd <- getwd()
  setwd(paste0("/Users/pschofield/git_hub/",pkgName))
  devtools::document()
  devtools::load_all()
  devtools::install(reload=T)
  setwd(curd)
}
