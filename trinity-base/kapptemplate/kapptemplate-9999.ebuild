# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdesdk"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="admin translations"

inherit trinity-meta-2

DESCRIPTION="Creates a framework to develop a Trinity application"
HOMEPAGE="https://trinitydesktop.org/"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi
IUSE=""

DEPEND="
	~trinity-base/libkcal-${PV}
	~trinity-base/libtdepim-${PV}
"

RDEPEND="${DEPEND}"

src_prepare() {
	trinity-admin-prepare
	cmake_src_prepare
}
