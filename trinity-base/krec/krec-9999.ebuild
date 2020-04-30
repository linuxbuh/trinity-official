# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdemultimedia"

inherit trinity-meta-2

IUSE="encode mp3 vorbis"

DESCRIPTION="TDE sound recorder"

DEPEND="=trinity-base/tdemultimedia-arts-${PV}
	encode? ( 
		mp3? ( media-sound/lame )
		vorbis? ( media-libs/libvorbis )
	)
"
RDEPEND="${DEPEND}"

REQUIRED_USE="
	encode? ( 
		|| ( mp3 vorbis )
	)
	mp3? ( encode )
	vorbis? ( encode )
"

src_configure() {
	mycmakeargs=(
		-DWITH_LAME="$(usex mp3)"
		-DWITH_VORBIS="$(usex vorbis)"
	)

	trinity-meta-2_src_configure
}
