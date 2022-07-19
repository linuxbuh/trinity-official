# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_NEED_ARTS="optional"
TRINITY_MODULE_NAME="tdegames"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="libtdegames/"
inherit trinity-meta-2

# Needs some dependency to play "au" sounds.

DESCRIPTION="Trinity Bounce Ball Game"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="~trinity-base/libtdegames-${PV}"
RDEPEND="${DEPEND}"
