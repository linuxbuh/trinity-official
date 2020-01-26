# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdeaddons"

inherit trinity-meta-2

DESCRIPTION="Various plugins for Konqueror."

IUSE+="arts"

DEPEND="=trinity-base/konqueror-${PV}
	arts? ( =trinity-base/arts-${PV} )"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		-DWITH_ARTS="$(usex arts)"
	)

	trinity-meta-2_src_configure
}
