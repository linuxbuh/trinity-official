# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

DESCRIPTION="The reliable Trinity session manager that talks the standard X11R6"
IUSE="upower"

DEPEND="
	=dev-libs/dbus-tqt-${PV}
	upower? ( =dev-libs/dbus-1-tqt-${PV} ) "

RDEPEND="${DEPEND}
	upower? ( sys-power/upower ) "

src_configure() {
	mycmakeargs=(
		-DWITH_UPOWER="$(usex upower)"
	)

	trinity-meta-2_src_configure
}
