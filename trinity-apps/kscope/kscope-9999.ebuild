# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="de zh_CN"
inherit trinity-base-2

DESCRIPTION="TDE front-end to Cscope"
HOMEPAGE="https://trinitydesktop.org/"

need-trinity

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="${TRINITY_VER}"

RDEPEND="
	media-gfx/graphviz
	dev-util/cscope
	dev-util/ctags
	~trinity-base/kate-${PV}
"
DEPEND="${RDEPEND}"
BDEPEND="
	sys-devel/bison
	sys-devel/flex
"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
	)

	trinity-base-2_src_configure
}
