# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdeaccessibility"
CHECK_ADMIN="yes"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="A monochromatic icons theme for TDE"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="GPL-2 LGPL-2"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
SLOT="${TRINITY_VER}"
IUSE=""

DEPEND="
	=trinity-base/tdelibs-${PV}
"

RDEPEND="$DEPEND"

TRINITY_SUBMODULE="IconThemes"

need-trinity
