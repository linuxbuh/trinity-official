# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_NEED_ARTS="optional"
TRINITY_MODULE_NAME="tdebase"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="translations/"
inherit trinity-meta-2

DESCRIPTION="Trinity hotkey daemon"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="x11-libs/libXtst"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWITH_XTEST=ON
	)

	trinity-meta-2_src_configure
}
