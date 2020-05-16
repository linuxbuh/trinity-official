# Copyright 1999-2020 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdeedu"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="Common library for Trinity tdeedu applications."
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~x86"
SLOT="${TRINITY_VER}"
IUSE=""

DEPEND="=trinity-base/tdelibs-${PV}"
RDEPEND="${DEPEND}"

TRINITY_SUBMODULE="libtdeedu applnk"

src_prepare() {
	sed  -e 's#${INCLUDE_INSTALL_DIR}/libtdeedu#${INCLUDE_INSTALL_DIR}/libtdeedu/tdeeduplot#' \
		-i libtdeedu/tdeeduplot/CMakeLists.txt
	trinity-meta-2_src_prepare
}

src_configure() {
	mycmakeargs=(
		-DBUILD_ALL=OFF
	)
	trinity-meta-2_src_configure
}

src_install() {
	local DIR
	DIR=${TDEDIR#}/$(get_libdir)
	trinity-meta-2_src_install
	dosym ${DIR}/libtdeeduplot.so ${DIR}/libtdeeduplot-shared.so
	dosym ${DIR}/libtdeeduui.so ${DIR}/libtdeeduui-shared.so
	dosym ${DIR}/libtdeeducore.so ${DIR}/libtdeeducore-shared.so
	dosym ${DIR}/libextdate.so ${DIR}/libextdate-shared.so
	insinto ${TDEDIR}/include/libtdeedu/extdate
	doins ${S}/libtdeedu/extdate/ext*.h

}
