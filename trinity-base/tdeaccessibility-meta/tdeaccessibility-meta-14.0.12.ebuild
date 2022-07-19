# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Trinity Software meta package for tdeaccessibility"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="metapackage"
SLOT="14"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="arts"

RDEPEND="
	~trinity-base/kmag-${PV}
	~trinity-base/kmouth-${PV}
	~trinity-base/kbstateapplet-${PV}
	~trinity-base/kttsd-${PV}
	~trinity-base/kmousetool-${PV}
	arts? ( ~trinity-base/ksayit-${PV} )
	~trinity-base/tdeaccessibility-iconthemes-${PV}
	~trinity-base/tdeaccessibility-doc-${PV}
"
