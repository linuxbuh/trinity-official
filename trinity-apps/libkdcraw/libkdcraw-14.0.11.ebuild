# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_MODULE_TYPE="libraries"
TRINITY_LANGS="ca da de el es et is it ja ms nds nl pa pt pt_BR sk sr sr@Latn sv th uk"
inherit trinity-base-2

DESCRIPTION="Digital camera raw image library wrapper [Trinity]"
HOMEPAGE="https://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="14"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE=""

DEPEND="media-libs/lcms:2
	virtual/jpeg
"

RDEPEND="${DEPEND}"
