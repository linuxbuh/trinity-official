# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="never"

TRINITY_LANGS="de nl"

TRINITY_MODULE_TYPE="applications/themes"
inherit trinity-base-2

DESCRIPTION="Domino widget style for TDE"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

src_configure() {
	local mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
	)
	trinity-base-2_src_configure
}
