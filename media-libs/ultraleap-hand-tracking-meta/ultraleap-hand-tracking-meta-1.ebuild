# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# taken from ebuild in the touchfish-os overlay

EAPI=8

DESCRIPTION="Meta package for Ultraleap Hand Tracking"
HOMEPAGE="https://docs.ultraleap.com/linux/"
SRC_URI=""
LICENSE="metapackage"

SLOT="0"
KEYWORDS="~amd64"
#IUSE="kde gnome"

DEPEND=""

# converted and modified from AUR https://aur.archlinux.org/packages/ultraleap-hand-tracking
RDEPEND="
	media-libs/openxr-layer-ultraleap
	media-libs/ultraleap-hand-tracking-service
	media-libs/ultraleap-hand-tracking-control-panel
	acct-user/leap
	acct-group/leap
"

pkg_pretend() {
	einfo "This package pulls in the three packages related to ultraleap hand tracking for linux."
}
