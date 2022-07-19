# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdebase"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="translations/"
inherit trinity-meta-2

DESCRIPTION="KControl module to configure and switch keyboard layouts"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="x11-libs/libXtst"
RDEPEND="${DEPEND}
	x11-misc/xkeyboard-config
	x11-apps/setxkbmap"

src_configure() {
	local mycmakeargs=(
		-DWITH_XTEST=ON
	)

	trinity-meta-2_src_configure
}
