# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdenetwork"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="VNC-compatible server to share Trinity desktops"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="
	dev-libs/openssl:=
	x11-libs/libXext
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWITH_SLP=OFF
	)

	trinity-meta-2_src_configure
}
