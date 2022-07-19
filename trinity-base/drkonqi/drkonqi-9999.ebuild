# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdebase"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="translations/"
inherit trinity-meta-2

DESCRIPTION="Trinity crash handler gives the user feedback if a program crashed"

if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi
IUSE="+hwlib"

RDEPEND="sys-devel/gdb"

src_configure() {
	local mycmakeargs=(
		-DWITH_TDEHWLIB="$(usex hwlib)"
	)
	trinity-meta-2_src_configure
}
