# Assignment #3 & #4 – Almond Yield Anomaly Modeling and Almond Profit Sensitivity Analysis

## Purpose of this project

This project focuses on developing a simple climate–crop response model and extending it to evaluate the economic implications of climate-driven yield variability for almond production. Using regression coefficients reported in Lobell et al. (2006), the model translates daily climate observations into annual predictors and applies a transfer function to quantify almond yield anomalies. These yield anomalies are then used as inputs to a stylized profit model to explore how climate variability may influence almond profitability.

The primary objectives of this project are to:

-   Develop a conceptual climate-crop model and represent it diagrammatically
-   Implement the model as a reusable R function
-   Apply the model to daily climate data and aggregate relevant predictors
-   Validate modeled almond yield anomalies against expected summary statistics
-   Integrate yield anomalies into a simplified almond profit model
-   Perform an informal sensitivity analysis to explore profit responses to parameter uncertainty

## Repository Structure

``` bash
EDS-230-HW-ALMOND-YIELD-PROFIT
├── data
│   └── clim.txt
├── EDS-230-HW-ALMOND-YIELD-PROFIT.Rproj
├── HW3_Almond_Model.qmd
├── HW4_Almond_Profit.qmd
├── R
│   ├── almond_yield.R
│   ├── cost_npv.R
│   ├── revenue_npv.R
│   └── yield_profit.R
└── README.md
```

## Data Access

This project uses a daily climate dataset (`clim.txt`) provided as part of the course materials.

#### Climate Data

The dataset contains daily observations with the following variables:

-   `day`: day of observation
-   `month`: month of observation
-   `year`: calendar year
-   `wy`: water year
-   `tmax_c`: daily maximum temperature (°C)
-   `tmin_c`: daily minimum temperature (°C)
-   `precip`: daily precipitation (mm)

## Model Description

#### Almond Yield Anomaly Model

The almond yield anomaly model is based on regression equations reported in Lobell et al. (2006). The model estimates annual yield anomaly (ton/acre) as a function of:

-   February minimum temperature (Celsius)
-   January total precipitation (mm)

We also included both linear and quadratic terms. The model is implemented as a vectorized R function (`almond_yield()`), allowing efficient evaluation across multiple years.

#### Almond Profit Model

The almond profit model builds on the yield anomaly model by translating climate-driven yield changes into economic outcomes. A baseline yield and profit structure is assumed, and yield anomalies are used to adjust annual production.

The profit model incorporates:

-   Yield anomalies from the almond yield model
-   Revenue functions based on assumed almond prices
-   Cost functions representing production and management expenses

The profit calculations are implemented using modular R functions (`revenue_npv()`, `cost_npv()`, and `yield_profit()`), allowing flexible experimentation with economic assumptions.

## Authorship

-   The project author(s): **Leela Dixit, Jay Kim, Richard Montes Lemus**
-   Instructor: **Naomi Tague**
-   Teaching Assistant: **Ojas Sarup**

## Reference

Lobell, D. B., Field, C. B., Cahill, K. N., & Bonfils, C. (2006). *Impacts of future climate change on California perennial crop yields: Model projections with climate and crop uncertainties*. Agricultural and Forest Meteorology, 141(2–4), 208–218.
