# You Are What You Eat: An analysis of the efficacy of folic acid food fortification initiatives on the prevalence of neural tube defects in newborns

This contains replication materials for the POLS 503 project of Chad Ikeda.

## Organization

Description of added files:
	- '/src/diffindiff_function.R'
		- main function for analysis
		- is modular for various loc/sex/age combos
		- requires data loading from /repo/data/
	- /data/ (folder within repo)
		- 'data_dictionary.csv' - reference for IHME ids numerical to string meanings
		- 'ntd_prev.csv' - contains all prevalence data, merged with treatment dummy variable
			- years 1990-2017
			- 15 countries (sample selected, varying across regions, and treatment statuses)
		- 'locnames.csv' - location names tied to location_id, for merging in diffindiff_function.R

## Install

This project depends on [R](https://cran.r-project.org/). 
You will need to install several R packages for this project:
```r
# List of the packages this project depends on
packages <- c("tidyverse", "broom", "ggplot2")
install.packages(packages)
```
## Run instructions

In order to successfully knit, you must change the 'repodir' in the "Ikeda_Chad_you_are_what_you_eat.Rmd" and "src/diffindiff_function.R"
	- Former requires repodir to point to diffindiff_function.R in src folder within repo
	- Latter requires repodir to point to datasets in repo/data folder

## Build

The analysis should be able to run provided proper sourcing of 'diffindiff_function.R', for use of my function 'diff_in_diff'. The dataset I've provided ('data/ntd_prev.csv') has more locations/ages/sexes than I've run DD analyses on. If you are curious, please feel free to change arguments to my function