#' read in meme results file
#'
#' @param filename name of xml file
#'
#' @return returns a list with an array of statistic on each motif and an list of all the pwms
#'
#' @export
readMEME <- function( filename ) {
file <- XML::xmlParse( file = filename, getDTD = FALSE )
attrs <- plyr::ldply(XML::xpathApply(file,"//motif",XML::xmlAttrs))
pwm <- lapply(mtfs, function(mf) t(plyr::ldply(xpathApply(mf,"pos",xmlAttrs))))
names(pwm) <- sapply( pwm, .pwm2Consensus)
motifs <- list()
motifs$array <- attr
motifs$consensus <- names(pwm)
motifs$pwm <- pwm
return(motifs)
}

.pwm2Concensus <- function( PWM ) {
  pos <- apply( PWM, 2, which.max )
  paste( rownames(PWM)[ pos ], collapse = '' )
}

