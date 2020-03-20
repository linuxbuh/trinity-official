# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"
TRINITY_LANGS="cs de en es fr nb nl pl sv"
TRINITY_DOC_LANGS="en"

inherit trinity-base-2

DESCRIPTION="A TDE GUI frontend to lm-sensors"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

DEPEND="sys-apps/lm-sensors"
RDEPEND="${DEPEND}"

need-trinity 14.1.0

SLOT="${TRINITY_VER}"
