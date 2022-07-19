# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_MODULE_TYPE="libraries"
TRINITY_LANGS="ar br ca cs cy da de el en_GB es et fi fr ga gl is it ja lt mt
		nb nl pa pl pt pt_BR ru rw sk sl sr sr@Latn ta tr tr uk zh_CN"
inherit trinity-base-2

DESCRIPTION="A library for image plugins accross TDE applications [Trinity]"
HOMEPAGE="https://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="14"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE=""

DEPEND="virtual/jpeg
	virtual/acl
"

RDEPEND="${DEPEND}"
