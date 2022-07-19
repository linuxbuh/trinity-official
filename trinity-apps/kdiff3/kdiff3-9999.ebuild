# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="ar az bg br ca cs cy da de el es et fr ga gl hi hu is it ja
	ka lt nb nl pl pt pt_BR ro ru rw sk sr sr@Latn sv ta tg tr uk zh_CN"
TRINITY_MODULE_TYPE="applications/development"
inherit trinity-base-2

DESCRIPTION="A diff and merge program for TDE"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi

src_configure() {
	local mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
	)

	trinity-base-2_src_configure
}
