# Copyright 1999-2020 Gentoo Authors
# Copyright 2020-2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdemultimedia"
TRINITY_MODULE_TYPE="core"
TRINITY_SUBMODULE="tdeioslave"
TRINITY_HANDBOOK="optional"
TSM_EXTRACT="kscd libkcddb tdeioslave"
inherit flag-o-matic trinity-meta-2

DESCRIPTION="Multimedia Trinity TDEIOslaves"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi
IUSE="flac"

DEPEND="~trinity-base/libkcddb-${PV}
	~trinity-base/libkscd-${PV}
	media-sound/cdparanoia
	flac? ( media-libs/flac )"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's/NOT BUILD_KSCD/BUILD_KSCD/' "${S}/tdeioslave/CMakeLists.txt" || die
	sed -i 's/kcddb-shared/kcddb/' "${S}/tdeioslave/audiocd/plugins/CMakeLists.txt" || die
	sed -i 's/kcddb-shared/kcddb/' "${S}/tdeioslave/audiocd/CMakeLists.txt" || die
	sed -i -e 's/kcompactdisc-static/kcompactdisc/' -e 's/workman-static/workman/' \
	"${S}/tdeioslave/audiocd/CMakeLists.txt" || die
	trinity-meta-2_src_prepare
}

src_configure() {
	append-cxxflags "-I${TDEDIR}/include/libkcddb -I${TDEDIR}/include"
	append-ldflags "-L${TDEDIR}/$(get_libdir) -L${TDEDIR}/$(get_libdir)/kscd"
	local mycmakeargs=(
		-DWITH_FLAC=$(usex flac)
		-DWITH_CDPARANOIA=ON
	)

	trinity-meta-2_src_configure
}
