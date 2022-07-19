# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="ar ca de es fr nb pl pt_BR sv zh_CN zh_TW"
TRINITY_MODULE_TYPE="applications/settings"
inherit trinity-base-2

DESCRIPTION="User friendly TDE frontend for wireless network connection"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

RDEPEND="
	net-wireless/wireless-tools
	|| (
		net-misc/dhcp
		net-misc/dhcpcd
	)
"
