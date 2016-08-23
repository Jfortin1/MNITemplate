# MNITemplate
### MNI152 Template
--------

**Creator**: Jean-Philippe Fortin, jeanphi@mail.med.upenn.edu

**Authors**: Jean-Philippe Fortin, John Muschelli, Russell T. Shinohara

##### Software status

| Resource:      | Travis CI     |
| -------------  |  ------------- |
| Platform:      | Linux       |
| R CMD check    | <a href="https://travis-ci.org/Jfortin1/MNITemplate"><img src="https://travis-ci.org/Jfortin1/MNITemplate.svg?branch=master" alt="Build status"></a> |



## Table of content
- [1. Introduction](#id-section1)
- [2. Reading the data into R](#id-section2)
- [3. Files](#id-section3)


<div id='id-section1'/>
## 1. Introduction

The MNI152 template.

<div id='id-section2'/>
## 2. Reading the data into R

<div id='id-section3'/>
## 3. Files

| File      | Description     | Reader | 
| -------------  | -------------  | -------------  |
| MNI152_TI_1mm.nii.gz    | T1-w MNI Template, 1mm |  `readMNITemplate("T1")`| 
| MNI152_TI_1mm_Brain.nii.gz | T1-w MNI Template, 1mm, skull stripped  |  `readMNITemplate("Brain")`| 
| MNI152_TI_1mm_Brain_Mask.nii.gz | T1-w MNI Template, 1mm, brain mask  |  `readMNITemplate("Brain_Mask")`| 
| MNI152_TI_2mm.nii.gz    | T1-w MNI Template, 2mm |  `readMNITemplate("T1", res="2mm")`| 
| MNI152_TI_2mm_Brain.nii.gz | T1-w MNI Template, 2mm, skull stripped  |  `readMNITemplate("Brain", res="2mm")`| 
| MNI152_TI_2mm_Brain_Mask.nii.gz | T1-w MNI Template, 2mm, brain mask  |  `readMNITemplate("Brain_Mask", res="2mm")`| 
|**Tissue Segmentation:**  | | |
| MNI152_TI_1mm_Brain_FAST_seg.nii.gz    | FSL FAST tissue classes (1=CSF, 2=GM, 3=WM) for 1mm res |  `readMNISeg()`| 
| MNI152_TI_2mm_Brain_FAST_seg.nii.gz    | FSL FAST tissue classes (1=CSF, 2=GM, 3=WM) for 2mm res |  `readMNISeg(res="2mm")`| 

