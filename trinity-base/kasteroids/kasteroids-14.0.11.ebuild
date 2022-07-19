# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_NEED_ARTS="yes"
TRINITY_MODULE_NAME="tdegames"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="libtdegames/"
inherit trinity-meta-2

DESCRIPTION="Trinity Space Game"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="~trinity-base/libtdegames-${PV}"
RDEPEND="${DEPEND}"
