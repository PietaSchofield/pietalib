#' read in dreme results file
#'
#' @param filename name of xml file
#'
#' @return returns a list with an array of statistic on each motif and an list of all the pwms
#'
#' @export
readDREME <- function( filename ) {
  file <- XML::xmlParse( file = filename, getDTD = FALSE )
  mtfs <- getNodeSet(file,"//motif")
  attrs <- plyr::ldply(xpathApply(file,"//motif",xmlAttrs))
  pwm <- lapply(mtfs, function(mf) t(plyr::ldply(xpathApply(mf,"pos",xmlAttrs))))
  motifs <- list()
  motifs$array <- attrs
  motifs$pwm <- pwm
  return(motifs)
}
