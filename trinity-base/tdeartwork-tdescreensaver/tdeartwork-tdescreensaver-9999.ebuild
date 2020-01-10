# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdeartwork"

inherit trinity-meta-2

DESCRIPTION="Extra screensavers for Trinity"

IUSE="opengl xscreensaver arts"

DEPEND="
	=trinity-base/tdescreensaver-${PV}
	=trinity-base/krootbacking-${PV}
	media-libs/libart_lgpl
	opengl? ( virtual/opengl )
	xscreensaver? ( x11-misc/xscreensaver )
	arts? ( trinity-base/arts )"
RDEPEND="$DEPEND"

TSM_EXTRACT_ALSO="FindXscreensaver.cmake"

src_configure() {
	mycmakeargs=(
		-DWITH_LIBART=ON
		-DWITH_OPENGL="$(usex opengl)"
		-DWITH_XSCREENSAVER="$(usex xscreensaver)"
		-DWITH_ARTS="$(usex arts)"
	)

	trinity-meta-2_src_configure
}
