# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

DESCRIPTION="KControl module for the X11 to configure and switch keyboard layouts"

DEPEND="x11-libs/libXtst"
RDEPEND="${DEPEND}
	x11-misc/xkeyboard-config
	x11-apps/setxkbmap"

src_configure() {
	mycmakeargs=(
		-DWITH_XTEST=ON
	)

	trinity-meta-2_src_configure
}
