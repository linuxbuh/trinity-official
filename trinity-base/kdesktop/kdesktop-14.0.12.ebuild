# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdebase"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="kcheckpass/ translations/ FindXscreensaver.cmake"
inherit trinity-meta-2

DESCRIPTION="The part of TDE UI that handles icons, desktop, screensaver etc"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="pam xscreensaver hwlib"

COMMON_DEPEND="
	~dev-libs/dbus-1-tqt-${PV}
	~trinity-base/kcontrol-${PV}
	~trinity-base/libkonq-${PV}
	x11-libs/libXrender
	x11-libs/libXcursor
	xscreensaver? ( x11-libs/libXScrnSaver )"
	# Requires the desktop background settings module,
	# so until we separate the kcontrol modules into separate ebuilds :-),
	# there's a dep here
DEPEND="${COMMON_DEPEND}
	xscreensaver? ( x11-base/xorg-proto x11-misc/xscreensaver )"
RDEPEND="${COMMON_DEPEND}
	~trinity-base/kcheckpass-${PV}
	~trinity-base/kdialog-${PV}
	~trinity-base/konqueror-${PV}
	pam? ( trinity-base/tdebase-pam )"

src_configure() {
	local mycmakeargs=(
		-DWITH_XCURSOR=ON
		-DWITH_XRENDER=ON
		-DWITH_PAM="$(usex pam)"
		-DWITH_XSCREENSAVER="$(usex xscreensaver)"
		-DTDESCREENSAVER_PAM_SERVICE=tde
		-DWITH_TDEHWLIB="$(usex hwlib)"
	)
	trinity-meta-2_src_configure
}
