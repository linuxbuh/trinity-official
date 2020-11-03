# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdegraphics"

inherit trinity-meta-2

DESCRIPTION="SVG viewer library and embeddable kpart"

DEPEND="media-libs/freetype
	media-libs/fontconfig
	media-libs/libart_lgpl
	media-libs/lcms:0
	dev-libs/fribidi"
RDEPEND="${DEPEND}"
