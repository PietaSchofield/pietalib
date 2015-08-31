#' readFC read a featureCount File
#'
#' @param file
#'
#' @export
readFC <- function(file){
  dat <- read.delim(file,head=T,skip=1,sep="\t")
  rownames(dat) <- dat[,1]
  annotation <- dat[,1:6]
  counts <- dat[,7:length(dat[1,])]
  colnames(counts) <- gsub("[.]bam$","",colnames(counts))
  rownames(counts) <- rownames(dat)
  rownames(annotation) <- rownames(dat)
  if(file.exists(paste0(file,".summary"))){
    sumDat <- read.delim(paste0(file,".summary"), sep="\t",h=T)
    rownames(sumDat) <- sumDat$Status
    sumDat <- sumDat[,-1]
    colnames(counts) <- gsub("[.]bam$","",colnames(counts))
    sumDat <- as.data.frame(sumDat)
  }else{
    sumDat <- NULL
  }
  list(counts=counts,annotation=annotation[,-1],summary=sumDat)
}

