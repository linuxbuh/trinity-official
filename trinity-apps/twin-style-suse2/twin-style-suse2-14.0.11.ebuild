# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="never"

TRINITY_LANGS="bg bs cs cy da de el en_GB en_US es et fi fr
		he hi hr hu id it ja km ko lo lt nb nl pa pl
		pt_BR pt ro ru sk sl sr sv ta tr uk zh_CN zh_TW"

TRINITY_MODULE_TYPE="applications/themes"
inherit trinity-base-2

DESCRIPTION="TWin decoration theme from SUSE 9.3/10.0/10.1"
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
