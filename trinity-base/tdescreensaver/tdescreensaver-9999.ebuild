# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdebase"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="translations/"
inherit trinity-meta-2

DESCRIPTION="Trinity screensaver framework"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi
IUSE="opengl +krootbacking"

DEPEND="x11-libs/libXt
	opengl? ( virtual/opengl )
	krootbacking? ( ~trinity-base/krootbacking-${PV} )"
RDEPEND="${DEPEND}"

src_configure () {
	local mycmakeargs=(
		-DWITH_OPENGL="$(usex opengl)"
	)

	trinity-meta-2_src_configure
}
