# Copyright 1999-20120 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdewebdev"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="web link validity checker for TDE"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="GPL-2 LGPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="${TRINITY_VER}"
IUSE=""

DEPEND="
	=trinity-base/tdelibs-${PV}
	dev-libs/libxslt
	dev-libs/libgcrypt
	dev-libs/libxml2
	app-text/htmltidy
"

RDEPEND="$DEPEND"

need-trinity

CXXFLAGS+=" -std=c++11 "
