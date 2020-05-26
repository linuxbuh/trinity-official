# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="dependencies"
TRINITY_MODULE_NAME="${PN}"

inherit trinity-base-2

DESCRIPTION="Avahi TQt bindings"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"

DEPEND="net-dns/avahi
	=dev-tqt/tqtinterface-${PV}"
RDEPEND="${DEPEND}"

src_configure() {
	cmake-utils_src_configure
}
