# Copyright 1999-2020 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdeedu"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="Chemistry teaching tool for Trinity"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~x86"
SLOT="${TRINITY_VER}"
IUSE="arts ocaml"

DEPEND="=trinity-base/libtdeedu-${PV}
	arts? ( =trinity-base/arts-${PV} )
	ocaml? ( dev-lang/ocaml
		dev-ml/facile )"
RDEPEND="${DEPEND}"

need-arts optional

src_prepare() {
	sed -i -e '/add_subdirectory( applnk    )/d' \
	-e '/add_subdirectory( libtdeedu )/d' "${S}/CMakeLists.txt" || die
	sed 's/nums//' -i kalzium/src/CMakeLists.txt
	trinity-meta-2_src_prepare
}

src_configure() {
	local INCDIR
	INCDIR="${TDEDIR}/include/libtdeedu"
	mycmakeargs=(
		-DCMAKE_CXX_FLAGS="${CXXFLAGS} -I${INCDIR}/tdeeduplot -I${INCDIR} "
		-DBUILD_ALL=OFF
		-DBUILD_KALZIUM=ON
		-DWITH_OCAML_SOLVER=$(usex ocaml ON OFF )
	)
	trinity-meta-2_src_configure
}
