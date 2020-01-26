# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

DESCRIPTION="Trinity login manager, similar to XDM and GDM"

IUSE="pam xdmcp xcomposite sak +xrandr"

DEPEND="pam? ( trinity-base/tdebase-pam )
	xdmcp? ( x11-libs/libXdmcp )
	xcomposite? ( x11-libs/libXcomposite )
	xrandr? ( x11-libs/libXrandr )
	=trinity-base/tdelibs-${PV}[xrandr?]
	sys-apps/dbus
	x11-libs/libXtst
	=trinity-base/kcontrol-${PV}
	=dev-libs/dbus-tqt-${PV}"

RDEPEND="${DEPEND}
	=trinity-base/tdepasswd-${PV}
	x11-apps/xinit
	x11-apps/xmessage"

pkg_setup() {
	trinity-meta-2_pkg_setup;
	use sak && TRINITY_SUBMODULE+=" tsak"
}

src_configure() {
	mycmakeargs=(
		-DWITH_XTEST=ON
		-DWITH_LIBART=ON
		-DWITH_SHADOW=ON
		-DWITH_XCOMPOSITE="$(usex xcomposite)"
		-DWITH_XDMCP="$(usex xdmcp)"
		-DWITH_XRANDR="$(usex xrandr)"
		-DWITH_PAM="$(usex pam)"
		-DTDM_PAM_SERVICE=tde
	)

	trinity-meta-2_src_configure
}

src_install() {
	cmake-utils_src_install

	# Customize the tdmrc configuration
	sed -i -e "s:#SessionsDirs=:SessionsDirs=/usr/share/xsessions\n#SessionsDirs=:" \
		"${D}/${TDEDIR}/share/config/tdm/tdmrc" || die "sed tdmrc failed"

	# Install XSession upstream script seems to be debian-cpecific
	cp "${FILESDIR}/${P}-xsession.script" "${D}/${TDEDIR}/share/config/tdm/Xsession"
	sed -i -e "s!@TRINITY_INSTALL_PATH@!${TDEDIR}!" "${D}/${TDEDIR}/share/config/tdm/Xsession" \
		|| die "sed tdmrc failed"
}

pkg_postinst() {
	# Set the default TDM face icon if it's not already set by the system admin
	# because this is user-overrideable in that way, it's not in src_install
	if [ ! -e "${ROOT}${TDEDIR}/share/apps/tdm/faces/.default.face.icon" ];	then
		mkdir -p "${ROOT}${TDEDIR}/share/apps/tdm/faces"
		cp "${ROOT}${TDEDIR}/share/apps/tdm/pics/users/default1.png" \
			"${ROOT}${TDEDIR}/share/apps/tdm/faces/.default.face.icon"
	fi
	if [ ! -e "${ROOT}${TDEDIR}/share/apps/tdm/faces/root.face.icon" ]; then
		mkdir -p "${ROOT}${TDEDIR}/share/apps/tdm/faces"
		cp "${ROOT}${TDEDIR}/share/apps/tdm/pics/users/root1.png" \
			"${ROOT}${TDEDIR}/share/apps/tdm/faces/root.face.icon"
	fi

	if use sak; then
		sak_ok=yes
		if ! linux_config_exists; then
			ewarn "Can't check the linux kernel configuration."
			ewarn "You might have some incompatible options enabled."
			sak_ok=no
		else
			if ! linux_chkconfig_present INPUT_UINPUT; then
				eerror "You build tdm with sak feature enabled. "
				eerror "It requires the INPUT_UINPUT support enabled."
				eerror "Please enable it:"
				eerror "    CONFIG_INPUT_UINPUT=y"
				eerror "in /usr/src/linux/.config or"
				eerror "    Device Drivers --->"
				eerror "        Input device support  --->"
				eerror "           [*] Miscellaneous devices  --->"
				eerror "                <*> User level driver support"
				sak_ok=no
			fi
		fi
		if [[ "$sak_ok" != yes ]]; then
			sed -i -e 's:#\?\s*UseSAK=\(true\|false\)\?:UseSak=false:' \
				"${D}${TDEDIR}/share/config/tdm/tdmrc" || die "sed tdmrc failed"
			ewarn "SAK feature is disabled. You can enable it yourself by setting UseSAK=true "
			ewarn "in ${TDEDIR}/share/config/tdm/tdmrc "
		else
			ewarn "SAK feature is enabled. You can disable it yourself by setting UseSAK=false"
			ewarn "in ${TDEDIR}/share/config/tdm/tdmrc "
		fi
	fi
}
