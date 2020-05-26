# Copyright 1999-2020 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdesdk"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="Creates a framework to develop a Trinity application"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

KEYWORDS="~amd64 ~x86"
SLOT="${TRINITY_VER}"
IUSE=""

DEPEND="
	=trinity-base/tdelibs-${PV}
	=trinity-base/libkcal-${PV}
	=trinity-base/libtdepim-${PV}
"

RDEPEND="$DEPEND"

need-trinity

src_prepare() {
	trinity-admin-prepare
	cmake-utils_src_prepare
}
