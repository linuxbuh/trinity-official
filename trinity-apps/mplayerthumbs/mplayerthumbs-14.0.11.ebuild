# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="de"
TRINITY_MODULE_TYPE="applications/multimedia"
inherit trinity-base-2

DESCRIPTION="MPlayer based thumbnail generator for TDE"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="+strips"

RDEPEND="media-video/mplayer"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
		-DWITH_STRIPS_SUPPORT="$(usex strips)"
	)

	trinity-base-2_src_configure
}
