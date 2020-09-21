# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="be br ca cs cy da de el en_GB es et fi
		fr ga gl he hu it ja nb nl pa pl pt
		pt_BR ru sr sr@Latn sv tr zh_CN"

TRINITY_DOC_LANGS="da es it pt sv"

inherit trinity-base-2

DESCRIPTION="KPlayer is a TDE media player based on mplayer."
HOMEPAGE="https://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

need-trinity

SLOT="${TRINITY_VER}"

DEPEND+=" media-video/mplayer"
RDEPEND+=" ${DEPEND}"

src_configure() {
	mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
	)

	trinity-base-2_src_configure
}
