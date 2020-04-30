# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdemultimedia"

inherit trinity-meta-2

IUSE="encode mp3 vorbis flac"

DESCRIPTION="TDE CD ripper and audio encoder frontend"

DEPEND="=trinity-base/libkcddb-${PV}
	media-sound/cdparanoia"
RDEPEND="${DEPEND}
	=trinity-base/tdemultimedia-tdeioslaves-${PV}
	encode? ( 
		mp3? ( media-sound/lame )
		flac? ( media-libs/flac )
		vorbis? ( media-sound/vorbis-tools )
	)
"

REQUIRED_USE="
	encode? ( 
		|| ( mp3 vorbis flac )
	)
	mp3? ( encode )
	vorbis? ( encode )
	flac? ( encode )
"

src_configure() {
	mycmakeargs=(
		-DWITH_LAME="$(usex mp3)"
		-DWITH_VORBIS="$(usex vorbis)"
		-DWITH_FLAC="$(usex flac)"

	)

	trinity-meta-2_src_configure
}
