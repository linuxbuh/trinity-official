# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdewebdev"
CHECK_ADMIN="yes"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="visual dialog builder and executor tool [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="GPL-2 LGPL-2"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
SLOT="${TRINITY_VER}"
IUSE=""

DEPEND="
	=trinity-base/tdelibs-${PV}
	dev-libs/libxslt
	dev-libs/libgcrypt
	dev-libs/libxml2
	app-text/htmltidy
"

RDEPEND="$DEPEND"

need-trinity

CXXFLAGS+=" -std=c++11 "

src_prepare() {
	source ${FILESDIR}/conv-func
	conv_f
	trinity-gen-configure
	eapply_user
}
