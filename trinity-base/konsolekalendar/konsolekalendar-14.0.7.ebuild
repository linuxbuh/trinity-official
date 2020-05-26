# Copyright 1999-2020 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdepim"

inherit trinity-meta-2

DESCRIPTION="Trinity alarm message, command and email scheduler"
LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~x86"
IUSE+=""

DEPEND+="=trinity-base/libtdepim-${PV}"
RDEPEND+=" ${COMMON_DEPEND}"

TSM_EXTRACT_ALSO="libkcal/ libtdepim/"
