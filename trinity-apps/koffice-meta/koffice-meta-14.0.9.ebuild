# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit trinity-functions-2

set-trinityver

DESCRIPTION="Trinity Software koffice meta package"
HOMEPAGE="http://www.trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="${TRINITY_VER}"

KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND="
	=trinity-apps/karbon-${PV}
	=trinity-apps/kchart-${PV}
	=trinity-apps/kexi-${PV}
	=trinity-apps/kformula-${PV}
	=trinity-apps/kivio-${PV}
	=trinity-apps/koffice-libs-${PV}
	=trinity-apps/koshell-${PV}
	=trinity-apps/kplato-${PV}
	=trinity-apps/kpresenter-${PV}
	=trinity-apps/kspread-${PV}
	=trinity-apps/kugar-${PV}
	=trinity-apps/kword-${PV}
	=trinity-apps/koffice-doc-${PV}
"
