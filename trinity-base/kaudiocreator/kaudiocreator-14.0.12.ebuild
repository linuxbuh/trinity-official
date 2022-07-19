# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
TRINITY_MODULE_NAME="tdemultimedia"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="libkcddb/ kscd/"

inherit trinity-meta-2

DESCRIPTION="TDE CD ripper and audio encoder frontend"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="encode flac mp3 vorbis"
DEPEND="~trinity-base/libkcddb-${PV}
	~trinity-base/libkscd-${PV}
	media-sound/cdparanoia"

# External encoders used - no optional compile-time support
RDEPEND="${RDEPEND}
	~trinity-base/tdemultimedia-tdeioslaves-${PV}
	encode? ( vorbis? ( media-sound/vorbis-tools )
			flac? ( media-libs/flac )
			mp3? ( media-sound/lame ) )"

src_prepare() {
	sed -i 's/kcddb-shared/kcddb/' "${S}/${PN}/CMakeLists.txt" || die
	sed -i 's/if( NOT BUILD_KSCD )/if( BUILD_KSCD )/' "${S}/CMakeLists.txt" || die
	sed -i -e 's/kcompactdisc-static/kcompactdisc/' -e 's/workman-static/workman/' "${S}/${PN}/CMakeLists.txt" || die
	trinity-meta-2_src_prepare
}

src_configure() {
	append-cxxflags "-I${TDEDIR}/include/libkcddb -I${TDEDIR}/include"
	append-ldflags "-L${TDEDIR}/$(get_libdir)/kscd"
	trinity-meta-2_src_configure
}
