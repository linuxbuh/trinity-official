# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="dependencies"
TRINITY_MODULE_NAME="tqtinterface"

inherit trinity-base-2

DESCRIPTION="Interface and abstraction library for TQt and Trinity"
HOMEPAGE="http://www.trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"

IUSE="+opengl"

DEPEND="=dev-tqt/tqt-${PV}[opengl=]
	opengl? ( virtual/glu )"
RDEPEND="${DEPEND}"

pkg_setup() {
	export TQTDIR="/usr/tqt3"
}

src_configure() {
	mycmakeargs=(
		-DQT_PREFIX_DIR="${TQTDIR}"
	)

	 cmake-utils_src_configure
}
