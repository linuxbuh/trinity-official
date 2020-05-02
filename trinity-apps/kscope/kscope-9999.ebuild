# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="de zh_CN"

inherit trinity-base-2

DESCRIPTION="A TDE front-end to Cscope"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

RDEPEND="=trinity-base/kate-${PV}
	media-gfx/graphviz
	dev-util/ctags
	dev-util/cscope"
DEPEND="${RDEPEND}
	sys-devel/flex
	sys-devel/bison"

need-trinity

SLOT="${TRINITY_VER}"

src_configure() {
	mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
	)

	trinity-base-2_src_configure
}
