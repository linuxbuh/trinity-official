# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdegames"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="libtdegames/"
inherit trinity-meta-2

DESCRIPTION="The japanese warehouse keeper game"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="~trinity-base/libtdegames-${PV}"
RDEPEND="${DEPEND}"
