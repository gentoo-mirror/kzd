# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm systemd xdg desktop

DESCRIPTION="Cloudflare Warp Client"
HOMEPAGE="https://1.1.1.1"
SRC_URI="https://pkg.cloudflareclient.com/rpm/x86_64/${P}-1.x86_64.rpm"

LICENSE="all-rights-reserved"
RESTRICT="bindist mirror"
SLOT="0"
KEYWORDS="~amd64"
IUSE="systemd"

QA_PREBUILT="/bin/warp-cli /bin/warp-diag /bin/warp-svc /bin/warp-taskbar"

S="${WORKDIR}"

src_install() {
	into /
	dobin bin/warp-cli
	dobin bin/warp-diag
	dobin bin/warp-svc
	doinitd ${FILESDIR}/warp-svc
	systemd_dounit opt/cloudflare-warp/warp-svc.service
}
