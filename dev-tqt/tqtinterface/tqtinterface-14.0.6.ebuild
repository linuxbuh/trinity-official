# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_TYPE="dependencies"
TRINITY_MODULE_NAME="tqtinterface"

inherit trinity-base-2

DESCRIPTION="Interface and abstraction library for TQt and Trinity"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"

DEPEND="~dev-tqt/tqt-${PV}"
RDEPEND="${DEPEND}"

pkg_setup() {
	export QTDIR="/usr/tqt3"
}

src_configure() {
	mycmakeargs=(
		-DUSE_QT3=ON
		-DQT_PREFIX_DIR="$QTDIR"
	 )

	 cmake-utils_src_configure
}
