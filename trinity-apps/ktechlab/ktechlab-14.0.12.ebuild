# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_MODULE_TYPE="applications/development"
inherit trinity-base-2

DESCRIPTION="Circuit simulator for microcontrollers and electronics [Trinity]"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="+handbook"

DEPEND="
	dev-embedded/gpsim
"
RDEPEND="${DEPEND}"
