# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="be de fi sk uk bg cs el he ru sv"

inherit trinity-base-2

DESCRIPTION="Keyboard layout indicator for TDE"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

need-trinity

KEYWORDS="~amd64 ~x86"
SLOT="${TRINITY_VER}"

DEPEND="=trinity-base/tdelibs-${PV}"

RDEPEND="$DEPEND"

src_configure() {
	mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
	)

	trinity-base-2_src_configure
}
