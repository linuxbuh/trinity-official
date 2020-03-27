# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="bg cs de es fr hu id it ja nl pl pt_BR ru sv"

inherit trinity-base-2

DESCRIPTION="Minimize applications to the TDE system tray"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

need-trinity

SLOT="${TRINITY_VER}"

src_configure() {
	mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
	)

	trinity-base-2_src_configure
}