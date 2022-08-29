# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Can't get this to properly download the go deps. Probably need a dump tarball for deps but don't want to host it anywhere.

EAPI=8

inherit go-module git-r3

EGO_PN="https://github.com/ayntgl/discordo"
EGO_SUM=(
	"github.com/alecthomas/kong v0.6.1"
	"github.com/alecthomas/kong v0.6.1/go.mod"
	"github.com/alecthomas/repr v0.0.0-20210801044451-80ca428c5142"
	"github.com/alecthomas/repr v0.0.0-20210801044451-80ca428c5142/go.mod"
	"github.com/alessio/shellescape v1.4.1"
	"github.com/alessio/shellescape v1.4.1/go.mod"
	"github.com/atotto/clipboard v0.1.4"
	"github.com/atotto/clipboard v0.1.4/go.mod"
	"github.com/chzyer/logex v1.1.10/go.mod"
	"github.com/chzyer/readline v0.0.0-20180603132655-2972be24d48e/go.mod"
	"github.com/chzyer/test v0.0.0-20180213035817-a1ea475d72b1/go.mod"
	"github.com/danieljoos/wincred v1.1.0/go.mod"
	"github.com/danieljoos/wincred v1.1.2"
	"github.com/danieljoos/wincred v1.1.2/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/diamondburned/arikawa/v3 v3.0.0"
	"github.com/diamondburned/arikawa/v3 v3.0.0/go.mod"
	"github.com/diamondburned/arikawa/v3 v3.1.0"
	"github.com/diamondburned/arikawa/v3 v3.1.0/go.mod"
	"github.com/gdamore/encoding v1.0.0"
	"github.com/gdamore/encoding v1.0.0/go.mod"
	"github.com/gdamore/tcell/v2 v2.5.3"
	"github.com/gdamore/tcell/v2 v2.5.3/go.mod"
	"github.com/godbus/dbus/v5 v5.0.6/go.mod"
	"github.com/godbus/dbus/v5 v5.1.0"
	"github.com/godbus/dbus/v5 v5.1.0/go.mod"
	"github.com/gorilla/schema v1.2.0"
	"github.com/gorilla/schema v1.2.0/go.mod"
	"github.com/gorilla/websocket v1.4.2/go.mod"
	"github.com/gorilla/websocket v1.5.0"
	"github.com/gorilla/websocket v1.5.0/go.mod"
	"github.com/lucasb-eyer/go-colorful v1.2.0"
	"github.com/lucasb-eyer/go-colorful v1.2.0/go.mod"
	"github.com/mattn/go-runewidth v0.0.13"
	"github.com/mattn/go-runewidth v0.0.13/go.mod"
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/rivo/tview v0.0.0-20220812085834-0e6b21a48e96"
	"github.com/rivo/tview v0.0.0-20220812085834-0e6b21a48e96/go.mod"
	"github.com/rivo/uniseg v0.2.0/go.mod"
	"github.com/rivo/uniseg v0.3.4"
	"github.com/rivo/uniseg v0.3.4/go.mod"
	"github.com/skratchdot/open-golang v0.0.0-20200116055534-eef842397966"
	"github.com/skratchdot/open-golang v0.0.0-20200116055534-eef842397966/go.mod"
	"github.com/stretchr/objx v0.1.0"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.5.1/go.mod"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/stretchr/testify v1.7.2"
	"github.com/stretchr/testify v1.7.2/go.mod"
	"github.com/yuin/gopher-lua v0.0.0-20190206043414-8bfc7677f583/go.mod"
	"github.com/yuin/gopher-lua v0.0.0-20220504180219-658193537a64"
	"github.com/yuin/gopher-lua v0.0.0-20220504180219-658193537a64/go.mod"
	"github.com/zalando/go-keyring v0.2.1"
	"github.com/zalando/go-keyring v0.2.1/go.mod"
	"golang.org/x/crypto v0.0.0-20210921155107-089bfa567519/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/sys v0.0.0-20190204203706-41f3e6584952/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20210819135213-f52c844e1c1c/go.mod"
	"golang.org/x/sys v0.0.0-20211001092434-39dca1131b70/go.mod"
	"golang.org/x/sys v0.0.0-20220318055525-2edf467146b5/go.mod"
	"golang.org/x/sys v0.0.0-20220825204002-c680a09ffe64"
	"golang.org/x/sys v0.0.0-20220825204002-c680a09ffe64/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/term v0.0.0-20201210144234-2321bbc49cbf/go.mod"
	"golang.org/x/term v0.0.0-20220722155259-a9ba230a4035"
	"golang.org/x/term v0.0.0-20220722155259-a9ba230a4035/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.7"
	"golang.org/x/text v0.3.7/go.mod"
	"golang.org/x/time v0.0.0-20210723032227-1f47c861a9ac/go.mod"
	"golang.org/x/time v0.0.0-20220722155302-e5dcc9cfc0b9"
	"golang.org/x/time v0.0.0-20220722155302-e5dcc9cfc0b9/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
	"layeh.com/gopher-luar v1.0.10"
	"layeh.com/gopher-luar v1.0.10/go.mod"
)

go-module_set_globals
DESCRIPTION="A lightweight, secure, and feature-rich Discord terminal client"
HOMEPAGE="https://github.com/ayntgl/discordo"
#SRC_URI="https://github.com/ayntgl/${PN}/archive/refs/heads/main.tar.gz -> ${P}.tar.gz
#	${EGO_SUM_SRC_URI}"
EGIT_REPO_URI="https://github.com/ayntgl/${PN}"
BDEPEND="dev-lang/go"
LICENSE="MIT BSD-2 BSD-3 Apache-2.0 ISC MPL"
SLOT="0"
KEYWORDS="~amd64"

IUSE="xclip wl-clipboard"
DEPEND="xclip? ( x11-misc/xclip )
	wl-clipboard? ( gui-apps/wl-clipboard )"
RDEPEND="${DEPEND}"

#src_unpack() {
#	unpack ${P}.tar.gz
#	mv ${PN}-main ${PN}-${PV}
#}

src_compile() {
	make build
	#go build -trimpath -buildmode=pie -ldflags "-s -w" -buildvcs=false .
}

src_install() {
	dobin discordo
	dodoc README.md
}
