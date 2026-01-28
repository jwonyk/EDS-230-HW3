#' Calculate revenue adjusted for net present value
#'
#' Discounts revenue over time using a constant discount rate to compute
#' its net present value (NPV).
#'
#' @param revenue Numeric scalar or vector giving revenue at each time period.
#' @param time Numeric vector of time periods (e.g., years since baseline).
#' @param discount Numeric scalar giving the discount rate (default: 0.12).
#'
#' @return Numeric vector of NPV-adjusted revenue values.
#'
#' @examples revenue_NPV(revenue = 2100, time = 0:5)
#'
#' @export

revenue_NPV <- function(revenue, time, discount = 0.12) {
  
  result <- revenue / ((1 + discount) ** time)
  
  return(result)
  
}