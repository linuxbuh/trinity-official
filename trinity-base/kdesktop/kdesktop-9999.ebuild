# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

DESCRIPTION="The part of TDE UI that handles icons, desktop, screensaver etc"
IUSE="pam xscreensaver"

COMMON_DEPEND="x11-libs/libXrender
	x11-libs/libXcursor
	=trinity-base/libkonq-${PV}
	=trinity-base/kcontrol-${PV}
	xscreensaver? ( x11-libs/libXScrnSaver )"
	# Requires the desktop background settings module,
	# so until we separate the kcontrol modules into separate ebuilds :-),
	# there's a dep here
DEPEND="${COMMON_DEPEND}
	xscreensaver? ( x11-base/xorg-proto x11-misc/xscreensaver )"
RDEPEND="${COMMON_DEPEND}
	=trinity-base/kcheckpass-${PV}
	=trinity-base/kdialog-${PV}
	=trinity-base/konqueror-${PV}
	pam? ( trinity-base/tdebase-pam )"

TSM_EXTRACT_ALSO="kcheckpass/"

src_configure() {
	mycmakeargs=(
		-DWITH_XCURSORS=ON
		-DWITH_XRENDER=ON
		-DWITH_PAM="$(usex pam)"
		-DWITH_XSCREENSAVER="$(usex xscreensaver)"
	)

	trinity-meta-2_src_configure
}
