# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg

if [[ "${PV}" == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/Vencord/Vesktop"
	inherit git-r3
else
	SRC_URI="https://github.com/Vencord/Vesktop/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/Vesktop-${PV}"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Vesktop gives you the performance of web Discord and the comfort of Discord Desktop"
HOMEPAGE="https://github.com/Vencord/Vesktop"
LICENSE="GPL-3"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test ) network-sandbox"

BDEPEND="
	net-libs/nodejs
"
RDEPEND="
	x11-libs/libnotify
	x11-misc/xdg-utils
"

src_configure() {
	npm install --legacy-peer-deps
}

src_compile() {
	npm run build
	npm exec electron-builder -- --dir
}

src_test() {
	npm run lint
	npm run testTypes
}

src_install() {
	dodir /opt/vesktop
	cp -rp dist/linux-unpacked/* "${D}/opt/vesktop"

	newicon static/icon.png vesktop.png
	make_desktop_entry /opt/vesktop/vesktop Vesktop vesktop
}
