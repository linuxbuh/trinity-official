# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

DESCRIPTION="kicker applet for Trinity and X clipboard management"
KEYWORDS="~amd64 ~x86"
DEPEND="x11-libs/libXfixes"

src_configure() {
	mycmakeargs=(
		-DWITH_XFIXES=ON
	)

	trinity-meta-2_src_configure
}