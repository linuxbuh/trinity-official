# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="br cs da de el es et fi fr he hr hu is it ja
	nb nl nn pl pt pt_BR ro ru sk sl sv tr uk zh_TW"
TRINITY_MODULE_TYPE="applications/internet"
inherit trinity-base-2

DESCRIPTION="Email notification utility for TDE"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="asus +ssl"

# SSL support might need tdelibs build with +ssl USE.

src_configure() {
	local mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
		-DWITH_SSL="$(usex ssl)"
		-DWITH_MLED="$(usex asus)"
	)

	trinity-base-2_src_configure
}
