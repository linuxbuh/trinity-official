# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"
CHECK_ADMIN="yes"

TRINITY_LANGS="fr nl sv zh_CN"

inherit trinity-base-2

DESCRIPTION="Small, easy to use, yet powerful calculator for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

RDEPEND="sci-libs/libqalculate
	sci-libs/cln"
DEPEND="${RDEPEND}
	sys-devel/flex
	sys-devel/bison"

need-trinity

SLOT="${TRINITY_VER}"
