# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_TYPE="applications"
TRINITY_BUILD_ADMIN="yes"
inherit trinity-base-2

set-trinityver

DESCRIPTION="Image viewer for TDE"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="GPL-2+"
SLOT="${TRINITY_VER}"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi
IUSE=""

DEPEND="
	~trinity-base/tdelibs-${PV}
	~trinity-apps/gwenview-i18n-${PV}
	media-gfx/exiv2
"
RDEPEND="${DEPEND}"

need-trinity
