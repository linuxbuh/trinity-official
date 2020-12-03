# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdemultimedia"
inherit trinity-meta-2

DESCRIPTION="Trinity mixer GUI"

IUSE="alsa"

DEPEND="alsa? ( media-libs/alsa-lib )"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWITH_ALSA="$(usex alsa)"
	)

	trinity-meta-2_src_configure
}
