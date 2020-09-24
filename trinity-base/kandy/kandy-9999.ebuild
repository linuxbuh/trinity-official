# Copyright 1999-2020 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdepim"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="Trinity mobile phone utility"
LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
SLOT="${TRINITY_VER}"
IUSE+=""

DEPEND+="=trinity-base/libkmime-${PV}
	=trinity-base/ktnef-${PV}
	=trinity-base/libkcal-${PV}
	=trinity-base/libtdepim-${PV}"
RDEPEND+=" ${COMMON_DEPEND}"

TSM_EXTRACT_ALSO="libtdepim"
