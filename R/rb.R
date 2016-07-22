#' rebuild a package
#'
#' @param pkgname
#'
#' @param rstudio
#'
#' @export
rb <- function(pkgName, baseDir="/Users/pschofield/git_hub/"){
  curd <- getwd()
  setwd(paste0(baseDir,pkgName))
  devtools::document()
  devtools::load_all()
  devtools::install(reload=T)
  setwd(curd)
}
