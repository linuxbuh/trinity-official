# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_MODULE_TYPE="applications/graphics"
TRINITY_BUILD_ADMIN="yes"
TRINITY_LANGS="ar bg br ca cs cy da de el en_GB es et fa fi fr gl he hu is it ja ka lt
		mk ms mt nb nds nl nn pa pl pt pt_BR ro ru rw sk sl sr sr@Latn sv ta th
		tr uk vi zh_CN zh_TW"
inherit flag-o-matic trinity-base-2

DESCRIPTION="Digital photo management application [Trinity]"
HOMEPAGE="https://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="14"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE=""
DEPEND="media-libs/lcms:2
	media-libs/libgphoto2
	media-libs/jasper
	~trinity-apps/libkexiv2-${PV}
	~trinity-apps/libkdcraw-${PV}
	~trinity-apps/libkipi-${PV}
	dev-db/sqlite
"

RDEPEND="${DEPEND}"
