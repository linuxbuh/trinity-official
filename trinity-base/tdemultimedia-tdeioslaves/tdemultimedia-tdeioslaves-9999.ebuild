# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdemultimedia"

inherit trinity-meta-2

TSM_EXTRACT="tdeioslave"
TRINITY_SUBMODULE="tdeioslave"

DESCRIPTION="Multimedia Trinity TDEIOslaves"

IUSE="flac cdparanoia"

DEPEND="
	flac? ( media-libs/flac )
	cdparanoia? ( media-sound/cdparanoia )"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		-DWITH_FLAC=$(usex flac)
		-DWITH_CDPARANOIA=$(usex cdparanoia)
	)

	trinity-meta-2_src_configure
}
