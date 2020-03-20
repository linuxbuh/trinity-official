# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

need-arts optional

DESCRIPTION="Trinity hotkey daemon"

MY_DEPEND="x11-libs/libXtst"
DEPEND+=" ${MY_DEPEND}"
RDEPEND+=" ${MY_DEPEND}"

src_configure() {
	mycmakeargs=(
		-DWITH_XTEST=ON
	)

	trinity-meta-2_src_configure
}
