#' genbibtex
#'
#' @param packages
#' @param outfile
#'
#' @export
genBibtex <- function(packages,outfile="/Users/pschofield/git_tree/biblio/library.bib"){
  res <- lapply(packages, 
          function(c){
            cit <- toBibtex(citation(c),style="Bibtex")
            cit[1] <- gsub("[{]","{c",cit[1])
            write(cit,file=outfile,append=T)
          })
}
