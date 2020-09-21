# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdemultimedia"
inherit trinity-meta-2

DESCRIPTION="The aRts pipeline builder and other tools"

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
