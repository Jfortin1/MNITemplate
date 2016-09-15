library(fslr)

# Segmentation with FSL FAST for 1mm
temp <- readNIfTI("extdata/MNI152_T1_1mm_Brain.nii.gz")
seg  <- fast(temp, opts="-t 1 -n 3", verbose=FALSE, retimg=FALSE, outfile="extdata/MNI152_T1_1mm_Brain_FAST")

# Segmentation with FSL FAST for 2mm
temp <- readNIfTI("extdata/MNI152_T1_2mm_Brain.nii.gz")
seg  <- fast(temp, opts="-t 1 -n 3", verbose=FALSE, retimg=FALSE, outfile="extdata/MNI152_T1_2mm_Brain_FAST")
