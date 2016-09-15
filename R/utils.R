#' @title Get MNI Path of File
#' @description Returns the path of a MNI file to the user.
#' @param what Type of image to return
#' @param res Resolution of the image, in millimeters
#'
#' @return Character filename of path
#' @export
#'
#' @importFrom oro.nifti readNIfTI
#' @examples
#' getMNIPath()
getMNIPath <- function(what=c("T1", "Brain", "Brain_Mask"), res=c("1mm", "2mm")){
  what <- match.arg(what)
  res  <- match.arg(res)
  
  app = switch(what, 
               "T1" = "",
               "Brain" = "_Brain",
               "Brain_Mask" = "_Brain_Mask"
  )
  fname = file.path("extdata", paste0("MNI152_T1_", res, app, ".nii.gz"))
  file <- system.file(fname, package = "MNITemplate" )
  
  # if (what=="T1"){
  # } else if (what=="Brain"){
  #     file <- system.file(package="MNITemplate", paste0("extdata/MNI152_T1_", res, "_Brain.nii.gz"))
  # } else if (what=="Brain_Mask"){
  #     file <- system.file(package="MNITemplate", paste0("extdata/MNI152_T1_", res, "_Brain_Mask.nii.gz"))
  # } 
  file
}

#' @title Reads MNI File into R
#' @description Matches the argument to pass to \code{\link{getMNIPath}},
#' then reads the NIfTI image into R
#' @param ... Arguments to pass to \code{\link{getMNIPath}}
#' @param reorient Should the image be reoriented? 
#' Passed to \code{\link{readNIfTI}}
#'
#' @return Object of class \code{nifti}
#' @export
#'
#' @examples
#' readMNI(what = "Brain_Mask", res = "2mm")
readMNI  <- function(..., reorient=FALSE){
  readNIfTI(getMNIPath(...), reorient = reorient)
}


#' @title Get MNI Path of Segmentation File
#' @description Returns the path of a MNI file of a segmentation to the user.
#' @param alg Algorithm to do the segmentation
#' @param res Resolution of the image, in millimeters
#'
#' @return Character filename of path
#' @export
#'
#' @examples
#' getMNISegPath()
getMNISegPath <- function(alg="FAST", res=c("1mm", "2mm")){
  alg = match.arg(alg)
  if (alg != "FAST") {
    stop("Only FAST segmentation available at the moment.")
  }
  res  <- match.arg(res)
  file <- system.file(
    package = "MNITemplate", 
    file.path("extdata", 
              paste0("MNI152_T1_", res, "_Brain_", alg, "_seg.nii.gz")
    )
  )
  file
}


#' @title Reads MNI Segmentation File into R
#' @description Matches the argument to pass to \code{\link{getMNISegPath}},
#' then reads the NIfTI image of the segmetation into R
#' @param ... Arguments to pass to \code{\link{getMNISegPath}}
#' @param reorient Should the image be reoriented? 
#' Passed to \code{\link{readNIfTI}}
#' @param verbose Print diagnostic messages of the labels
#'
#' @return Object of class \code{nifti}
#' @export
#'
#' @examples
#' readMNISeg(res = "2mm")
readMNISeg <- function(..., reorient=FALSE, verbose=TRUE){
  if (verbose) {
    message("Label 0: Background \n")
    message("Label 1: CSF \n")
    message("Label 2: GM \n")
    message("Label 3: WM \n")
  }
  readNIfTI(getMNISegPath(...), reorient = reorient)
}
