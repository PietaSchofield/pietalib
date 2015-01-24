#' genbibtex
#'
#' @param packages
#' @param outfile
#'
#' @export
genBibtex <- function(packages,outfile){
  res <- lapply(packages, 
          function(c){
            cit <- toBibtex(citation(c),style="Bibtex")
            cit[1] <- gsub("[{]","{c",cit[1])
            write(cit,file=outfile,append=T)
          })
}
