# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdebase"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="translations/"
inherit trinity-meta-2

DESCRIPTION="The Trinity application starter panel, capable of applets and extensions"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="xcomposite hwlib"

DEPEND="~trinity-base/libkonq-${PV}
	~trinity-base/tdebase-data-${PV}
	~dev-libs/dbus-tqt-${PV}
	xcomposite? ( x11-libs/libXrender
		x11-libs/libXfixes
		x11-libs/libXcomposite )"

RDEPEND="${DEPEND}
	~trinity-base/kmenuedit-${PV}"

src_configure() {
	local mycmakeargs=(
		-DWITH_XFIXES="$(usex xcomposite)"
		-DWITH_XRENDER="$(usex xcomposite)"
		-DWITH_XCOMPOSITE="$(usex xcomposite)"
		-DWITH_TDEHWLIB="$(usex hwlib)"
	)

	trinity-meta-2_src_configure
}
