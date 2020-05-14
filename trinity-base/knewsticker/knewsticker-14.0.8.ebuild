# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdenetwork"

inherit trinity-meta-2

DESCRIPTION="kicker plugin: rss news ticker"

DEPEND="=trinity-base/librss-${PV}"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		-DCMAKE_CXX_FLAGS="${CXXFLAGS} -I${TDEDIR}/include/rss"
		)
	trinity-meta-2_src_configure
}
