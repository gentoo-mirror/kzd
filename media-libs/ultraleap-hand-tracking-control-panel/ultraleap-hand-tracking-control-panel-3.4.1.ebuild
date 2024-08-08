# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="A visualisation and settings management tool for the Ultraleap Tracking Service."
HOMEPAGE="https://docs.ultraleap.com/linux/"

pkgname=ultraleap-hand-tracking-control-panel
pkgver=3.4.1
pkgrel=2
SRC_URI="https://repo.ultraleap.com/apt/pool/main/u/${pkgname}/${pkgname}_1125862.deb"

S="${WORKDIR}"

LICENSE="PROPRIETARY"
SLOT="0"
KEYWORDS="~amd64"
#IUSE="gnome X"

#RESTRICT="strip"

#RDEPEND=""

#DEPEND="${RDEPEND}"

#BDEPEND="virtual/pkgconfig"

src_unpack() {
	unpack_deb "${A}"
}

#src_configure() {
#}

#src_compile() {
#}

src_install() {
	insinto /
	doins -r *
	fperms +x /opt/${PN}/${PN}
	fperms +x /opt/${PN}/UnityPlayer.so
	#fperms +x /usr/lib/${PN}/libUltraleapHandTracking.so.1.6.5.0

	#insinto /etc/ld.so.conf.d
	#doins ${WORKDIR}/../files/${PN}.conf
}
