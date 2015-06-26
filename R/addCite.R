#' include citation for package in markdown
#'
#' @param packages
#'
#' @export
addCite <- function(bib,packages,type="T"){
  switch(type,
    "T"=TextCite(bib,listcitekeys(packages=packages)),
    "A"=AutoCite(bib,listcitekeys(packages=packages))
  )
}
