require recipes-core/images/core-image-minimal.bb

IMAGE_INSTALL += " \
    libstdc++ \
    mtd-utils \
    openssh openssl openssh-sftp-server \
    systemd systemd-analyze \
"
