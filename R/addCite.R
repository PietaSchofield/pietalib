#' include citation for package in markdown
#'
#' @param packages
#'
#' @export
addCite <- function(packages,type="T",bib=NULL){
  if(!is.null(bib)){
    switch(type,
      "T"=TextCite(bib,listcitekeys(packages=packages)),
      "A"=AutoCite(bib,listcitekeys(packages=packages))
    )
  }else{
    switch(type,
      "T"= paste0("\\citet{",paste(listcitekeys(packages),collapse=","),"}"),
      "A"= paste0("\\citep{",paste(listcitekeys(packages),collapse=","),"}")
    )
  }
}
