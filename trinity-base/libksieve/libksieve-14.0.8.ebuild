# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdepim"

inherit trinity-meta-2

DESCRIPTION="TDE library to enable support for sieve, used by KMail"
LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~x86"

DEPEND="
	=trinity-base/libtdepim-${PV}
"

RDEPEND="$DEPEND"
