# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdegames"

inherit trinity-meta-2

need-arts yes

DESCRIPTION="Minigolf Game by Trinity"

MY_DEPEND="~trinity-base/libtdegames-${PV}"
DEPEND+=" ${MY_DEPEND}"
RDEPEND+=" ${MY_DEPEND}"

TSM_EXTRACT_ALSO="libtdegames/"
