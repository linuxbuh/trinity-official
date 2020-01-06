# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_TYPE="dependencies"
TRINITY_MODULE_NAME="dbus-1-tqt"

inherit trinity-base-2

DESCRIPTION="D-BUS TQt bindings"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

DEPEND="sys-apps/dbus
	=dev-tqt/tqtinterface-${PV}"
RDEPEND="$DEPEND"

src_configure() {
	cmake-utils_src_configure
}
