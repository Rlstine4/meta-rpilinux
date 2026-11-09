# meta-rpilinux

This repository is the custom Yocto metadata layer used by the top-level
[`yocto-raspberrypi`](https://github.com/Rlstine4/yocto-raspberrypi) project.
The parent repository provides Poky, the Raspberry Pi BSP, other layer dependencies, build
configuration.

For build setup and environment requirements, see the top-level project
README. From the top-level repository, initialize submodules and build with:

```sh
git submodule update --init
source poky/oe-init-build-env build
bitbake rpilinux-image
```

The image artifacts are generated under
`build/tmp/deploy/images/raspberrypi4-64/`.

## Layer contents

- `recipes-rpilinux/images/rpilinux-image.bb` defines `rpilinux-image`, based
  on `core-image-base`. It adds package management and packages for SSH, Wi-Fi,
  systemd, common command-line tools, Python, and SWUpdate.
- `conf/layer.conf` declares compatibility with Yocto Scarthgap and enables
  systemd and `usrmerge` as distro features.
- `recipes-core/systemd/files/10-eth-static.network` configures `eth0` with
  static address `10.0.1.10/24` and gateway `10.0.1.1`.
- `recipes-core/base-files/fstab` supplies the image's `/etc/fstab`, mounting
  `/dev/mmcblk0p1` at `/boot` and the root filesystem at `/`.
