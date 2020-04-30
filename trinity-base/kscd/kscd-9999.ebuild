# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdemultimedia"

inherit trinity-meta-2

IUSE="alsa cdda"

DESCRIPTION="TDE CD player"

DEPEND="x11-libs/libXext
	=trinity-base/libkcddb-${PV}
	alsa? ( media-libs/alsa-lib )"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		-DWITH_ALSA="$(usex alsa)"
		-DWITH_KSCD_CDDA="$(usex cdda)"
	)

	trinity-meta-2_src_configure
}
