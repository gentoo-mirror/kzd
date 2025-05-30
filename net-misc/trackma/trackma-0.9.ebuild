# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# modified from ebuild available in the booboo overlay

EAPI=8

KEYWORDS="~amd64"

PYTHON_COMPAT=( python3_{8..13} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1 git-r3 desktop

DESCRIPTION="Open multi-site list manager for media tracking sites"
HOMEPAGE="https://github.com/z411/trackma"
EGIT_REPO_URI="https://github.com/z411/${PN}"
EGIT_COMMIT="v${PV}"
LICENSE="GPL-3"
SLOT="0"
IUSE="+ncurses cli gtk inotify qt5"
REQUIRED_USE="|| ( cli gtk ncurses qt5 )"

DEPEND="dev-python/poetry
	ncurses? ( dev-python/urwid[${PYTHON_USEDEP}] )
	gtk? (
		dev-python/pygobject:3[${PYTHON_USEDEP}]
		dev-python/pycairo[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
	)
	qt5? (
		dev-python/PyQt5[${PYTHON_USEDEP},gui,widgets]
		dev-python/pillow[${PYTHON_USEDEP}]
	)"
RDEPEND="sys-process/lsof
	inotify? ( || ( dev-python/pyinotify ) )
	${DEPEND}"

python_configure_all() {
	#sed -i -e '/trackma-qt4/d' "${S}/setup.py" || die
	#rm "${S}/trackma/ui/qt/qt4ui.py" || die
	if ! use qt5; then
		#sed -i -e '/trackma-qt/d' "${S}/setup.py" || die
		rm -R "${S}/trackma/ui/qt" || die
	fi
	if ! use gtk; then
		#sed -i -e '/trackma-gtk/d' "${S}/setup.py" || die
		rm -R "${S}/trackma/ui/gtk" || die
	fi
	if ! use ncurses; then
		#sed -i -e '/trackma-curses/d' "${S}/setup.py" || die
		rm "${S}/trackma/ui/curses.py" || die
	fi
	if ! use cli; then
		#sed -i -e '/trackma.ui.cli:main/d' "${S}/setup.py" || die
		rm "${S}/trackma/ui/cli.py" || die
	fi
}

python_install_all() {
	distutils-r1_python_install_all
	newicon "${S}/trackma/data/icon.png" trackma.png
	use cli && make_desktop_entry "${PN}" "${PN^} (cli)" "${PN}" "Network" "Terminal=true"
	use ncurses && make_desktop_entry "${PN}-curses" "${PN^} (ncurses)" "${PN}" "Network" "Terminal=true"
	use gtk && make_desktop_entry "${PN}-gtk" "${PN^} (gtk3)" "${PN}" "Network" "StartupWMClass=trackma-gtk3"
	use qt5 && make_desktop_entry "${PN}-qt" "${PN^} (qt5)" "${PN}" "Network" "StartupWMClass=trackma-qt5"
}
