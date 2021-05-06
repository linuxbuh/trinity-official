# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Trinity Software meta package for web development (tdewebdev)"
HOMEPAGE="https://trinitydesktop.org/"
SRC_URI="http://www.mirrorservice.org/sites/trinitydesktop.org/trinity/releases/R${PV}/main/core/tdewebdev-trinity-${PV}.tar.xz"
LICENSE="metapackage"
SLOT="14"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi

RDEPEND="
	~trinity-base/quanta-${PV}
	~trinity-base/kimagemapeditor-${PV}
	~trinity-base/klinkstatus-${PV}
	~trinity-base/kommander-${PV}
	~trinity-base/kxsldbg-${PV}
	~trinity-base/tdewebdev-doc-${PV}
"
