getMNITemplatePath <- function(what=c("T1", "Brain", "Brain_Mask"), res=c("1mm", "2mm")){
    what <- match.arg(what)
    res  <- match.arg(res)
    if (what=="T1"){
        file <- system.file(package="MNITemplate", paste0("data/MNI152_T1_", res, ".nii.gz"))
    } else if (what=="Brain"){
        file <- system.file(package="MNITemplate", paste0("data/MNI152_T1_", res, "_Brain.nii.gz"))
    } else if (what=="Brain_Mask"){
        file <- system.file(package="MNITemplate", paste0("data/MNI152_T1_", res, "_Brain_Mask.nii.gz"))
    } 
    file
}


readMNITemplate  <- function(what=c("T1", "Brain", "Brain_Mask"), res=c("1mm", "2mm"), reorient=FALSE){
    what <- match.arg(what)
    res  <- match.arg(res)
    readNIfTI(getMNITemplatePath(what=what, res=res), reorient=reorient)
}



getMNISegPath <- function(alg="FAST", res=c("1mm", "2mm")){
    if (alg!="FAST"){
        stop("Only FAST segmentation available at the moment.")
    }
    res  <- match.arg(res)
    file <- system.file(package="MNITemplate", paste0("data/MNI152_T1_",res,"_Brain_FAST_seg.nii.gz"))
    file
}



readMNISeg <- function(alg="FAST", res=c("1mm", "2mm"), reorient=FALSE, verbose=TRUE){
    if (alg!="FAST"){
        stop("Only FAST segmentation available at the moment.")
    }
    res  <- match.arg(res)
    if (verbose){
        cat("Label 0: Background \n")
        cat("Label 1: CSF \n")
        cat("Label 2: GM \n")
        cat("Label 3: WM \n")
    }
    readNIfTI(getMNISegPath(alg=alg, res=res), reorient=reorient)
}