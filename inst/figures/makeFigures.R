library(MNITemplate)
mni_t1 <- readMNI()
png("mni_t1.png")
orthographic(mni_t1)
dev.off()

seg <- readMNISeg()
png("mni_seg.png")
orthographic(seg)
dev.off()

