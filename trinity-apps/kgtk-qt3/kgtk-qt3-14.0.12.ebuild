# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="cs de es en_GB fr nl pl pt_BR ru zh_CN"
TRINITY_MODULE_TYPE="applications/themes"
inherit trinity-base-2

DESCRIPTION="TDE dialogs in GTK 2.x applications"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="gtk tde tqt"

DEPEND="
	gtk? ( x11-libs/gtk+:2 )
	tqt? ( ~dev-tqt/tqtinterface-${PV} )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_KGTK_TQT="$(usex tqt)"
		-DBUILD_KGTK_TDE="$(usex tde)"
		-DBUILD_KGTK_GTK2="$(usex gtk)"
	)

	trinity-base-2_src_configure
}
