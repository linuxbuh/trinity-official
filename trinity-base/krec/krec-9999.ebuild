# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
TRINITY_MODULE_NAME="tdemultimedia"
TRINITY_MODULE_TYPE="core"
TRINITY_HANDBOOK="optional"
TSM_EXTRACT_ALSO="arts oggvorbis_artsplugin"

inherit trinity-meta-2

DESCRIPTION="TDE sound recorder"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi
IUSE="encode mp3 vorbis"

DEPEND="~trinity-base/tdemultimedia-arts-${PV}
	encode? ( mp3? ( media-sound/lame )
			vorbis? ( media-libs/libvorbis ) )"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's/NOT BUILD_ARTS/BUILD_ARTS/' "${S}/CMakeLists.txt" || die
	sed -i -e 's/artsmoduleseffects-shared/artsmoduleseffects/' \
		-e 's/artscontrolsupport-shared/artscontrolsupport/' \
		-e 's/artsgui_kde-shared/artsgui_kde/g'  \
		-e 's/artsmoduleseffects-shared/artsmoduleseffects/' \
		"${S}/${PN}/CMakeLists.txt" || die
	sed -i 's/artsmoduleseffects-shared/artsmoduleseffects/' \
		"${S}/${PN}/mp3_export/CMakeLists.txt" || die
	sed -i 's/artsmoduleseffects-shared/artsmoduleseffects/' "${S}/${PN}/ogg_export/CMakeLists.txt" || die
	sed -i 's/soundserver_idl/soundserver_idl artsgui_idl/' "${S}/${PN}/CMakeLists.txt" || die
	trinity-meta-2_src_prepare
}

src_configure() {
	mycmakeargs=(
		-DWITH_LAME="$(usex mp3)"
		-DWITH_VORBIS="$(usex vorbis)"
	)

	trinity-meta-2_src_configure
}
