#' Compute NPV-adjusted profit from almond yield and climate data
#'
#' Calculates almond yield from minimum temperature and precipitation,
#' computes revenue and discounts revenue and costs to net present value (NPV)
#' to estimate annual profit.
#'
#' @param combined_temp_precip Data frame with year, minimum temperature
#' (`tmin_c`), and precipitation (`precip`).
#' @param cost Numeric scalar giving annual cost.
#' @param discount Numeric scalar giving the discount rate.
#' @param price Numeric scalar giving price per unit yield.
#'
#' @return Data frame of annual yield, revenue, NPV-adjusted costs, and profit.
#'
#' @examples yield_profit(combined_temp_precip)
#'
#' @export

yield_profit <- function(combined_temp_precip, cost = 1500, 
                         discount = 0.12, price = 2100) {
  
  # Create combined table with tmin temp, precip, and yield
  combined_pt_yield <- combined_temp_precip %>%
    mutate(yield = almond_yield(tmin_c, precip))
  
  yield <- combined_pt_yield$yield
  year <- combined_pt_yield$year
  
  # generate a unique identifier or scenario number
  # Sequential number equivalent to length of yield values vector
  scen <- seq(from = 1, to = length(yield), by = 1) 
  yearprofit <- data.frame(scen = scen, yield = yield, year = year)
  
  # This column is revenue without inflation
  yearprofit$revenue <- yearprofit$yield * price 
  
  yearprofit <- yearprofit %>%
    
    # NPV adjusted revenue
    mutate(revenue_npv = revenue_NPV(revenue = revenue, 
                                     time = year - year[1], 
                                     discount = discount), 
          
            # NPV adjusted cost
           cost_npv = cost_NPV(cost = cost, 
                               time = year - year[1], 
                               discount = discount)) 
  
  # calculate profit
  yearprofit<- yearprofit %>%
    mutate(profit = yearprofit$revenue_npv-yearprofit$cost_npv)
  
  return(yearprofit)
  
}
