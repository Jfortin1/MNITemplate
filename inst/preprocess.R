library(fslr)

### Let's create our MNI152 template with ventricles on for mm1:
dir <- file.path(fsl_data_dir(), "standard")
head <- readNIfTI(file.path(dir, "MNI152_T1_1mm.nii.gz"), reorient=FALSE)
mask <- readNIfTI(file.path(dir, "MNI152_T1_1mm_first_brain_mask.nii.gz"), reorient=FALSE)
brain <- head * mask
writeNIfTI(head, "extdata/MNI152_T1_1mm")
writeNIfTI(mask, "extdata/MNI152_T1_1mm_Brain_Mask")
writeNIfTI(brain, "extdata/MNI152_T1_1mm_Brain")

### Let's create our MNI152 template with ventricles on for mm2:
dir   <- file.path(fsl_data_dir(), "standard")
head  <- readNIfTI(file.path(dir, "MNI152_T1_2mm.nii.gz"), reorient=FALSE)
mask  <- readNIfTI(file.path(dir, "MNI152_T1_2mm_brain_mask_dil1.nii.gz"), reorient=FALSE)
brain <- head * mask
writeNIfTI(head, "extdata/MNI152_T1_2mm")
writeNIfTI(mask, "extdata/MNI152_T1_2mm_Brain_Mask")
writeNIfTI(brain, "extdata/MNI152_T1_2mm_Brain")




# getMNITemplatePath <- function(what=c("full", "brain", "brain_mask"), res=c("1mm", "2mm")){
# 	require(fslr)
# 	dir <- file.path(fsl_data_dir(), "standard")
# 	what <- match.arg(what)
# 	res  <- match.arg(res)
#     if (what == "full") {
#         file <- file.path(dir, paste0("MNI152_T1_",res,".nii.gz"))
#     }
#     else if (what == "brain") {
#         file <- file.path(dir, paste0("MNI152_T1_",res,"_brain.nii.gz"))
#     }
#     else if (what == "brain_mask") {
#         file <- file.path(dir, paste0("MNI152_T1_",res,"_brain_mask.nii.gz"))
#     }
#     file
# }
