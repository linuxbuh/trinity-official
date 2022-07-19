# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_NEED_ARTS="optional"
TRINITY_MODULE_NAME="tdeartwork"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="FindXscreensaver.cmake translations"
inherit trinity-meta-2

DESCRIPTION="Extra screensavers for Trinity"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="kclock opengl xscreensaver"

DEPEND="
	~trinity-base/krootbacking-${PV}
	~trinity-base/tdescreensaver-${PV}
	kclock? ( ~media-libs/libart_lgpl-${PV} )
	opengl? ( virtual/opengl )
	xscreensaver? ( x11-misc/xscreensaver )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWITH_LIBART="$(usex kclock)"
		-DWITH_OPENGL="$(usex opengl)"
		-DWITH_XSCREENSAVER="$(usex xscreensaver)"
	)

	trinity-meta-2_src_configure
}
