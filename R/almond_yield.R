#' Almond yield anomaly model based on Lobell et al. (2006)
#' 
#' Model to determining projected almond yield based on climate parameters
#'
#' @param tmin_feb Numeric vector of minimum temperatures in February per year.
#' @param precip_jan Numeric vector of total precipitation in January per year.
#'
#' @returns Numeric vector of annual almond yield anomalies (ton/acre).
#' 
#' @examples almond_yield(tmin_feb = 5.6, precip_jan = 10)
#' 
#' @export

almond_yield <- function(tmin_feb, precip_jan) {
  
  yield = (-0.015 * tmin_feb) - 
    (0.0046 * (tmin_feb)^2) - 
    (0.07 * precip_jan) + 
    (0.0043 * (precip_jan)^2) + 
    0.28
  
  return(yield)
  
}