# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdegraphics"

inherit trinity-meta-2

DESCRIPTION="A fast and versatile image viewer for Trinity"
KEYWORDS="~amd64 ~x86"

DEPEND="x11-libs/libXext
	media-libs/imlib"
RDEPEND="${DEPEND}"