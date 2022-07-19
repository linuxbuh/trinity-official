# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdeutils"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="Trinity battery monitoring and management for laptops"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi
IUSE="xscreensaver"

RDEPEND="
	x11-libs/libXtst
	xscreensaver? ( x11-libs/libXScrnSaver )
"
DEPEND="${RDEPEND}
	virtual/os-headers
"

src_configure() {
	local mycmakeargs=(
		-DWITH_DPMS=ON
		-DWITH_XSCREENSAVER="$(usex xscreensaver)"
	)

	trinity-meta-2_src_configure
}
