# Copyright 1999-20120 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdeaccessibility"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="A type-and-say TDE frontend for speech synthesizers"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="GPL-2 LGPL-2"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
SLOT="${TRINITY_VER}"
IUSE="arts"

DEPEND="
	=trinity-base/tdelibs-${PV}
"

RDEPEND="$DEPEND"

need-arts optional

need-trinity
