# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdepim"

inherit trinity-meta-2

DESCRIPTION="Trinity pim resource plugins"
LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~x86"

#TSM_EXTRACT_ALSO="libtdepim/"
DEPEND="=trinity-base/libtdepim-${PV}
	=trinity-base/libkcal-${PV}
	=trinity-base/knotes-${PV}"
RDEPEND="$DEPEND"

TSM_EXTRACT_ALSO="libkcal libtdepim"
