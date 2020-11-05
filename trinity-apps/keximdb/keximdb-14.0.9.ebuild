# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_HANDBOOK="optional"

inherit trinity-base-2

DESCRIPTION="Plugin for converting MS Access MDB databases for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

RDEPEND=""
DEPEND="${RDEPEND}
	sys-devel/flex
	sys-devel/bison"

need-trinity

SLOT="${TRINITY_VER}"
