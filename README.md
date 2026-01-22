# Assignment #3 - Almond Yield Anomaly Modeling

## Purpose of this project

This project focuses on implementing a simple climate–crop response model to estimate annual almond yield anomalies based on temperature and precipitation inputs. Using regression coefficients reported in Lobell et al. (2006), the model translates daily climate observations into annual predictors and applies a transfer function to quantify yield anomaly responses to climate variability.

The primary objectives of this assignment are to:

- Conceptualize a climate-crop model through a clear diagrammatic representation,

- Implement the conceptual model as a reusable R function,

- Apply the model to a provided daily climate dataset, and

- Validate model outputs against expected summary statistics.

## Repository Structure

``` bash
EDS-230-HW3
└── README.md
└── EDS-230-Almond-Yield-Model.Rproj
└── almond_yield.R
└── almond_model.qmd
└── data/
│   └── clim.txt
└── images/
│   └── almond_conceptual_model.png
└── R/

```

## Data Access

This project uses a daily climate dataset (clim.txt) provided as part of the course materials.

#### Climate Data

The dataset contains daily observations with the following variables:

- `day`: day of observation
- `month`: month of observation
- `year`: calendar year
- `wy`: water year
- `tmax_c`: daily maximum temperature (°C)
- `tmin_c`: daily minimum temperature (°C)
- `precip`: daily precipitation (mm)

## Model Description

The almond yield anomaly model is based on regression equations reported in Lobell et al. (2006). The model estimates annual yield anomaly (ton/acre) as a function of:

- February minimum temperature (Celsius)
- January total precipitation (mm)

We also included both linear and quadratic terms. The model is implemented as a vectorized R function (almond_yield()), allowing efficient evaluation across multiple years.

## Authorship

- The project author(s): **Leela Dixit, Jay Kim, Richard Montes Lemus** 
- Instructor: **Naomi Tague** 
- Teaching Assistant: **Ojas Sarup**

## Reference

Lobell, D. B., Field, C. B., Cahill, K. N., & Bonfils, C. (2006). *Impacts of future climate change on California perennial crop yields: Model projections with climate and crop uncertainties*. Agricultural and Forest Meteorology, 141(2–4), 208–218.