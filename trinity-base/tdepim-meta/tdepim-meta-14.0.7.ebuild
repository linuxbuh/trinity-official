# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit trinity-functions-2

set-trinityver

DESCRIPTION="Metapackage Trinity Software Development Kit (SDK)"
HOMEPAGE="http://www.trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="${TRINITY_VER}"

KEYWORDS="~amd64 ~x86"

RDEPEND="
	=trinity-base/certmanager-${PV}
	=trinity-base/akregator-${PV}
	=trinity-base/kalarm-${PV}
	=trinity-base/kandy-${PV}
	=trinity-base/kgantt-${PV}
	=trinity-base/kmail-${PV}
	=trinity-base/kmailcvt-${PV}
	=trinity-base/kmobile-${PV}
	=trinity-base/knode-${PV}
	=trinity-base/knotes-${PV}
	=trinity-base/kontact-${PV}
	=trinity-base/korganizer-${PV}
	=trinity-base/konsolekalendar-${PV}
	=trinity-base/ktnef-${PV}
	=trinity-base/kaddressbook-${PV}
	=trinity-base/tderesources-${PV}
	=trinity-base/tdepim-tdeioslaves-${PV}
	=trinity-base/tdepim-doc-${PV}
	"
