# Analysing GeoMX DSP dataset with standR

![flowchart](../inst/images/workflow.jpg "GeoMX data analysis")

## Overview

This workshop will focus on performing analysis of spatial transcriptomics data from the Nanostring GeoMX DSP platform. We will perform data QC, normalisation and batch correction using methods in the `standR` package to analyse a publicly available GeoMX WTA dataset. Following this, we will perform differential expression analysis using tools from the `limma` and `edgeR` packages. Finally, we will carry out a gene set enrichment analysis (GSEA) using `fry` from the `limma` package and visualise and interpret the GSEA results using the `vissE` package.

The workshop will be organised into two broad sections:
* Processing and analysing the data using standR
* Performing DE analysis and GSEA

Detailed material can be found [here](https://davislaboratory.github.io/GeoMXAnalysisWorkflow/).

## Pre-requisites 

The workshop is aimed at researchers who are interested in analysing GeoMX transcriptomics data. 
Some basic R knowledge is assumed - this is not an introduction to R course. 
If you are not familiar with the R statistical programming language it is strongly suggested that you work through an introductory R course before you attend this workshop.

## _R_ packages used

The following key R packages will be used: 

* `standR`
* `edgeR`
* `limma`
* `msigdb`
* `GSEABase`
* `igraph`
* `vissE`
* `SpatialExperiment`
* `Scater`

## Time outline

| Activity                                                        | Time |
|-----------------------------------------------------------------|------|
| Introduction & setup                                            | 10m  |
| Part 1. Processing and analysing the data using standR          | 45m  |
| Part 2. Performing DE analysis and GSEA                         | 45m  |
| Q & A                                                           | 10m  |


## Workshop goals and objectives

### Learning goals

 - Learn how to analyse GeoMX transcriptomics data using standR.
 - Learn how to perform DE analysis with the GeoMX transcriptomics data using limma.
 - Learn how to visualize the GSEA results using vissE.

### Learning objectives

 - Generate QC plots for the GeoMX transcriptomics data.
 - Perform normalisation/batch correction on the GeoMX transcriptomics data.
 - Assessing the normalisation/batch correction results.
 - Perform differential expression ananlysis on the GeoMX transcriptomics data.
 - Perform gene set enrichment analysis on the DE results.
 - Apply vissE to identify higher-order phenotypes and to visualise the GSEA results.

## Workshop package installation 

### Guide

This is necessary in order to reproduce the code shown in the workshop. 
The workshop is designed for R `4.2` and Bioconductor `3.15` and can be installed via GitHub with the following command.

```
install.packages('remotes')

# Install workshop package
remotes::install_github("DavisLaboratory/GeoMXAnalysisWorkflow", build_vignettes = TRUE)

# To view vignettes
library(GeoMXAnalysisWorkflow)
browseVignettes("GeoMXAnalysisWorkflow")
```


## To use the resulting image:

```sh
docker run -e PASSWORD=<choose_a_password_for_rstudio> -p 8787:8787 ghcr.io/ningbioinfo/geomxanalysisworkflow:latest
```

Once running, navigate to http://localhost:8787/ and then login with Username:rstudio and Password:password.

You should see the Rmarkdown file with all the workshop code which you can run.

*NOTE*: Running docker that uses the password in plain text like above exposes the password to others 
in a multi-user system (like a shared workstation or compute node). In practice, consider using an environment 
variable instead of plain text to pass along passwords and other secrets in docker command lines. 

