# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="Ultraleap Hand Tracking service and SDK for development."
HOMEPAGE="https://docs.ultraleap.com/linux/"

pkgname=ultraleap-hand-tracking-service
pkgver=5.17.1.0_a9f25232
pkgrel=2
SRC_URI="https://repo.ultraleap.com/apt/pool/main/u/ultraleap-hand-tracking-service/ultraleap-hand-tracking-service_5.17.1.0-a9f25232-1.0_amd64.deb"

S="${WORKDIR}"

LICENSE="PROPRIETARY"
SLOT="0"
KEYWORDS="~amd64"
#IUSE="gnome X"

#RESTRICT="strip"

RDEPEND="
	sys-devel/gcc
	sys-libs/glibc
	sys-process/psmisc
"

DEPEND="${RDEPEND}"

#BDEPEND="virtual/pkgconfig"

src_unpack() {
	unpack_deb "${A}"
}

src_prepare() {
	# Remove last line to replace it with something more sensible
	sed -i '$ d' "${WORKDIR}/usr/lib/x86_64-linux-gnu/cmake/LeapSDK/leapsdk-config.cmake"
	echo "include(/usr/lib/cmake/LeapC/LeapCTargets.cmake)" >> "${WORKDIR}/usr/lib/x86_64-linux-gnu/cmake/LeapSDK/leapsdk-config.cmake"
	default
}

#src_configure() {
#}

#src_compile() {
#}

src_install() {
	insinto /
	doins -r *
	fperms +x /usr/lib/${PN}/libLeapC.so.5
	fperms +x /usr/lib/${PN}/liblibrealuvc.so.0.1.1
	fperms +x /usr/bin/leapd
	fperms +x /usr/bin/leapctl

	insinto /etc/ultraleap
	doins ${WORKDIR}/../files/analytics_config.json

	insinto /etc/ld.so.conf.d
	doins ${WORKDIR}/../files/${PN}.conf

	insinto /usr/lib/sysusers.d
	doins ${WORKDIR}/../files/leap.conf

	#insinto /usr/lib/tmpfiles.d
	#doins ${WORKDIR}/../files/leap.conf

	insinto /etc/init.d
	doins ${WORKDIR}/../files/ultraleap-hand-tracking-service
	fperms +x /etc/init.d/${PN}
}
