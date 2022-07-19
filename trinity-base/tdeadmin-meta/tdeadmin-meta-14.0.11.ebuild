# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Trinity Software meta package for tdeadmin"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="metapackage"
SLOT="14"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="arts"

RDEPEND="
	~trinity-base/kcron-${PV}
	~trinity-base/knetworkconf-${PV}
	~trinity-base/kuser-${PV}
	~trinity-base/tdefile-plugins-${PV}
	~trinity-base/tdeadmin-doc-${PV}
"
