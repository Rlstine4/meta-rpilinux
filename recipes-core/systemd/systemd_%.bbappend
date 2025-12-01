DESCRIPTION = "Static IP configuration for eth0"

PACKAGECONFIG:append = " networkd resolved"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

NETWORK_CFG = "10-eth-static.network"

SRC_URI += "file://${NETWORK_CFG}"

FILES_${PN} += "${sysconfdir}/systemd/network/${NETWORK_CFG}"

do_install:append() {
    install -d ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/${NETWORK_CFG} ${D}${sysconfdir}/systemd/network/${NETWORK_CFG}
}