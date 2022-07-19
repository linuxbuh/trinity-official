# Copyright 1999-2021 Gentoo Foundation
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdemultimedia"
TRINITY_MODULE_TYPE="core"

inherit trinity-meta-2

DESCRIPTION="KDE library for CDDB"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
