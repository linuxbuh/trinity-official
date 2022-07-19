# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Trinity Software meta package for web development (tdewebdev)"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="metapackage"
SLOT="14"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

RDEPEND="
	~trinity-base/quanta-${PV}
	~trinity-base/kimagemapeditor-${PV}
	~trinity-base/klinkstatus-${PV}
	~trinity-base/kommander-${PV}
	~trinity-base/kxsldbg-${PV}
	~trinity-base/tdefilereplace-${PV}
	~trinity-base/tdewebdev-doc-${PV}
"
