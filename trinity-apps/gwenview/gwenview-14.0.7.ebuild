# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_TYPE="applications"

inherit trinity-base-2

set-trinityver

DESCRIPTION="Gwenview is an image viewer for TDE"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="GPL-2 LGPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="${TRINITY_VER}"
IUSE=""

DEPEND="
	>=trinity-base/tdelibs-${PV}
	=trinity-apps/gwenview-i18n-${PV}
"
RDEPEND="$DEPEND"

need-trinity
