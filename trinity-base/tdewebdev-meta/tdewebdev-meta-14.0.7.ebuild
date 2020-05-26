# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit trinity-functions-2

set-trinityver

DESCRIPTION="Trinity Software meta package for web development (tdewebdev)"
HOMEPAGE="http://www.trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="${TRINITY_VER}"

KEYWORDS="~amd64 ~x86"

RDEPEND="
	=trinity-base/tdefilereplace-${PV}
	=trinity-base/quanta-${PV}
	=trinity-base/kimagemapeditor-${PV}
	=trinity-base/klinkstatus-${PV}
	=trinity-base/kommander-${PV}
	=trinity-base/kxsldbg-${PV}
	=trinity-base/tdewebdev-doc-${PV}
"
