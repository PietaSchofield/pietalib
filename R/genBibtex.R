#' genbibtex
#'
#' @param packages
#' @param outfile
#'
#' @export
genBibtex <- function(packages,
                      db=F,
                      outfile="/Users/pschofield/git_tree/biblio/library.bib"){
  res <- lapply(packages,
           function(cc){
            if(!db & !is.null(outfile)){
              cit <- .addcitekey(cc)
              lapply(cit,
                function(cn){
                  write(cn,file=outfile,append=T)
                })
            } else{
              paste0(cc,listcitekeys(cc))
            }
           })
  if(db) res
}

.getfield <- function(txt,key){
  m <- regexpr("[{].*[}]",txt[grepl(key,txt)])
  gsub("[}{]","",substr(txt[grepl(key,txt)],
                        (m[1]),(m[1]+attr(m,"match.length")-1)))
}

.getauthor <- function(cit){
  txt <- .getfield(cit,"author")
  m <- regexpr("^.*?(,|and|$)",txt)
  tail(strsplit(gsub(" and","",
                     substr(txt,(m[1]),(m[1]+attr(m,"match.length")-1))),
                " ")[[1]],1)
}

.getcitkey <- function(cit){
  paste0(tolower(.getauthor(cit)),":",.getfield(cit,"year"))
}

.addcitekey <- function(cc){
  cit <- toBibtex(citation(cc),style="Bibtex")
  begin <- as.list(which(grepl("@",cit)))
  endin <- as.list(c(which(grepl("@",cit)),(length(cit)+1))[-1])
  ncit <- Map(c,begin,endin)
  lapply(ncit,
    function(n){
      cn <- unname(cit[n[1]:(n[2]-1)])
      cn[1] <- gsub("[{].*[,]", paste0("{ ",.getcitkey(cn),","),cn[1])
      cn
    })
}


