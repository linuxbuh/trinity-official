# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdeutils"

inherit trinity-meta-2

DESCRIPTION="KLaptopdaemon - Trinity battery monitoring and management for laptops."

IUSE="xscreensaver"

DEPEND="x11-libs/libXtst
	xscreensaver? ( x11-libs/libXScrnSaver )
	virtual/os-headers"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		-DWITH_DPMS=ON
		-DWITH_XSCREENSAVER="$(usex xscreensaver)"
	)

	trinity-meta-2_src_configure
}
