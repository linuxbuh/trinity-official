# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="ar bg ca da de el en_GB es et fi fr gl he
	hu it ja ka ko pa pt ru sr sr@Latn sv tr zh_CN zh_TW"

TRINITY_DOC_LANGS="da es et it pt ru sv"

TRINITY_MODULE_TYPE="applications/internet"
inherit trinity-base-2

DESCRIPTION="A user friendly IRC Client for Trinity"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi
IUSE="xscreensaver"

DEPEND="xscreensaver? ( x11-libs/libXScrnSaver )"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWITH_XSCREENSAVER="$(usex xscreensaver)"
	)
	trinity-base-2_src_configure
}
