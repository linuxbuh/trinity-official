# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="bg bn br ca cs cy da de el es et fi fr ga
		he hi hu it ja lt mk nb nl nn pa pl pt_BR
		pt ru sr@Latn sr sv tr xh zh_CN zu"

inherit trinity-base-2

DESCRIPTION="RPN scientific calculator for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

RDEPEND=""
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
