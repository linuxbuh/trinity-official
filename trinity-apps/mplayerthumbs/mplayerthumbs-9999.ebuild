# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="de"
inherit trinity-base-2

DESCRIPTION="MPlayer based thumbnail generator for TDE"
HOMEPAGE="https://trinitydesktop.org/"

need-trinity

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="${TRINITY_VER}"
IUSE+=" +strips"

RDEPEND+=" media-video/mplayer"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
		-DWITH_STRIPS_SUPPORT="$(usex strips)"
	)

	trinity-base-2_src_configure
}
