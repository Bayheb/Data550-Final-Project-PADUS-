# Final Project

This repository contains my final project for DATA550.

Specifically, this project examines the percentage of 
accessible, recreational, protected park areas covering each
metro county of interest in Atlanta.

## Contents
 - 'data/' : input padus_ar_cov_trct.csv used for the analysis

 - 'code/' : R scripts for loading and cleaning the data, creating table 1,
          creating the boxplot, and rendering the final report
          
 - 'output/' : generated outputs including the cleaned data, table1, and boxplot

 - 'final_report.Rmd': source file for the final report

 - 'Makefile': file used to build the final report

## Report contents
The final report includes:

   - A brief introduction of the data
  
   - Table 1:Summary Statistics
  
  -  Figure 1: Park Percentage by Metro Counties

## Reproducing the package environment
Use 'renv' to manage R package versions required for this project. 
To restore the package environment, run:
```bash
make install
```

## Building the report
From the repository directory, run:

```bash
make
```

## Building the report using docker
The Makefile pulls the Docker image `bayheb/padus_6` from Docker Hub.

From the terminal, run:
  ```bash 
  docker build bayheb/padus_6
  open final_report/final_report.html
  ```
  


