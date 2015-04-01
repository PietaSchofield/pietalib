#' readENCODE read broadPeak and narrowPeak formats and return a GRanges object
#'
#' @param filename 
#'
#' @export
readENCODE <- function(fn){
  type <- tail(strsplit(basename(fn),"[.]")[[1]],1)
  pks <- read.delim(fn,head=F,sep="\t")
  if(type=="narrowPeak"){
    colnames(pks) <- c("seqnames","start","end","name","score","strand","signal","pValue",
                       "qValue","peak")
  }else if(type=="broadPeak"){
    colnames(pks) <- c("seqnames","start","end","name","score","strand","signal","pValue",
                       "qValue")
  }else{
    colnames(pks) <- c("seqnames","start","end","score")
    pks$strand <- "*"
  }
  pks$strand <- ifelse(!(pks$strand %in% c("+","-","*")),"*",pks$strand)
  as(pks,"GRanges")
}

