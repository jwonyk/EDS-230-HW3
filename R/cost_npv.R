#' Calculate cost adjusted for net present value
#'
#' Discounts a fixed cost over time using a constant discount rate to
#' compute its net present value (NPV).
#'
#' @param cost Numeric scalar giving the fixed cost at time 0.
#' @param time Numeric vector of time periods (ex. years since baseline).
#' @param discount Numeric scalar giving the discount rate (default: 0.12).
#'
#' @return Numeric vector of NPV-adjusted costs corresponding to `time`.
#'
#' @examples cost_NPV(cost = 1500, time = 0:5)
#'
#' @export

cost_NPV <- function(cost, time, discount = 0.12) {
  
  result <- cost / ((1 + discount) ** time)
  
  return(result)

  }
