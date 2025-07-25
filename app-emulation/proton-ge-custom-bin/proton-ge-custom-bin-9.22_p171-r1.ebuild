# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# modified from ebuild available in the touchfish-os overlay

EAPI=8
MULTILIB_COMPAT=(abi_x86_{32,64})
inherit multilib-minimal

# SpookySkeletons/proton-ge-rtsp/releases/tag/GE-Proton8-30-rtsp-1
# https://github.com/SpookySkeletons/proton-ge-rtsp/releases/download/rtsp6-hotfix/GE-Proton9-10-rtsp12-hotfix.tar.gz

_internal_name=GE-Proton9-22-rtsp17-1
DESCRIPTION="Fork of Proton GE with rtsp and other streaming protocol patches, ie for VRChat."
HOMEPAGE="https://github.com/SpookySkeletons/proton-ge-rtsp"
SRC_URI="https://github.com/SpookySkeletons/proton-ge-rtsp/releases/download/${_internal_name}/${_internal_name}.tar.gz -> ${_internal_name}.tar.gz"
LICENSE="BSD LGPL zlib MIT MPL OFL Proton GPL MSPL"
SLOT="rtsp"
KEYWORDS="~amd64"
RESTRICT="mirror strip"

RDEPEND="
	dev-libs/openssl-compat:1.1.1[${MULTILIB_USEDEP}]
	media-video/ffmpeg-compat:4
	<media-libs/libtheora-1.2[${MULTILIB_USEDEP}]
	media-libs/gst-plugins-base[${MULTILIB_USEDEP}]
	media-libs/graphene
	media-libs/gst-plugins-bad
	dev-libs/libgudev[${MULTILIB_USEDEP}]
	media-libs/libjpeg-turbo[${MULTILIB_USEDEP}]
	dev-libs/libusb[${MULTILIB_USEDEP}]
	media-libs/libva[${MULTILIB_USEDEP}]
	x11-libs/libvdpau[${MULTILIB_USEDEP}]
	media-sound/mpg123[${MULTILIB_USEDEP}]
	media-libs/speex[${MULTILIB_USEDEP}]
	media-libs/openal[${MULTILIB_USEDEP}]
	app-emulation/vkd3d-proton[${MULTILIB_USEDEP}]
	net-libs/libsoup
	dev-lang/python
	media-libs/mesa[vulkan,${MULTILIB_USEDEP}]
	media-libs/vulkan-loader[${MULTILIB_USEDEP}]"

QA_PREBUILT={*}
S="${WORKDIR}"

src_install() {
	insinto "/usr/share/steam/compatibilitytools.d/"
	dodir "/usr/share/steam/compatibilitytools.d/${_internal_name}"
	doins -r "${S}/${_internal_name}"

	sed -i "s%\"install_path\" \".\"%\"install_path\" \"/usr/share/steam/compatibilitytools.d/${_internal_name}\"%" "${D}/usr/share/steam/compatibilitytools.d/${_internal_name}/compatibilitytool.vdf" || die

	# need to keep empty dirs or else failures occur when copying base prefix?
	# find GE-Proton8-4 -depth -empty | sed 's/GE-Proton8-4/keepdir \"\/usr\/share\/steam\/compatibilitytools.d\/\/\$\{_internal_name\}/g' | sed 's/$/\"/g'
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/cmake/kaldi"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/fst"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/glslang"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/graphene-1.0/include"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/gstreamer-1.0/include/gst/gl"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/pkgconfig"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib64/cmake/openxr"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib64/fst"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib64/glslang"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib64/graphene-1.0/include"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib64/gstreamer-1.0/include/gst/gl"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib64/pkgconfig"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/dosdevices"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/Program Files/Common Files/Microsoft Shared/TextConv"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/ProgramData/Microsoft/Windows/Start Menu/Programs/Administrative Tools"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/ProgramData/Microsoft/Windows/Start Menu/Programs/StartUp"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/ProgramData/Microsoft/Windows/Templates"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Desktop"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Documents"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Music"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Pictures"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Videos"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Local/Microsoft/Windows/History"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Local/Microsoft/Windows/INetCache"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Local/Microsoft/Windows/INetCookies"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/LocalLow"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Network Shortcuts"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Printer Shortcuts"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Recent"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/SendTo"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Administrative Tools"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/StartUp"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Templates"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Themes"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Contacts"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Desktop"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Downloads"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Music"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Pictures"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Templates"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Videos"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Downloads"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Favorites"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Links"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Music"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Pictures"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Saved Games"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Searches"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Temp"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Videos"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/Fonts"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/Microsoft.NET/DirectX for Managed Code"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/Microsoft.NET/Framework/v3.5"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/Microsoft.NET/Framework64/v3.5"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/help"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/logs"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/performance/winsat/datastore"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/system32/catroot"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/system32/mui"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/system32/spool/printers"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/system32/tasks"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/syswow64/mui"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/tasks"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/temp"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/wine/mono/wine-mono-9.2.0/lib/mono/4.0"
	#keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/protonfixes/gamefixes-amazon/__init__.py"
	#keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/protonfixes/gamefixes-battlenet/__init__.py"
	#keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/protonfixes/gamefixes-ea/__init__.py"
	#keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/protonfixes/gamefixes-egs/__init__.py"
	#keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/protonfixes/gamefixes-gog/__init__.py"
	#keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/protonfixes/gamefixes-humble/__init__.py"
	#keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/protonfixes/gamefixes-itchio/__init__.py"
	#keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/protonfixes/gamefixes-steam/__init__.py"
	#keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/protonfixes/gamefixes-ubisoft/__init__.py"
	#keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/protonfixes/gamefixes-umu/__init__.py"
	#keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/protonfixes/gamefixes-zoomplatform/__init__.py"
}

pkg_postinst() {
	einfo "changing permission of proton executables"
	find  "${EPREFIX}"/usr/share/steam/compatibilitytools.d/${_internal_name}/proton -exec chmod ugo+x "{}" \;
	find  "${EPREFIX}"/usr/share/steam/compatibilitytools.d/${_internal_name}/files/bin -type f -exec chmod ugo+x "{}" \;
	find  "${EPREFIX}"/usr/share/steam/compatibilitytools.d/${_internal_name}/protonfixes/winetricks -exec chmod ugo+x "{}" \;
}
