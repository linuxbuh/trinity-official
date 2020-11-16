# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdegames"
TRINITY_NEED_ARTS="yes"
inherit trinity-meta-2

DESCRIPTION="Trinity Space Game"

DEPEND="~trinity-base/libtdegames-${PV}"
RDEPEND="${DEPEND}"

TSM_EXTRACT_ALSO="libtdegames/"
