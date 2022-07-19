# Copyright 1999-2020 Gentoo Authors
# Copyright 2020-2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdemultimedia"
TRINITY_MODULE_TYPE="core"
TRINITY_SUBMODULE="arts mpeglib"
TRINITY_HANDBOOK="optional"
TSM_EXTRACT_ALSO="akode_artsplugin audiofile_artsplugin mpeglib_artsplug xine_artsplugin"
inherit trinity-meta-2

DESCRIPTION="The aRts pipeline builder and other tools"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi
IUSE="akode alsa audiofile mpeg vorbis xine"

DEPEND="
	~trinity-base/arts-${PV}
	akode? ( ~media-libs/akode-${PV} )
	alsa? ( media-libs/alsa-lib )
	audiofile? ( media-libs/audiofile )
	vorbis? ( media-libs/libvorbis )
	xine? ( media-libs/xine-lib )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWITH_ALSA="$(usex alsa)"
		-DWITH_ARTS_AKODE="$(usex akode)"
		-DWITH_ARTS_AUDIOFILE="$(usex audiofile)"
		-DWITH_ARTS_MPEGLIB="$(usex mpeg)"
		-DBUILD_MPEGLIB="$(usex mpeg)"
		-DWITH_ARTS_XINE="$(usex xine)"
		-DWITH_VORBIS="$(usex vorbis)"
	)

	trinity-meta-2_src_configure
}
