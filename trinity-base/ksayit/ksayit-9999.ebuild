# Copyright 1999-20120 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdeaccessibility"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="A frontend for the TDE Text-to-Speech system"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="GPL-2 LGPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="${TRINITY_VER}"
IUSE=""

DEPEND="
	=trinity-base/tdelibs-${PV}
	=trinity-base/kttsd-${PV}
"

RDEPEND="$DEPEND"

need-trinity

src_configure() {
	myconf=(
		--enable-ksayit-audio-plugins
		)
	trinity-econf ${myconf[@]}
}