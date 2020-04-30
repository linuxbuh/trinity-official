# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdemultimedia"

inherit trinity-meta-2

DESCRIPTION="The aRts pipeline builder and other tools"

IUSE="alsa akode audiofile mpeg xine"

DEPEND="=trinity-base/arts-${PV}
	alsa? ( media-libs/alsa-lib )
	akode? ( =media-libs/akode-${PV} )
	audiofile? ( media-libs/audiofile )
	xine? ( media-libs/xine-lib )
	vorbis? ( media-libs/libvorbis )"
RDEPEND=" ${DEPEND}"

src_configure() {
	mycmakeargs=(
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
