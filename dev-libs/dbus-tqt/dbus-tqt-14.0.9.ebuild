# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="dependencies"
TRINITY_MODULE_NAME="dbus-tqt"

inherit trinity-base-2

DESCRIPTION="D-BUS TQt bindings"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
SLOT="0"

DEPEND="sys-apps/dbus
	=dev-tqt/tqtinterface-${PV}"
RDEPEND="${DEPEND}"

src_configure() {
	cmake-utils_src_configure
}