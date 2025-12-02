DESCRIPTION = "Custom Raspberry Pi 4 image with WiFi, SSH, bash, and systemd networking"
LICENSE = "MIT"

require recipes-core/images/core-image-base.bb

IMAGE_FEATURES += "package-management"

# Packages
IMAGE_INSTALL += " \
    bash \
    libstdc++ \
    mtd-utils \
    coreutils \
    procps \
    util-linux-lsblk \
    openssh openssl openssh-sftp-server \
    systemd systemd-analyze \
    wpa-supplicant \
    iw \
    wireless-regdb-static \
    linux-firmware-rpidistro-bcm43455 \
    python3 \
    vim-tiny \
    swupdate \
"
