# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="tdetoys metapackage - merge this to pull in all tdetoys-derived packages"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="metapackage"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

RDEPEND="
	~trinity-base/amor-${PV}
	~trinity-base/eyesapplet-${PV}
	~trinity-base/fifteenapplet-${PV}
	~trinity-base/kmoon-${PV}
	~trinity-base/kodo-${PV}
	~trinity-base/kteatime-${PV}
	~trinity-base/ktux-${PV}
	~trinity-base/kweather-${PV}
	~trinity-base/kworldclock-${PV}
	~trinity-base/tdetoys-doc-${PV}
"
