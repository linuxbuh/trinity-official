# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit trinity-functions-2

set-trinityver

DESCRIPTION="tdeaccessibility - merge this to pull in all tdeaccessiblity-derived packages"
HOMEPAGE="http://www.trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="${TRINITY_VER}"

KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND="
	=trinity-base/tde-icons-mono-${PV}
	=trinity-base/kbstate-${PV}
	=trinity-base/kmag-${PV}
	=trinity-base/kmousetool-${PV}
	=trinity-base/kmouth-${PV}
	=trinity-base/kttsd-${PV}
	=trinity-base/tdeaccessibility-doc-${PV}
"
