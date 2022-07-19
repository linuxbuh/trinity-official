# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Trinity Software koffice meta package"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="metapackage"
SLOT="14"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

RDEPEND="
	~trinity-apps/chalk-${PV}
	~trinity-apps/karbon-${PV}
	~trinity-apps/kchart-${PV}
	~trinity-apps/kexi-${PV}
	~trinity-apps/kformula-${PV}
	~trinity-apps/kivio-${PV}
	~trinity-apps/koffice-libs-${PV}
	~trinity-apps/koshell-${PV}
	~trinity-apps/kplato-${PV}
	~trinity-apps/kpresenter-${PV}
	~trinity-apps/kspread-${PV}
	~trinity-apps/kugar-${PV}
	~trinity-apps/kword-${PV}
	~trinity-apps/koffice-doc-${PV}
	~trinity-apps/koffice-i18n-${PV}
"
