# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdevelop"

inherit trinity-base-2

set-trinityver

DESCRIPTION="The TDevelop Integrated Development Environment"
HOMEPAGE="http://www.trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="${TRINITY_VER}"


IUSE+=""

DEPEND+="=trinity-base/tdelibs-${PV}
"
RDEPEND+="${DEPEND}"

TQTBASE="/usr/tqt3"

src_prepare() {
	pushd ${S}/parts/appwizard/common/
	cp -af ${TRINITY_MODULE_DIR}/admin .
	trinity-admin-prepare
	popd
	trinity-base-2_src_prepare
}

src_configure() {
	mycmakeargs=(
		-DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG -L${TQTBASE}/$(get_libdir)"
		-DWITH_LANGUAGE_ALL=ON
		-DWITH_BUILDTOOL_ALL=ON
		-DBUILD_ALL=ON
	)

	trinity-base-2_src_configure
}
