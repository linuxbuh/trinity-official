# Copyright 1999-2020 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdeedu"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="Educational Logo programming environment"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~x86"
SLOT="${TRINITY_VER}"
IUSE="arts"

DEPEND="=trinity-base/tdelibs-${PV}
	=trinity-base/libtdeedu-${PV}
	arts? ( =trinity-base/arts-${PV} )"
RDEPEND="${DEPEND}"

need-arts optional

src_prepare() {
	sed -i -e '/add_subdirectory( applnk    )/d' \
	-e '/add_subdirectory( libtdeedu )/d' "${S}/CMakeLists.txt" || die
	trinity-meta-2_src_prepare
}

src_configure() {
	mycmakeargs=(
		-DBUILD_ALL=OFF
		-DBUILD_KTURTLE=ON
	)
	trinity-meta-2_src_configure
}
