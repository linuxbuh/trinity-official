# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="5"
TRINITY_MODULE_TYPE="dependencies"
TRINITY_MODULE_NAME="${PN}"

inherit trinity-base

DESCRIPTION="Interface and abstraction library for TQt and Trinity"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="GPL-2"
KEYWORDS=
IUSE="+tqt"
REQUIRED_USE="^^ ( tqt )"
SLOT="0"

DEPEND="tqt? ( >=dev-tqt/tqt-9999 )"
RDEPEND="${DEPEND}"

pkg_setup() {
	use tqt && export TQTDIR="/usr/tqt3"
}

src_configure() {
	mycmakeargs=(
	    -DUSE_QT3=ON
		-DQT_PREFIX_DIR="$TQTDIR"
	 )

	 cmake-utils_src_configure
}
