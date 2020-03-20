# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

DESCRIPTION="X terminal for use with Trinity."

IUSE="sudo"

DEPEND="x11-libs/libX11
	x11-libs/libXrender"

RDEPEND="${DEPEND}
	sudo? ( app-admin/sudo )
	x11-apps/bdftopcf
	=trinity-base/kcontrol-${PV}"

src_configure() {
	mycmakeargs=(
		-DWITH_XRENDER=ON
		-DWITH_SUDO_KONSOLE_SUPER_USER_COMMAND="$(usex sudo)"
	)

	trinity-meta-2_src_configure
}
