# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdebase"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="kicker applet for Trinity and X clipboard management"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi

DEPEND="x11-libs/libXfixes"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWITH_XFIXES=ON
	)

	trinity-meta-2_src_configure
}
