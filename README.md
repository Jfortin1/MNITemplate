
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

For a template with a full white-matter parcellation map, see our [EveTemplate package](https://github.com/Jfortin1/EveTemplate).

-----

**Creator**: Jean-Philippe Fortin, <fortin946@gmail.com>

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

We first load the package into R:
```{r}
library(MNITemplate)
```

Once the package is loaded into R, use the command `readMNI()` to import the MNI template T1-w image as a `nifti` object into R:
```{r}
mni_t1 <- readMNI()
```
One can use the function `orthographic` from the `oro.nifti` package to visualize the template:
```{r}
orthographic(mni_t1)
```
<p align="center">
<img src="https://github.com/Jfortin1/MNITemplate/blob/master/inst/figures/mni_t1.png" width="600"/>
</p>

In many preprocessing pipelines, the path of the template file in the system must be specified. For this, use the following:
```{r}
mni_path <- getMNIPath()
```
and to get brain mask:
```{r}
mni_brain_mask_path <- getMNIPath("Brain_Mask")
```

<div id='id-section3'/>

## 3. Segmentation

We performed a 3-tissue class segmentation of the T1w MNI template using the FSL FAST segmentation algorithm via the `fslr` package. The script that was used to perform the segmentation can be found [here](https://github.com/Jfortin1/MNITemplate/blob/master/inst/segmentation.R). The segmentation labels are 0 for Background (outside of the brain), 1 for cerebrospinal fluid (CSF), 2 for grey matter (GM) and 3 for white matter (WM). Let's read the segmentation classes into R:
```{r}
seg <- readMNISeg()
orthographic(seg)
```
<p align="center">
<img src="https://github.com/Jfortin1/MNITemplate/blob/master/inst/figures/mni_seg.png" width="600"/>
</p>

If one wishes to create a WM mask, could do the following:
```{r}
wm_mask <- seg
wm_mask[wm_mask!=3] <- 0
```
and similarly for the other tissues. 

<div id='id-section4'/>


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
