# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_TYPE="dependencies"
TRINITY_MODULE_NAME="${PN}"
inherit trinity-base-2

DESCRIPTION="Avahi TQt bindings"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="
	~dev-tqt/tqtinterface-${PV}
	net-dns/avahi"
RDEPEND="${DEPEND}"

src_configure() {
	cmake_src_configure
}
