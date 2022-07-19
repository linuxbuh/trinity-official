# Copyright 1999-2022 Gentoo Foundation
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
TRINITY_MODULE_NAME="tdemultimedia"
TRINITY_MODULE_TYPE="core"
TRINITY_SUBMODULE="kscd"
TSM_EXTRACT_ALSO="libkcddb/"

inherit flag-o-matic trinity-meta-2

DESCRIPTION="Static library for audio CD player for Trinity"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="x11-libs/libXext
	~trinity-base/libkcddb-${PV}"

src_prepare() {
	sed -i 's/kcddb-shared/kcddb/' "${S}/kscd/CMakeLists.txt" || die
	trinity-meta-2_src_prepare
}

src_configure() {
	append-cxxflags "-I${TDEDIR}/include/libkcddb -I${TDEDIR}/include"
	trinity-meta-2_src_configure
}

src_install() {
	insinto "${TDEDIR}/$(get_libdir)/kscd"
	doins "${BUILD_DIR}/kscd/libwm/libworkman.a"
	doins "${BUILD_DIR}/kscd/libkcompactdisc.a"
	doins "${BUILD_DIR}/kscd/libwm/audio/libworkmanaudio.a"
}
