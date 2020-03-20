# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdepim"

inherit trinity-meta-2

DESCRIPTION="Trinity news feed aggregator."

DEPEND="
	=trinity-base/ktnef-${PV}
	=trinity-base/libkmime-${PV}
	=trinity-base/libtdepim-${PV}
	=trinity-base/libkcal-${PV}"
RDEPEND="${DEPEND}"

TSM_EXTRACT_ALSO="libtdepim/"
