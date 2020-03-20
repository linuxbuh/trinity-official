# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdelibs"

inherit trinity-base-2

set-trinityver

need-arts optional

DESCRIPTION="Trinity libraries needed by all TDE programs."
HOMEPAGE="http://www.trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="${TRINITY_VER}"

# NOTE: Building without tdehwlib segfaults, but you can try and report.

IUSE+=" alsa avahi cups consolekit cryptsetup fam jpeg2k lua lzma udevil +svg +idn +shm
	networkmanager openexr pcsc-lite spell sudo tiff utempter elficons +ssl pkcs11 kernel_linux
	upower xcomposite +hwlib libressl +xrandr +malloc systemd old_udisks udisks +pcre debug"

MY_DEPEND="=dev-tqt/tqtinterface-${PV}
	dev-libs/libxslt
	dev-libs/libxml2
	app-text/ghostscript-gpl
	media-libs/fontconfig
	media-libs/freetype
	=dev-libs/dbus-1-tqt-${PV}
	x11-libs/libXrender
	ssl? (
		app-misc/ca-certificates
		!libressl? ( dev-libs/openssl:= )
		libressl? ( dev-libs/libressl:= )
	)
	shm? ( x11-libs/libxshmfence )
	idn? ( net-dns/libidn )
	pcre? ( dev-libs/libpcre )
	svg? ( =media-libs/libart_lgpl-${PV} )
	alsa? ( media-libs/alsa-lib )
	avahi? ( net-dns/avahi )
	cups? ( net-print/cups )
	fam? ( virtual/fam )
	jpeg2k? ( media-libs/jasper )
	lua? ( dev-lang/lua:* )
	openexr? ( media-libs/openexr )
	spell? ( app-dicts/aspell-en app-text/aspell )
	sudo? ( app-admin/sudo )
	tiff? ( media-libs/tiff:= )
	utempter? ( sys-libs/libutempter )
	lzma? ( app-arch/xz-utils )
	xrandr? ( x11-libs/libXrandr )
	xcomposite? ( x11-libs/libXcomposite )
	elficons? ( =sys-libs/libr-${PV} )
	debug? ( sys-libs/binutils-libs:= )"

DEPEND+=" ${MY_DEPEND}"
RDEPEND+=" ${MY_DEPEND}
	hwlib? (
		acct-group/plugdev
		!udevil? ( !udisks? ( !old_udisks? ( sys-apps/pmount ) ) )
		pcsc-lite? ( sys-apps/pcsc-lite )
		pkcs11? ( dev-libs/pkcs11-helper )
		cryptsetup? ( sys-fs/cryptsetup )
		networkmanager? ( net-misc/networkmanager )
		consolekit? ( sys-auth/consolekit )
		upower? ( sys-power/upower )
		systemd? ( sys-apps/systemd:= )
		old_udisks? ( sys-fs/udisks:0 )
		udisks? ( sys-fs/udisks:2 )
		udevil? ( sys-apps/udevil )
	)"

src_configure() {
	mycmakeargs=(
		-DTDE_MALLOC="$(usex malloc)"
		-DTDE_MALLOC_FULL="$(usex malloc)"
		-DTDE_MALLOC_DEBUG="$(usex debug)"
		-DWITH_HSPELL=OFF
		-DWITH_HAL=OFF
		-DWITH_DEVKITPOWER=OFF
		-DWITH_OLD_XDG_STD=OFF
		-DWITH_KDE4_MENU_SUFFIX=OFF
		-DWITH_LIBIDN="$(usex idn)"
		-DWITH_MITSHM="$(usex shm)"
		-DWITH_PCRE="$(usex pcre)"
		-DWITH_LIBART="$(usex svg)"
		-DWITH_SSL="$(usex ssl)"
		-DWITH_LIBBFD="$(usex debug)"
		-DWITH_ELFICON="$(usex elficons)"
		-DWITH_TDEHWLIB="$(usex hwlib)"
		-DWITH_TDEHWLIB_DAEMONS="$(usex hwlib)"
		-DWITH_UDISKS="$(usex old_udisks)"
		-DWITH_UDISKS2="$(usex udisks)"
		-DWITH_UDEVIL="$(usex udevil)"
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
		-DUTEMPTER_HELPER="/usr/sbin/utempter"
		-DWITH_UPOWER="$(usex upower)"
		-DWITH_PKCS="$(usex pkcs11)"
		-DWITH_CONSOLEKIT="$(usex consolekit)"
		-DWITH_LOGINDPOWER="$(usex systemd)"
		-DWITH_NETWORK_MANAGER_BACKEND="$(usex networkmanager)"
		-DWITH_XCOMPOSITE="$(usex xcomposite)"
		-DWITH_XRANDR="$(usex xrandr)"
		-DWITH_SUDO_TDESU_BACKEND="$(usex sudo)"
		-DWITH_TDEICONLOADER_DEBUG="$(usex debug)"
	)

	trinity-base-2_src_configure
}

src_install() {
	trinity-base-2_src_install
	
	if use ssl; then
		# Make TDE to use our system certificates
		rm -f "${D}"${TDEDIR}/share/apps/kssl/ca-bundle.crt || die
		dosym /etc/ssl/certs/ca-certificates.crt ${TDEDIR}/share/apps/kssl/ca-bundle.crt
	fi

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

	trinity-base-2_create_tmp_docfiles
	trinity-base-2_install_docfiles
}

pkg_postinst () {
	if use sudo; then
		einfo "Remember that the sudo use flag sets only the default superuser command."
		einfo "It can be overriden on a user-level by adding:"
		einfo "  [super-user-command]"
		einfo "    super-user-command=su"
		einfo "to the kdeglobals config file which is should be usually"
		einfo "located in the ~/.trinity/share/config/ directory."
	fi
	if use malloc; then
		einfo "You have build TDE with it's own malloc implementation."
		einfo "That might result in better memory use for you when using TDE."
		einfo "But it could also result in a slightly different performance."
		einfo "With Gentoo you are free to choose what works better for you."
		einfo "If you remove the malloc USE flag, GLIBC's malloc will be used."
	fi
	if ! use hwlib; then
		for flag in consolekit networkmanager upower systemd old_udisks udisks udevil pkcs11 pcsc-lite cryptsetup; do
			use $flag && \
				ewarn "USE=\"$flag\" is passed, but it doesn't change anything due to" && \
				ewarn "$flag support in ${P} take effect only if the TDE hwlib is enabled."
		done

	fi
	if use hwlib; then
		einfo "Please add your user to the plugdev group to be able"
		einfo "to use the features of the TDE hwlibdaemons like suspend."
	fi
}
