# Make sure BitBake sees the fstab in this layer
FILESEXTRAPATHS:prepend := "${THISDIR}:"
SRC_URI += "file://fstab"

# Override /etc/fstab after rootfs is built
ROOTFS_POSTPROCESS_COMMAND += "copy_custom_fstab;"

copy_custom_fstab() {
    install -m 0644 ${WORKDIR}/fstab ${IMAGE_ROOTFS}/etc/fstab
}

