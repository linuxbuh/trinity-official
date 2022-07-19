# Copyright 2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="de"

TRINITY_MODULE_TYPE="applications/tdeio"
inherit trinity-base-2

DESCRIPTION="Sword TDEIO plugin"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi

DEPEND="app-text/sword"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
	)
	trinity-base-2_src_configure
}

pkg_postinst() {
	elog "It is recommended that you have modules installed for sword."
	elog "Gentoo provides the \"sword-modules\" package for convenience:"
	elog "\temerge sword-modules"
}
