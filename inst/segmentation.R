library(fslr)

# Segmentation with FSL FAST for 1mm
temp <- readNIfTI("../data/MNI152_T1_1mm_Brain.nii.gz")
seg  <- fast(temp, opts="-t 1 -n 3", verbose=FALSE, retimg=FALSE, outfile="../data/MNI152_T1_1mm_Brain_Brain_FAST")

# Segmentation with FSL FAST for 2mm
temp <- readNIfTI("../data/MNI152_T1_2mm_Brain.nii.gz")
seg  <- fast(temp, opts="-t 1 -n 3", verbose=FALSE, retimg=FALSE, outfile="../data/MNI152_T1_2mm_Brain_Brain_FAST")