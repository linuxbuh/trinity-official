# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdegames"

inherit trinity-meta-2

need-arts optional

# Needs some dependency to play "au" sounds.

DESCRIPTION="Trinity Bounce Ball Game"

MY_DEPEND="=trinity-base/libtdegames-${PV}"
DEPEND+=" ${MY_DEPEND}"
RDEPEND+=" ${MY_DEPEND}"