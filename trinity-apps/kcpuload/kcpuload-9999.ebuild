# Copyright 2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="de"

TRINITY_MODULE_TYPE="applications/utilities"
inherit trinity-base-2

DESCRIPTION="A small CPU meter for Kicker"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi

src_configure() {
	local mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
	)
	trinity-base-2_src_configure
}
