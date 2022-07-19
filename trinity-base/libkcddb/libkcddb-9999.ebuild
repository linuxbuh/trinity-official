# Copyright 1999-2021 Gentoo Foundation
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
TRINITY_MODULE_NAME="tdemultimedia"
TRINITY_MODULE_TYPE="core"
TRINITY_HANDBOOK="optional"

inherit trinity-meta-2

DESCRIPTION="KDE library for CDDB"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi

src_prepare() {
	sed -e 's|${CMAKE_CURRENT_BINARY_DIR}/configbase.h|${CMAKE_CURRENT_BINARY_DIR}/configbase.h\n    ${CMAKE_CURRENT_BINARY_DIR}/cdinfodialogbase.h|' \
	-i "${S}/libkcddb/CMakeLists.txt" || die
	trinity-meta-2_src_prepare
}
