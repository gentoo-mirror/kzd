# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# modified from ebuild available in the touchfish-os overlay

EAPI=8

_internal_name=GE-Proton${PV:0:1}-${PV:2:3}
DESCRIPTION="A fancy custom distribution of Valves Proton with various patches"
HOMEPAGE="https://github.com/GloriousEggroll/proton-ge-custom"
SRC_URI="https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${_internal_name}/${_internal_name}.tar.gz -> ${P}.tar.gz"

LICENSE=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'OFL' 'Proton')
SLOT="${PV}"
KEYWORDS="~amd64"
RESTRICT="mirror strip"

RDEPEND="
	media-libs/mesa[vulkan,abi_x86_32]
	media-libs/vulkan-loader[abi_x86_32]"

QA_PREBUILT="*"
S="${WORKDIR}"
#PATCHES=("${FILESDIR}/proton-ge-custom-bin-7.26-create-dosdevices.patch")

src_install() {
	dodir "/usr/share/steam/compatibilitytools.d/${_internal_name}"
	mv "${S}/${_internal_name}/compatibilitytool.vdf" "${D}/usr/share/steam/compatibilitytools.d/${_internal_name}" || die
	sed -i "s%\"install_path\" \".\"%\"install_path\" \"/opt/proton-ge-custom/${_internal_name}\"%" "${D}/usr/share/steam/compatibilitytools.d/${_internal_name}/compatibilitytool.vdf" || die

	dodir "/opt/proton-ge-custom"
	insinto "/opt/proton-ge-custom/"
	doins -r "${S}/${_internal_name}"

	# need to keep empty dirs or else failures occur when copying base prefix!
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/dosdevices"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/ProgramData/Microsoft/Windows/Start Menu/Programs/Administrative Tools"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/ProgramData/Microsoft/Windows/Start Menu/Programs/StartUp"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/ProgramData/Microsoft/Windows/Templates"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/Program Files/Common Files/Microsoft Shared/TextConv"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Desktop"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Documents"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Music"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Pictures"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Videos"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Local/Microsoft/Windows/History"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Local/Microsoft/Windows/INetCache"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Local/Microsoft/Windows/INetCookies/"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/LocalLow"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Network Shortcuts"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Printer Shortcuts"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Recent"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/SendTo"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Administrative Tools"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/StartUp"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Templates"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Themes"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Contacts"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Desktop"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Downloads"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Music"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Pictures"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Templates"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Videos"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Downloads"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Favorites"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Links"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Music"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Pictures"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Saved Games"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Searches"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Temp"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Videos"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/windows/Fonts"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/windows/help"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/windows/logs"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/windows/Microsoft.NET/DirectX for Managed Code"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/windows/Microsoft.NET/Framework/v3.5"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/windows/Microsoft.NET/Framework64/v3.5"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/windows/performance/winsat/datastore"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/windows/system32/catroot"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/windows/system32/mui"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/windows/system32/spool/printers"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/windows/system32/tasks"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/windows/syswow64/mui"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/windows/tasks"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/default_pfx/drive_c/windows/temp"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/wine/mono/wine-mono-7.4.1/lib/mono/4.0"
	keepdir "/opt/proton-ge-custom/${_internal_name}/files/share/wine/mono/wine-mono-7.4.1/lib/mono/monodoc"
}
