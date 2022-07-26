# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# modified from ebuild available in the touchfish-os overlay

EAPI=8
MULTILIB_COMPAT=(abi_x86_{32,64})
inherit multilib-minimal

_internal_name=GE-Proton${PV/./-}
DESCRIPTION="A fancy custom distribution of Wine with various patches"
HOMEPAGE="https://github.com/GloriousEggroll/wine-ge-custom"
SRC_URI="https://github.com/GloriousEggroll/wine-ge-custom/releases/download/${_internal_name}/wine-lutris-${_internal_name}-x86_64.tar.xz -> ${P}.tar.xz"
LICENSE="BSD LGPL zlib MIT MPL OFL Proton GPL MSPL"
SLOT="${PV}"
KEYWORDS="~amd64"
RESTRICT="mirror strip"

RDEPEND="
	media-libs/mesa[vulkan,${MULTILIB_USEDEP}]
	media-libs/vulkan-loader[${MULTILIB_USEDEP}]"

QA_PREBUILT={*}
S="${WORKDIR}"

src_install() {
	dodir "/opt/wine-ge-custom"
	mv "${S}/lutris-${_internal_name}-x86_64" "${D}/opt/wine-ge-custom" || die
}

#IDEPEND=">=app-eselect/eselect-wine-2"
#pkg_postinst() {
	#eselect wine register ${P}
	#if [[ ${PN} == "wine-vanilla" ]]; then
	#	eselect wine register --vanilla ${P} || die
	#fi

#	eselect wine update --if-unset || die
#}
#pkg_postrm() {
	#eselect wine deregister ${P}
	#if [[ ${PN} == "wine-vanilla" ]]; then
	#	eselect wine deregister --vanilla ${P} || die
	#fi

#	eselect wine update --if-unset || die
#}
