# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdebase"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="The reliable Trinity session manager that talks the standard X11R6"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="+hwlib"

src_configure() {
	local mycmakeargs=(
		-DWITH_TDEHWLIB="$(usex hwlib)"
	)
	trinity-meta-2_src_configure
}
