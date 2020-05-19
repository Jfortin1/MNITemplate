
<!-- README.md is generated from README.Rmd. Please edit that file -->

# MNITemplate

<!-- badges: start -->

<!-- badges: end -->

The goal of MNITemplate is to provide the MNI Template of T1-weighted
MRI imaging from
<http://www.bic.mni.mcgill.ca/ServicesAtlases/ICBM152NLin2009>. In
addition to the standard template, the image has been segmented into
gray matter, white matter, and cerebrospinal fluid (’CSF’) using the
‘FAST’ algorithm from ‘FSL’
<https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FAST>..

-----

**Creator**: Jean-Philippe Fortin, <jeanphi@mail.med.upenn.edu>

**Authors and Maintainers**: Jean-Philippe Fortin, John Muschelli


##### Software status

| Resource:   | Travis CI                                                                                                                                            |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| Platform:   | Linux                                                                                                                                                |
| R CMD check | <a href="https://travis-ci.org/Jfortin1/MNITemplate"><img src="https://travis-ci.org/Jfortin1/MNITemplate.svg?branch=master" alt="Build status"></a> |

## Table of content

  - [1. Introduction](#id-section1)
  - [2. Reading the data into R](#id-section2)
  - [3. Files](#id-section3)

## 1\. Introduction

The MNI152 template that is included with FSL:
<https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/Atlases>

## 2\. Reading the data into R

``` r
library(MNITemplate)
readMNI("T1")
```

## 3\. Files

| File                                     | Description                                             | Reader                             |
| ---------------------------------------- | ------------------------------------------------------- | ---------------------------------- |
| MNI152\_TI\_1mm.nii.gz                   | T1-w MNI Template, 1mm                                  | `readMNI("T1")`                    |
| MNI152\_TI\_1mm\_Brain.nii.gz            | T1-w MNI Template, 1mm, skull stripped                  | `readMNI("Brain")`                 |
| MNI152\_TI\_1mm\_Brain\_Mask.nii.gz      | T1-w MNI Template, 1mm, brain mask                      | `readMNI("Brain_Mask")`            |
| MNI152\_TI\_2mm.nii.gz                   | T1-w MNI Template, 2mm                                  | `readMNI("T1", res="2mm")`         |
| MNI152\_TI\_2mm\_Brain.nii.gz            | T1-w MNI Template, 2mm, skull stripped                  | `readMNI("Brain", res="2mm")`      |
| MNI152\_TI\_2mm\_Brain\_Mask.nii.gz      | T1-w MNI Template, 2mm, brain mask                      | `readMNI("Brain_Mask", res="2mm")` |
| **Tissue Segmentation:**                 |                                                         |                                    |
| MNI152\_TI\_1mm\_Brain\_FAST\_seg.nii.gz | FSL FAST tissue classes (1=CSF, 2=GM, 3=WM) for 1mm res | `readMNISeg()`                     |
| MNI152\_TI\_2mm\_Brain\_FAST\_seg.nii.gz | FSL FAST tissue classes (1=CSF, 2=GM, 3=WM) for 2mm res | `readMNISeg(res="2mm")`            |
