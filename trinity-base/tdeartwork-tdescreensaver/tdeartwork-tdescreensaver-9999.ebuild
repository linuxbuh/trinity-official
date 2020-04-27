# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdeartwork"

inherit trinity-meta-2

need-arts optional

DESCRIPTION="Extra screensavers for Trinity"

IUSE+=" opengl xscreensaver kclock"

DEPEND+=" =trinity-base/tdescreensaver-${PV}
	=trinity-base/krootbacking-${PV}
	kclock? ( =media-libs/libart_lgpl-${PV} )
	opengl? ( virtual/opengl )
	xscreensaver? ( x11-misc/xscreensaver )"
RDEPEND+=" ${DEPEND}"

TSM_EXTRACT_ALSO="FindXscreensaver.cmake"

src_configure() {
	mycmakeargs=(
		-DWITH_LIBART="$(usex kclock)"
		-DWITH_OPENGL="$(usex opengl)"
		-DWITH_XSCREENSAVER="$(usex xscreensaver)"
	)

	trinity-meta-2_src_configure
}
