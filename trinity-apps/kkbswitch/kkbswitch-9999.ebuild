# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_HANDBOOK="optional"
TRINITY_MODULE_TYPE="applications/settings"
inherit trinity-base-2

DESCRIPTION="Keyboard layout indicator for TDE"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi

DEPEND="
	virtual/acl
	net-dns/libidn
	dev-libs/openssl
	x11-libs/libxkbfile
"
RDEPEND="${DEPEND}"
