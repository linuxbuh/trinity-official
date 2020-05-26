# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdenetwork"

inherit trinity-meta-2

DESCRIPTION="VNC-compatible server to share Trinity desktops"

IUSE="slp libressl"

DEPEND="!libressl? ( dev-libs/openssl:= )
	libressl? ( dev-libs/libressl:= )
	slp? ( net-libs/openslp )
	x11-libs/libXext"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		-DWITH_SLP="$(usex slp)"
	)

	trinity-meta-2_src_configure
}
