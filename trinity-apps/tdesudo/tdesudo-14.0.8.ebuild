# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="de fr"

inherit trinity-base-2

DESCRIPTION="Sudo frontend for TDE"
KEYWORDS="~amd64 ~x86"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

need-trinity

SLOT="${TRINITY_VER}"

RDEPEND+=" app-admin/sudo"

src_configure() {
	mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
	)

	trinity-base-2_src_configure
}