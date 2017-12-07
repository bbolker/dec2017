#' @import gamlss gamlss.tr gamlss.dist
NULL

#' Use GAMLSS
#'
#' Generate a truncated distribution and use it.
#' @export
use_gamlss <- function() {
  print("gen.trun():")
  gamlss.tr::gen.trun(par=0,family=TF)
    #Error in inherits(object, "gamlss.family") : object 'TF' not found
  #gamlss.tr::gen.trun(par=0,family=gamlss.dist::TF)
    #Error in parse(text = fname) : <text>:1:1: unexpected '::'
  y = rTFtr(1000,mu=10,sigma=5, nu=5)

  print("trun():")
  truncated_dist = gamlss.tr::trun(par=0,family=TF, local=TRUE)
  model = gamlss(y~1, family=truncated_dist)
  print(model)
}

