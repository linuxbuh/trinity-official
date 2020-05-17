# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdepim"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="Trinity news feed aggregator."

LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~x86"
SLOT="${TRINITY_VER}"

DEPEND="
	=trinity-base/libtdepim-${PV}
	=trinity-base/ktnef-${PV}
	=trinity-base/libkmime-${PV}
	=trinity-base/libtdepim-${PV}
	=trinity-base/libkcal-${PV}"
RDEPEND="${DEPEND}"

TSM_EXTRACT_ALSO="libtdepim"
