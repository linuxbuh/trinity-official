# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="5"
TRINITY_MODULE_NAME="tdelibs"

inherit trinity-base multilib

set-trinityver

need-arts optional

DESCRIPTION="Trinity libraries needed by all TDE programs."
HOMEPAGE="http://www.trinitydesktop.org/"
LICENSE="GPL-2 LGPL-2"
SLOT="${TRINITY_VER}"
KEYWORDS=
IUSE+=" alsa avahi cups consolekit cryptsetup fam hwlib jpeg2k lua 
	lzma networkmanager openexr pcsc-lite spell sudo tiff 
	utempter upower xcomposite +xrandr"

MY_DEPEND="=dev-tqt/tqtinterface-${PV}
	>=dev-libs/libxslt-1.1.16
	>=dev-libs/libxml2-2.6.6
	>=dev-libs/libpcre-6.6
	net-dns/libidn
	app-text/ghostscript-gpl
	>=dev-libs/openssl-0.9.7d:=
	media-libs/fontconfig
	media-libs/freetype:2
	media-libs/libart_lgpl
	sys-apps/dbus
	dev-libs/dbus-1-tqt
	x11-libs/libXcursor
	x11-libs/libXrender
	alsa? ( media-libs/alsa-lib )
	avahi? ( net-dns/avahi )
	cryptsetup? ( sys-fs/cryptsetup )
	cups? ( >=net-print/cups-1.1.19 )
	fam? ( virtual/fam )
	jpeg2k? ( media-libs/jasper )
	lua? ( dev-lang/lua:* )
	openexr? ( >=media-libs/openexr-1.2.2-r2 )
	pcsc-lite? ( sys-apps/pcsc-lite )
	spell? ( >=app-dicts/aspell-en-6.0.0 >=app-text/aspell-0.60.5 )
	sudo? ( app-admin/sudo )
	tiff? ( media-libs/tiff:= )
	utempter? ( sys-libs/libutempter )
	networkmanager? ( net-misc/networkmanager )
	lzma? ( app-arch/xz-utils )
	xrandr? ( >=x11-libs/libXrandr-1.2 )
	xcomposite? ( x11-libs/libXcomposite )"
# NOTE: upstream lacks avahi support, so the use flag is currenly masked
# TODO: add elfres support via libr (not in portage now)
DEPEND+=" ${MY_DEPEND}"
RDEPEND+=" ${MY_DEPEND}
	consolekit? ( sys-auth/consolekit )
	upower? ( sys-power/upower )
	hwlib? ( || ( sys-fs/udisks sys-apps/udevil sys-apps/pmount ) )"

src_configure() {
	mycmakeargs=(
		-DTDE_MALLOC_FULL=ON
		-DWITH_LIBIDN=ON
		-DWITH_SSL=ON
		-DWITH_LIBART=ON
		-DWITH_PCRE=ON
		-DWITH_HSPELL=OFF
		-DWITH_PKCS=OFF
		-DWITH_TDEHWLIB="$(usex hwlib)"
		-DWITH_TDEHWLIB_DAEMONS="$(usex hwlib)"
		-DWITH_ARTS=OFF
		-DWITH_ALSA="$(usex alsa)"
		-DWITH_AVAHI="$(usex avahi)"
		-DWITH_CRYPTSETUP="$(usex cryptsetup)"
		-DWITH_CUPS="$(usex cups)"
		-DWITH_INOTIFY="$(usex kernel_linux)"
		-DWITH_JASPER="$(usex jpeg2k)"
		-DWITH_LUA="$(usex lua)"
		-DWITH_LZMA="$(usex lzma)"
		-DWITH_OPENEXR="$(usex openexr)"
		-DWITH_PCSC="$(usex pcsc-lite)"
		-DWITH_ASPELL="$(usex spell)"
		-DWITH_GAMIN="$(usex fam)"
		-DWITH_TIFF="$(usex tiff)"
		-DWITH_UTEMPTER="$(usex utempter)"
		-DWITH_UPOWER="$(usex upower)"
		-DWITH_CONSOLEKIT="$(usex consolekit)"
		-DWITH_NETWORK_MANAGER_BACKEND="$(usex networkmanager)"
		-DWITH_XCOMPOSITE="$(usex xcomposite)"
		-DWITH_XRANDR="$(usex xrandr)"
		-DWITH_SUDO_TDESU_BACKEND="$(usex sudo)"
	)

	trinity-base_src_configure
}

src_install() {
	trinity-base_src_install

	dodir /etc/env.d
	# TDE expects that the install path is listed first in TDEDIRS and the user
	# directory (implicitly added) is the last entry. Doing otherwise breaks
	# certain functionality. Do not break this (once again *sigh*), but read the code.
	# TDE saves the installed path implicitly and so this is not needed, /usr
	# is set in ${TDEDIR}/share/config/kdeglobals and so TDEDIRS is not needed.

	# List all the multilib libdirs
	local libdirs pkgconfigdirs
	for libdir in $(get_all_libdirs); do
		libdirs="${TDEDIR}/${libdir}:${libdirs}"
	done

	cat <<EOF >"${D}/etc/env.d/45trinitypaths-${SLOT}" # number goes down with version upgrade
PATH=${TDEDIR}/bin
ROOTPATH=${TDEDIR}/sbin:${TDEDIR}/bin
LDPATH=${libdirs#:}
MANPATH=${TDEDIR}/share/man
CONFIG_PROTECT="${TDEDIR}/share/config ${TDEDIR}/env ${TDEDIR}/shutdown /usr/share/config"
XDG_DATA_DIRS="${TDEDIR}/share"
PKG_CONFIG_PATH="${TDEDIR}/$(get_libdir)/pkgconfig"
EOF

	# Make sure the target for the revdep-rebuild stuff exists. Fixes bug 184441.
	dodir /etc/revdep-rebuild

cat <<EOF >"${D}/etc/revdep-rebuild/50-trinity-${SLOT}"
SEARCH_DIRS="${TDEDIR}/bin ${TDEDIR}/lib*"
EOF

	trinity-base_create_tmp_docfiles
	trinity-base_install_docfiles
}

pkg_postinst () {
	if use sudo; then
		einfo "Remember that the sudo use flag sets only the default superuser command."
		einfo "It can be overriden on a user-level by adding:"
		einfo "  [super-user-command]"
		einfo "    super-user-command=su"
		einfo "to the kdeglobal config file which is should be usually"
		einfo "located in the ~/.trinity/share/config/ directory."
	fi
}
