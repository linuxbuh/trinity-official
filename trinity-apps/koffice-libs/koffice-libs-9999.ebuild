# Copyright 1999-20120 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="koffice"
CHECK_ADMIN="yes"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="Shared KOffice libraries for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
SLOT="${TRINITY_VER}"
IUSE=""

DEPEND="
	=trinity-base/tdelibs-${PV}
"

RDEPEND="$DEPEND"

TRINITY_SUBMODULE="lib lib/kopainter lib/kopalette"

need-trinity

CXXFLAGS+=" -std=c++11 "
