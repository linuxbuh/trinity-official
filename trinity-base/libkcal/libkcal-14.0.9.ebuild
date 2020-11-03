# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdepim"

inherit trinity-meta-2

DESCRIPTION="Trinity kcal library for KOrganizer etc"
LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

DEPEND="
	dev-libs/libical
	=trinity-base/ktnef-${PV}
	=trinity-base/libkmime-${PV}"
RDEPEND="${DEPEND}"

TSM_EXTRACT_ALSO="libemailfunctions/ libtdepim/ libkmime/ ktnef/"
