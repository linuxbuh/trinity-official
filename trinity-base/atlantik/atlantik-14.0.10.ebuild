# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdegames"

inherit trinity-meta-2

DESCRIPTION="The Atlantic board game"
KEYWORDS="~amd64 ~x86"
SRC_URI="http://www.mirrorservice.org/sites/trinitydesktop.org/trinity/releases/R${PV}/main/core/tdegames-trinity-${PV}.tar.xz"

DEPEND="~trinity-base/libtdegames-${PV}"
RDEPEND="${DEPEND}"
