# Copyright 1999-2021 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdegraphics"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="SVG viewer library and embeddable kpart"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi

DEPEND="
	dev-libs/fribidi
	media-libs/fontconfig
	media-libs/freetype
	media-libs/lcms:2
	~media-libs/libart_lgpl-${PV}
"
RDEPEND="${DEPEND}"
