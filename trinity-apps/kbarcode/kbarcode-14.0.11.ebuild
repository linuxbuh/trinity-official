# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="de el es fi fr hu it nl pl sv tr"
TRINITY_MODULE_TYPE="applications/utilities"
inherit trinity-base-2

DESCRIPTION="Barcode and label printing application for TDE"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

# Native GNU Barcode support seems to be broken right now.
# The GNU Barcode binary is needed anyway.
IUSE="javascript native-gnu-barcode"

RDEPEND="
	app-text/barcode
	|| (
		media-gfx/imagemagick
		media-gfx/graphicsmagick
	)"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
		-DWITH_NATIVE_GNU_BARCODE="$(usex native-gnu-barcode)"
		-DWITH_JAVASCRIPT="$(usex javascript)"
	)

	trinity-base-2_src_configure
}
