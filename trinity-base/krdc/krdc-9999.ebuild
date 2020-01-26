# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdenetwork"

inherit trinity-meta-2

DESCRIPTION="Trinity remote desktop connection (RDP and VNC) client"
IUSE="rdp slp"

DEPEND="
	dev-libs/openssl:=
	slp? ( net-libs/openslp )
	x11-libs/libXext"
RDEPEND="${DEPEND}
	rdp? ( net-misc/rdesktop )"

src_configure() {
	mycmakeargs=(
		-DWITH_SLP="$(usex slp)"
	)

	trinity-meta-2_src_configure
}
